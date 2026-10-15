import awkward as ak

from skimmer import skimmer_utils
from utils.awkward_array_utilities import as_type
import analysis_configs.triggers as trg
import utils.variables_computation.event_variables as event_vars
#from analysis_configs.met_filters import met_filters_nanoaod as met_filters
from analysis_configs import sequences_photons_enriched_scouting_run3 as sequences


GOLDEN_JSON_PATHS = {
    "2024": "", 
}


def process(events, cut_flow, year, primary_dataset="", dataset_name="", pn_tagger=False, **kwargs):
    """Draft of scouting Run3 photon enriched pre-selection (dummy version)."""

    # Golden JSON lumi mask (data only)
    #if skimmer_utils.is_data(events) and len(events) != 0:
    #    from coffea.lumi_tools import LumiMask
    #    lumi_mask = LumiMask(GOLDEN_JSON_PATHS[year])
    #    mask = lumi_mask(events.run, events.lumSec)
    #    events = events[mask]
    #    skimmer_utils.update_cut_flow(cut_flow, "GoldenJSON", events)


    # Trigger event selection
    #triggers = getattr(trg, f"scouting_run3_photon_enriched")
    #events = skimmer_utils.apply_trigger_cut(events, triggers)
    #skimmer_utils.update_cut_flow(cut_flow, "Trigger", events)

    recluster=True

    # If recluster is True, a new collection with the reclustered jets is created and
    # these are the jets used for the rest of the pre-selection
    if recluster: 
        jet_collection = sequences.reclustered_jets_name()
        if len(events) != 0:
            events = sequences.add_jet_reclustering_branches(events)
    else:
        # AK8 jets with 170 clustering threshold (the ones in the ntuples)
        jet_collection = "ScoutingFatPFJetRecluster"


    # Good fat jet filters
    if ak.count(events[f"{jet_collection}_pt"]) != 0:
        events = sequences.apply_good_ak8_jet_filter(events, jets=jet_collection)
    skimmer_utils.update_cut_flow(cut_flow, "GoodJetsAK8", events)

    # Removing events with no jets to avoid crashes
    filter_njets = ak.count(events[f"{jet_collection}_pt"], axis=1) > 0
    events = events[filter_njets]
    skimmer_utils.update_cut_flow(cut_flow, "nJetsAK8Gt0", events)
    
    # Adding JetsAK8_isGood branch already so that it can be used
    # in the rest of the pre-selection
    if len(events) != 0:
        events = sequences.add_good_ak8_jet_branch(events, jets=jet_collection)
        events = sequences.add_good_ak4_jet_branch(events)
        #events = sequences.add_veto_leptons_branches(events)


    # Requiring at least 2 FatJets. No good jets requirements based on id
    if len(events) != 0:
        filter = ak.count(events[f"{jet_collection}_pt"][events[f"{jet_collection}_isGood"]], axis=1) >= 2
        events = events[filter]
    skimmer_utils.update_cut_flow(cut_flow, "nJetsAK8Gt2", events)

    if len(events) != 0:
        events = sequences.add_analysis_branches(events, jets=jet_collection)

    #will need to update this for gen studies using new collections (GenPart)
    #if sequences.has_dark_quark_info(events):
    #    events = sequences.add_dark_quark_matching(events)
    #events = sequences.remove_collections(events)

    
    #apply DeltaEta filter 
    # if len(events) != 0:
    #     jets = skimmer_utils.make_pt_eta_phi_mass_lorentz_vector(
    #         pt=events.FatJet_pt[events.FatJet_isGood],
    #         eta=events.FatJet_eta[events.FatJet_isGood],
    #         phi=events.FatJet_phi[events.FatJet_isGood],
    #         mass=events.FatJet_mass[events.FatJet_isGood],
    #     )
    #     delta_eta = abs(event_vars.calculate_delta_eta(jets))
    #     filter_deltaeta = delta_eta < 1.5
    #     filter_deltaeta = as_type(filter_deltaeta, bool)
    #     events = events[filter_deltaeta]
    
    # skimmer_utils.update_cut_flow(cut_flow, "DeltaEtaj0j1 selection", events)

    #apply MT selection -  to be updated with new trigger studies
    #if len(events) != 0:
    #    jets = skimmer_utils.make_pt_eta_phi_mass_lorentz_vector(
    #        pt=events.FatJet_pt[events.FatJet_isGood],
    #        eta=events.FatJet_eta[events.FatJet_isGood],
    #        phi=events.FatJet_phi[events.FatJet_isGood],
    #        mass=events.FatJet_mass[events.FatJet_isGood],
    #    )
    #    met = skimmer_utils.make_pt_eta_phi_mass_lorentz_vector(
    #        pt=events.ScoutMET_pt,
    #        phi=events.ScoutMET_phi,
    #    )
    #    mt = event_vars.calculate_transverse_mass(jets, met)
    #    filter_mt = mt > 650
    #    filter_mt = as_type(filter_mt, bool)
    #    events = events[filter_mt]
    #
    #skimmer_utils.update_cut_flow(cut_flow, "MT_selection", events)

   

    return events, cut_flow

