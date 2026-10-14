"""
Recluster jets from PF candidates with fastjet, and recompute from the constituents the jet variables that the
ntuple stores (multiplicities and energy fractions).
"""
import awkward as ak
import fastjet
import numpy as np


def recluster(pt, eta, phi, mass, radius=0.8, pt_min=170.0, algorithm=fastjet.antikt_algorithm):
    
    #prepare cands for fastjet
    px, py, pz = pt * np.cos(phi), pt * np.sin(phi), pt * np.sinh(eta)
    energy = np.sqrt(px**2 + py**2 + pz**2 + mass**2)
    candidates = ak.zip({"px": px, "py": py, "pz": pz, "E": energy})

    cluster_sequence = fastjet.ClusterSequence(candidates, fastjet.JetDefinition(algorithm, radius))
    raw_jets = cluster_sequence.inclusive_jets(pt_min)
    cand_idx = cluster_sequence.constituent_index(pt_min)

    jet_pt = np.hypot(raw_jets.px, raw_jets.py)
    jets = ak.zip({
        "pt": jet_pt,
        "eta": np.arcsinh(raw_jets.pz / jet_pt),
        "phi": np.arctan2(raw_jets.py, raw_jets.px),
        "mass": np.sqrt(np.maximum(raw_jets.E**2 - jet_pt**2 - raw_jets.pz**2, 0.0)),
    })

    order = ak.argsort(jets.pt, ascending=False, axis=1)
    jets = jets[order]
    cand_idx = cand_idx[order]
    jet_idx = ak.broadcast_arrays(ak.local_index(jets, axis=1), cand_idx)[0]

    return jets, ak.flatten(cand_idx, axis=-1), ak.flatten(jet_idx, axis=-1)


def jet_constituent_features(cand_pt, cand_eta, cand_mass, cand_pdg, cand_idx, jet_idx, n_jets):
    """Multiplicities and energy fractions of the jets, recomputed from their constituents.
    """
    # energy and pdgid  of every constituent, one entry per (jet, constituent) pair
    energy = np.sqrt((cand_pt[cand_idx] * np.cosh(cand_eta[cand_idx])) ** 2 + cand_mass[cand_idx] ** 2)
    pdg = abs(cand_pdg[cand_idx])

    # in_jet[event][pair][jet] is True if that constituent belongs to that jet
    jet_number = ak.local_index(ak.unflatten(np.zeros(int(ak.sum(n_jets))), n_jets))     # 0, 1, 2... for the jets of every event
    in_jet = jet_idx[:, :, None] == jet_number[:, None, :]

    def of_type(*types):
        mask = pdg == types[0]
        for pdg_id in types[1:]:
            mask = mask | (pdg == pdg_id)
        return mask

    def count(*types):
        return ak.sum(in_jet & of_type(*types)[:, :, None], axis=1)

    jet_energy = ak.sum(in_jet * energy[:, :, None], axis=1)

    def fraction(*types):
        return ak.sum(in_jet * (energy * of_type(*types))[:, :, None], axis=1) / jet_energy

    return {
        "nConstituents": ak.sum(in_jet, axis=1),
        "nCh": count(211), "nNh": count(130), "nPhotons": count(22), "nElectrons": count(11), "nMuons": count(13),
        "chHEF": fraction(211), "neHEF": fraction(130, 1), "neEmEF": fraction(22, 2),
        "chEmEF": fraction(11), "muEF": fraction(13), "hfHEF": fraction(1), "hfEmEF": fraction(2),
    }
