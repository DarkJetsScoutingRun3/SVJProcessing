###################################  README  ###################################
#
# Is called "dataset" a set of files corresponding to the same physics process.
# The object `datasets_info` describes the location of the different datasets.
# Its structure is the following:
#    * Keys are year
#    * Values are the "datasets_per_year_info"
# The structure of the `datasets_per_year_info` is the following:
#    * Keys are dataset names
#    * Values are the "dataset_info" defining which files belong to the dataset
# 
# The "dataset_info" has the following structure. It is a list of dict, which
# has 2 keys:
#    * "redirector": The XRootD redirector to the remote storage element
#    * "path": The path to the directory at which the files are located
#    * "regex": The regex to apply to select some files from that directory. 
#               The regex must be "" if no regex is applied.
#
################################################################################


years = ["2024"]

datasets_info = {
    year: {} for year in years
}

# SVJ scouting signal models
signal_models = [
    "s-channel_mMed-1000_mDark-10_rinv-0.3_brgamma-0.0_ctauPion-0.001",
    "s-channel_mMed-1000_mDark-10_rinv-0.3_brgamma-0.0_ctauPion-100",
    "s-channel_mMed-1000_mDark-10_rinv-0.3_brgamma-0.3_ctauPion-0.001",
    "s-channel_mMed-1000_mDark-10_rinv-0.3_brgamma-0.3_ctauPion-100",
    "s-channel_mMed-1000_mDark-10_rinv-0.3_brgamma-0.5_ctauPion-0.001",
    "s-channel_mMed-1000_mDark-10_rinv-0.3_brgamma-0.5_ctauPion-100",
    "s-channel_mMed-1000_mDark-10_rinv-0.3_brgamma-0.8_ctauPion-0.001",
    "s-channel_mMed-1000_mDark-10_rinv-0.3_brgamma-0.8_ctauPion-100",
    "s-channel_mMed-1000_mDark-10_rinv-0_brgamma-0.0_ctauPion-0.001",
    "s-channel_mMed-1000_mDark-10_rinv-0_brgamma-0.3_ctauPion-0.001",
    "s-channel_mMed-1000_mDark-10_rinv-0_brgamma-0.5_ctauPion-0.001",
    "s-channel_mMed-1000_mDark-10_rinv-0_brgamma-0.8_ctauPion-0.001",
    "s-channel_mMed-1000_mDark-10_rinv-0_brgamma-0.8_ctauPion-100",
    "s-channel_mMed-1000_mDark-5_rinv-0.3_brgamma-0.0_ctauPion-0.001",
    "s-channel_mMed-1000_mDark-5_rinv-0.3_brgamma-0.0_ctauPion-100",
    "s-channel_mMed-1000_mDark-5_rinv-0.3_brgamma-0.3_ctauPion-0.001",
    "s-channel_mMed-1000_mDark-5_rinv-0.3_brgamma-0.3_ctauPion-100",
    "s-channel_mMed-1000_mDark-5_rinv-0.3_brgamma-0.5_ctauPion-0.001",
    "s-channel_mMed-1000_mDark-5_rinv-0.3_brgamma-0.5_ctauPion-100",
    "s-channel_mMed-1000_mDark-5_rinv-0.3_brgamma-0.8_ctauPion-0.001",
    "s-channel_mMed-1000_mDark-5_rinv-0.3_brgamma-0.8_ctauPion-100",
    "s-channel_mMed-1000_mDark-5_rinv-0_brgamma-0.0_ctauPion-0.001",
    "s-channel_mMed-1000_mDark-5_rinv-0_brgamma-0.0_ctauPion-100",
    "s-channel_mMed-1000_mDark-5_rinv-0_brgamma-0.3_ctauPion-0.001",
    "s-channel_mMed-1000_mDark-5_rinv-0_brgamma-0.3_ctauPion-100",
    "s-channel_mMed-1000_mDark-5_rinv-0_brgamma-0.5_ctauPion-0.001",
    "s-channel_mMed-1000_mDark-5_rinv-0_brgamma-0.5_ctauPion-100",
    "s-channel_mMed-1000_mDark-5_rinv-0_brgamma-0.8_ctauPion-0.001",
    "s-channel_mMed-1000_mDark-5_rinv-0_brgamma-0.8_ctauPion-100",
    "s-channel_mMed-1500_mDark-10_rinv-0.3_brgamma-0.0_ctauPion-0.001",
    "s-channel_mMed-1500_mDark-10_rinv-0.3_brgamma-0.0_ctauPion-100",
    "s-channel_mMed-1500_mDark-10_rinv-0.3_brgamma-0.3_ctauPion-0.001",
    "s-channel_mMed-1500_mDark-10_rinv-0.3_brgamma-0.3_ctauPion-100",
    "s-channel_mMed-1500_mDark-10_rinv-0.3_brgamma-0.5_ctauPion-0.001",
    "s-channel_mMed-1500_mDark-10_rinv-0.3_brgamma-0.5_ctauPion-100",
    "s-channel_mMed-1500_mDark-10_rinv-0.3_brgamma-0.8_ctauPion-0.001",
    "s-channel_mMed-1500_mDark-10_rinv-0.3_brgamma-0.8_ctauPion-100",
    "s-channel_mMed-1500_mDark-10_rinv-0_brgamma-0.0_ctauPion-0.001",
    "s-channel_mMed-1500_mDark-10_rinv-0_brgamma-0.3_ctauPion-0.001",
    "s-channel_mMed-1500_mDark-10_rinv-0_brgamma-0.5_ctauPion-0.001",
    "s-channel_mMed-1500_mDark-10_rinv-0_brgamma-0.5_ctauPion-100",
    "s-channel_mMed-1500_mDark-10_rinv-0_brgamma-0.8_ctauPion-0.001",
    "s-channel_mMed-1500_mDark-10_rinv-0_brgamma-0.8_ctauPion-100",
    "s-channel_mMed-1500_mDark-5_rinv-0.3_brgamma-0.0_ctauPion-0.001",
    "s-channel_mMed-1500_mDark-5_rinv-0.3_brgamma-0.0_ctauPion-100",
    "s-channel_mMed-1500_mDark-5_rinv-0.3_brgamma-0.3_ctauPion-0.001",
    "s-channel_mMed-1500_mDark-5_rinv-0.3_brgamma-0.3_ctauPion-100",
    "s-channel_mMed-1500_mDark-5_rinv-0.3_brgamma-0.5_ctauPion-0.001",
    "s-channel_mMed-1500_mDark-5_rinv-0.3_brgamma-0.5_ctauPion-100",
    "s-channel_mMed-1500_mDark-5_rinv-0.3_brgamma-0.8_ctauPion-0.001",
    "s-channel_mMed-1500_mDark-5_rinv-0.3_brgamma-0.8_ctauPion-100",
    "s-channel_mMed-1500_mDark-5_rinv-0_brgamma-0.0_ctauPion-0.001",
    "s-channel_mMed-1500_mDark-5_rinv-0_brgamma-0.0_ctauPion-100",
    "s-channel_mMed-1500_mDark-5_rinv-0_brgamma-0.3_ctauPion-0.001",
    "s-channel_mMed-1500_mDark-5_rinv-0_brgamma-0.3_ctauPion-100",
    "s-channel_mMed-1500_mDark-5_rinv-0_brgamma-0.5_ctauPion-0.001",
    "s-channel_mMed-1500_mDark-5_rinv-0_brgamma-0.5_ctauPion-100",
    "s-channel_mMed-1500_mDark-5_rinv-0_brgamma-0.8_ctauPion-0.001",
    "s-channel_mMed-1500_mDark-5_rinv-0_brgamma-0.8_ctauPion-100",
    "s-channel_mMed-2500_mDark-10_rinv-0.3_brgamma-0.0_ctauPion-0.001",
    "s-channel_mMed-2500_mDark-10_rinv-0.3_brgamma-0.0_ctauPion-100",
    "s-channel_mMed-2500_mDark-10_rinv-0.3_brgamma-0.3_ctauPion-0.001",
    "s-channel_mMed-2500_mDark-10_rinv-0.3_brgamma-0.5_ctauPion-0.001",
    "s-channel_mMed-2500_mDark-10_rinv-0.3_brgamma-0.5_ctauPion-100",
    "s-channel_mMed-2500_mDark-10_rinv-0.3_brgamma-0.8_ctauPion-0.001",
    "s-channel_mMed-2500_mDark-10_rinv-0.3_brgamma-0.8_ctauPion-100",
    "s-channel_mMed-2500_mDark-10_rinv-0_brgamma-0.0_ctauPion-0.001",
    "s-channel_mMed-2500_mDark-10_rinv-0_brgamma-0.3_ctauPion-0.001",
    "s-channel_mMed-2500_mDark-10_rinv-0_brgamma-0.5_ctauPion-0.001",
    "s-channel_mMed-2500_mDark-10_rinv-0_brgamma-0.8_ctauPion-0.001",
    "s-channel_mMed-2500_mDark-5_rinv-0.3_brgamma-0.0_ctauPion-0.001",
    "s-channel_mMed-2500_mDark-5_rinv-0.3_brgamma-0.0_ctauPion-100",
    "s-channel_mMed-2500_mDark-5_rinv-0.3_brgamma-0.3_ctauPion-0.001",
    "s-channel_mMed-2500_mDark-5_rinv-0.3_brgamma-0.3_ctauPion-100",
    "s-channel_mMed-2500_mDark-5_rinv-0.3_brgamma-0.5_ctauPion-0.001",
    "s-channel_mMed-2500_mDark-5_rinv-0.3_brgamma-0.5_ctauPion-100",
    "s-channel_mMed-2500_mDark-5_rinv-0.3_brgamma-0.8_ctauPion-0.001",
    "s-channel_mMed-2500_mDark-5_rinv-0.3_brgamma-0.8_ctauPion-100",
    "s-channel_mMed-2500_mDark-5_rinv-0_brgamma-0.0_ctauPion-0.001",
    "s-channel_mMed-2500_mDark-5_rinv-0_brgamma-0.0_ctauPion-100",
    "s-channel_mMed-2500_mDark-5_rinv-0_brgamma-0.3_ctauPion-0.001",
    "s-channel_mMed-2500_mDark-5_rinv-0_brgamma-0.3_ctauPion-100",
    "s-channel_mMed-2500_mDark-5_rinv-0_brgamma-0.5_ctauPion-0.001",
    "s-channel_mMed-2500_mDark-5_rinv-0_brgamma-0.5_ctauPion-100",
    "s-channel_mMed-2500_mDark-5_rinv-0_brgamma-0.8_ctauPion-0.001",
    "s-channel_mMed-2500_mDark-5_rinv-0_brgamma-0.8_ctauPion-100",
    "s-channel_mMed-3500_mDark-10_rinv-0.3_brgamma-0.0_ctauPion-0.001",
    "s-channel_mMed-3500_mDark-10_rinv-0.3_brgamma-0.3_ctauPion-0.001",
    "s-channel_mMed-3500_mDark-10_rinv-0.3_brgamma-0.3_ctauPion-100",
    "s-channel_mMed-3500_mDark-10_rinv-0.3_brgamma-0.5_ctauPion-0.001",
    "s-channel_mMed-3500_mDark-10_rinv-0.3_brgamma-0.5_ctauPion-100",
    "s-channel_mMed-3500_mDark-10_rinv-0.3_brgamma-0.8_ctauPion-0.001",
    "s-channel_mMed-3500_mDark-10_rinv-0.3_brgamma-0.8_ctauPion-100",
    "s-channel_mMed-3500_mDark-10_rinv-0_brgamma-0.0_ctauPion-0.001",
    "s-channel_mMed-3500_mDark-10_rinv-0_brgamma-0.3_ctauPion-0.001",
    "s-channel_mMed-3500_mDark-10_rinv-0_brgamma-0.5_ctauPion-0.001",
    "s-channel_mMed-3500_mDark-10_rinv-0_brgamma-0.8_ctauPion-0.001",
    "s-channel_mMed-3500_mDark-5_rinv-0.3_brgamma-0.0_ctauPion-0.001",
    "s-channel_mMed-3500_mDark-5_rinv-0.3_brgamma-0.0_ctauPion-100",
    "s-channel_mMed-3500_mDark-5_rinv-0.3_brgamma-0.3_ctauPion-0.001",
    "s-channel_mMed-3500_mDark-5_rinv-0.3_brgamma-0.3_ctauPion-100",
    "s-channel_mMed-3500_mDark-5_rinv-0.3_brgamma-0.5_ctauPion-0.001",
    "s-channel_mMed-3500_mDark-5_rinv-0.3_brgamma-0.5_ctauPion-100",
    "s-channel_mMed-3500_mDark-5_rinv-0.3_brgamma-0.8_ctauPion-0.001",
    "s-channel_mMed-3500_mDark-5_rinv-0.3_brgamma-0.8_ctauPion-100",
    "s-channel_mMed-3500_mDark-5_rinv-0_brgamma-0.0_ctauPion-0.001",
    "s-channel_mMed-3500_mDark-5_rinv-0_brgamma-0.0_ctauPion-100",
    "s-channel_mMed-3500_mDark-5_rinv-0_brgamma-0.3_ctauPion-0.001",
    "s-channel_mMed-3500_mDark-5_rinv-0_brgamma-0.3_ctauPion-100",
    "s-channel_mMed-3500_mDark-5_rinv-0_brgamma-0.5_ctauPion-0.001",
    "s-channel_mMed-3500_mDark-5_rinv-0_brgamma-0.5_ctauPion-100",
    "s-channel_mMed-3500_mDark-5_rinv-0_brgamma-0.8_ctauPion-0.001",
    "s-channel_mMed-3500_mDark-5_rinv-0_brgamma-0.8_ctauPion-100",
    "s-channel_mMed-4500_mDark-10_rinv-0.3_brgamma-0.0_ctauPion-0.001",
    "s-channel_mMed-4500_mDark-10_rinv-0.3_brgamma-0.3_ctauPion-0.001",
    "s-channel_mMed-4500_mDark-10_rinv-0.3_brgamma-0.5_ctauPion-0.001",
    "s-channel_mMed-4500_mDark-10_rinv-0.3_brgamma-0.5_ctauPion-100",
    "s-channel_mMed-4500_mDark-10_rinv-0.3_brgamma-0.8_ctauPion-0.001",
    "s-channel_mMed-4500_mDark-10_rinv-0.3_brgamma-0.8_ctauPion-100",
    "s-channel_mMed-4500_mDark-10_rinv-0_brgamma-0.0_ctauPion-0.001",
    "s-channel_mMed-4500_mDark-10_rinv-0_brgamma-0.3_ctauPion-0.001",
    "s-channel_mMed-4500_mDark-10_rinv-0_brgamma-0.5_ctauPion-0.001",
    "s-channel_mMed-4500_mDark-10_rinv-0_brgamma-0.8_ctauPion-0.001",
    "s-channel_mMed-4500_mDark-5_rinv-0.3_brgamma-0.0_ctauPion-0.001",
    "s-channel_mMed-4500_mDark-5_rinv-0.3_brgamma-0.0_ctauPion-100",
    "s-channel_mMed-4500_mDark-5_rinv-0.3_brgamma-0.3_ctauPion-0.001",
    "s-channel_mMed-4500_mDark-5_rinv-0.3_brgamma-0.3_ctauPion-100",
    "s-channel_mMed-4500_mDark-5_rinv-0.3_brgamma-0.5_ctauPion-0.001",
    "s-channel_mMed-4500_mDark-5_rinv-0.3_brgamma-0.5_ctauPion-100",
    "s-channel_mMed-4500_mDark-5_rinv-0.3_brgamma-0.8_ctauPion-0.001",
    "s-channel_mMed-4500_mDark-5_rinv-0.3_brgamma-0.8_ctauPion-100",
    "s-channel_mMed-4500_mDark-5_rinv-0_brgamma-0.0_ctauPion-0.001",
    "s-channel_mMed-4500_mDark-5_rinv-0_brgamma-0.0_ctauPion-100",
    "s-channel_mMed-4500_mDark-5_rinv-0_brgamma-0.3_ctauPion-0.001",
    "s-channel_mMed-4500_mDark-5_rinv-0_brgamma-0.3_ctauPion-100",
    "s-channel_mMed-4500_mDark-5_rinv-0_brgamma-0.5_ctauPion-0.001",
    "s-channel_mMed-4500_mDark-5_rinv-0_brgamma-0.5_ctauPion-100",
    "s-channel_mMed-4500_mDark-5_rinv-0_brgamma-0.8_ctauPion-0.001",
    "s-channel_mMed-4500_mDark-5_rinv-0_brgamma-0.8_ctauPion-100",
    "s-channel_mMed-500_mDark-10_rinv-0.3_brgamma-0.0_ctauPion-0.001",
    "s-channel_mMed-500_mDark-10_rinv-0.3_brgamma-0.0_ctauPion-100",
    "s-channel_mMed-500_mDark-10_rinv-0.3_brgamma-0.3_ctauPion-0.001",
    "s-channel_mMed-500_mDark-10_rinv-0.3_brgamma-0.3_ctauPion-100",
    "s-channel_mMed-500_mDark-10_rinv-0.3_brgamma-0.5_ctauPion-0.001",
    "s-channel_mMed-500_mDark-10_rinv-0.3_brgamma-0.5_ctauPion-100",
    "s-channel_mMed-500_mDark-10_rinv-0.3_brgamma-0.8_ctauPion-0.001",
    "s-channel_mMed-500_mDark-10_rinv-0.3_brgamma-0.8_ctauPion-100",
    "s-channel_mMed-500_mDark-10_rinv-0_brgamma-0.0_ctauPion-0.001",
    "s-channel_mMed-500_mDark-10_rinv-0_brgamma-0.0_ctauPion-100",
    "s-channel_mMed-500_mDark-10_rinv-0_brgamma-0.3_ctauPion-0.001",
    "s-channel_mMed-500_mDark-10_rinv-0_brgamma-0.3_ctauPion-100",
    "s-channel_mMed-500_mDark-10_rinv-0_brgamma-0.5_ctauPion-0.001",
    "s-channel_mMed-500_mDark-10_rinv-0_brgamma-0.5_ctauPion-100",
    "s-channel_mMed-500_mDark-10_rinv-0_brgamma-0.8_ctauPion-0.001",
    "s-channel_mMed-500_mDark-10_rinv-0_brgamma-0.8_ctauPion-100",
    "s-channel_mMed-500_mDark-5_rinv-0.3_brgamma-0.0_ctauPion-0.001",
    "s-channel_mMed-500_mDark-5_rinv-0.3_brgamma-0.0_ctauPion-100",
    "s-channel_mMed-500_mDark-5_rinv-0.3_brgamma-0.3_ctauPion-0.001",
    "s-channel_mMed-500_mDark-5_rinv-0.3_brgamma-0.3_ctauPion-100",
    "s-channel_mMed-500_mDark-5_rinv-0.3_brgamma-0.5_ctauPion-0.001",
    "s-channel_mMed-500_mDark-5_rinv-0.3_brgamma-0.5_ctauPion-100",
    "s-channel_mMed-500_mDark-5_rinv-0.3_brgamma-0.8_ctauPion-0.001",
    "s-channel_mMed-500_mDark-5_rinv-0.3_brgamma-0.8_ctauPion-100",
    "s-channel_mMed-500_mDark-5_rinv-0_brgamma-0.0_ctauPion-0.001",
    "s-channel_mMed-500_mDark-5_rinv-0_brgamma-0.0_ctauPion-100",
    "s-channel_mMed-500_mDark-5_rinv-0_brgamma-0.3_ctauPion-0.001",
    "s-channel_mMed-500_mDark-5_rinv-0_brgamma-0.3_ctauPion-100",
    "s-channel_mMed-500_mDark-5_rinv-0_brgamma-0.5_ctauPion-0.001",
    "s-channel_mMed-500_mDark-5_rinv-0_brgamma-0.5_ctauPion-100",
    "s-channel_mMed-500_mDark-5_rinv-0_brgamma-0.8_ctauPion-0.001",
    "s-channel_mMed-500_mDark-5_rinv-0_brgamma-0.8_ctauPion-100",
    "s-channel_mMed-700_mDark-10_rinv-0.3_brgamma-0.0_ctauPion-0.001",
    "s-channel_mMed-700_mDark-10_rinv-0.3_brgamma-0.0_ctauPion-100",
    "s-channel_mMed-700_mDark-10_rinv-0.3_brgamma-0.3_ctauPion-0.001",
    "s-channel_mMed-700_mDark-10_rinv-0.3_brgamma-0.3_ctauPion-100",
    "s-channel_mMed-700_mDark-10_rinv-0.3_brgamma-0.5_ctauPion-0.001",
    "s-channel_mMed-700_mDark-10_rinv-0.3_brgamma-0.5_ctauPion-100",
    "s-channel_mMed-700_mDark-10_rinv-0.3_brgamma-0.8_ctauPion-0.001",
    "s-channel_mMed-700_mDark-10_rinv-0.3_brgamma-0.8_ctauPion-100",
    "s-channel_mMed-700_mDark-10_rinv-0_brgamma-0.0_ctauPion-0.001",
    "s-channel_mMed-700_mDark-10_rinv-0_brgamma-0.0_ctauPion-100",
    "s-channel_mMed-700_mDark-10_rinv-0_brgamma-0.3_ctauPion-0.001",
    "s-channel_mMed-700_mDark-10_rinv-0_brgamma-0.3_ctauPion-100",
    "s-channel_mMed-700_mDark-10_rinv-0_brgamma-0.5_ctauPion-0.001",
    "s-channel_mMed-700_mDark-10_rinv-0_brgamma-0.5_ctauPion-100",
    "s-channel_mMed-700_mDark-10_rinv-0_brgamma-0.8_ctauPion-0.001",
    "s-channel_mMed-700_mDark-10_rinv-0_brgamma-0.8_ctauPion-100",
    "s-channel_mMed-700_mDark-5_rinv-0.3_brgamma-0.0_ctauPion-0.001",
    "s-channel_mMed-700_mDark-5_rinv-0.3_brgamma-0.0_ctauPion-100",
    "s-channel_mMed-700_mDark-5_rinv-0.3_brgamma-0.3_ctauPion-0.001",
    "s-channel_mMed-700_mDark-5_rinv-0.3_brgamma-0.3_ctauPion-100",
    "s-channel_mMed-700_mDark-5_rinv-0.3_brgamma-0.5_ctauPion-0.001",
    "s-channel_mMed-700_mDark-5_rinv-0.3_brgamma-0.5_ctauPion-100",
    "s-channel_mMed-700_mDark-5_rinv-0.3_brgamma-0.8_ctauPion-0.001",
    "s-channel_mMed-700_mDark-5_rinv-0.3_brgamma-0.8_ctauPion-100",
    "s-channel_mMed-700_mDark-5_rinv-0_brgamma-0.0_ctauPion-0.001",
    "s-channel_mMed-700_mDark-5_rinv-0_brgamma-0.0_ctauPion-100",
    "s-channel_mMed-700_mDark-5_rinv-0_brgamma-0.3_ctauPion-0.001",
    "s-channel_mMed-700_mDark-5_rinv-0_brgamma-0.3_ctauPion-100",
    "s-channel_mMed-700_mDark-5_rinv-0_brgamma-0.5_ctauPion-0.001",
    "s-channel_mMed-700_mDark-5_rinv-0_brgamma-0.5_ctauPion-100",
    "s-channel_mMed-700_mDark-5_rinv-0_brgamma-0.8_ctauPion-0.001",
    "s-channel_mMed-700_mDark-5_rinv-0_brgamma-0.8_ctauPion-100",
    "s-channel_mMed-850_mDark-10_rinv-0.3_brgamma-0.0_ctauPion-0.001",
    "s-channel_mMed-850_mDark-10_rinv-0.3_brgamma-0.0_ctauPion-100",
    "s-channel_mMed-850_mDark-10_rinv-0.3_brgamma-0.3_ctauPion-0.001",
    "s-channel_mMed-850_mDark-10_rinv-0.3_brgamma-0.3_ctauPion-100",
    "s-channel_mMed-850_mDark-10_rinv-0.3_brgamma-0.5_ctauPion-0.001",
    "s-channel_mMed-850_mDark-10_rinv-0.3_brgamma-0.5_ctauPion-100",
    "s-channel_mMed-850_mDark-10_rinv-0.3_brgamma-0.8_ctauPion-0.001",
    "s-channel_mMed-850_mDark-10_rinv-0.3_brgamma-0.8_ctauPion-100",
    "s-channel_mMed-850_mDark-10_rinv-0_brgamma-0.0_ctauPion-0.001",
    "s-channel_mMed-850_mDark-10_rinv-0_brgamma-0.3_ctauPion-0.001",
    "s-channel_mMed-850_mDark-10_rinv-0_brgamma-0.3_ctauPion-100",
    "s-channel_mMed-850_mDark-10_rinv-0_brgamma-0.5_ctauPion-0.001",
    "s-channel_mMed-850_mDark-10_rinv-0_brgamma-0.5_ctauPion-100",
    "s-channel_mMed-850_mDark-10_rinv-0_brgamma-0.8_ctauPion-0.001",
    "s-channel_mMed-850_mDark-10_rinv-0_brgamma-0.8_ctauPion-100",
    "s-channel_mMed-850_mDark-5_rinv-0.3_brgamma-0.0_ctauPion-0.001",
    "s-channel_mMed-850_mDark-5_rinv-0.3_brgamma-0.0_ctauPion-100",
    "s-channel_mMed-850_mDark-5_rinv-0.3_brgamma-0.3_ctauPion-0.001",
    "s-channel_mMed-850_mDark-5_rinv-0.3_brgamma-0.3_ctauPion-100",
    "s-channel_mMed-850_mDark-5_rinv-0.3_brgamma-0.5_ctauPion-0.001",
    "s-channel_mMed-850_mDark-5_rinv-0.3_brgamma-0.5_ctauPion-100",
    "s-channel_mMed-850_mDark-5_rinv-0.3_brgamma-0.8_ctauPion-0.001",
    "s-channel_mMed-850_mDark-5_rinv-0.3_brgamma-0.8_ctauPion-100",
    "s-channel_mMed-850_mDark-5_rinv-0_brgamma-0.0_ctauPion-0.001",
    "s-channel_mMed-850_mDark-5_rinv-0_brgamma-0.0_ctauPion-100",
    "s-channel_mMed-850_mDark-5_rinv-0_brgamma-0.3_ctauPion-0.001",
    "s-channel_mMed-850_mDark-5_rinv-0_brgamma-0.3_ctauPion-100",
    "s-channel_mMed-850_mDark-5_rinv-0_brgamma-0.5_ctauPion-0.001",
    "s-channel_mMed-850_mDark-5_rinv-0_brgamma-0.5_ctauPion-100",
    "s-channel_mMed-850_mDark-5_rinv-0_brgamma-0.8_ctauPion-0.001",
    "s-channel_mMed-850_mDark-5_rinv-0_brgamma-0.8_ctauPion-100"
]

qcd_bins = [
    "QCD_Bin-PT-170to300",
    "QCD_Bin-PT-300to470",
    "QCD_Bin-PT-470to600",
    "QCD_Bin-PT-600to800",
    "QCD_Bin-PT-800to1000"
    "QCD_Bin-PT-1000to1500",
    "QCD_Bin-PT-1500to2000",
    "QCD_Bin-PT-2000to2500",
    "QCD_Bin-PT-2500to3000",
    "QCD_Bin-PT-3000toInf",
]

ttjets_bins = [
    "TT-3Jets_Bin-HT-100to400",
    "TT-3Jets_Bin-HT-400to800",
    "TT-3Jets_Bin-HT-800to1500",
    "TT-3Jets_Bin-HT-1500to2500",
    "TT-3Jets_Bin-HT-2500toInf",
]

#TODO: Add WJets and ZJets bins
#wjets_bins = [
#]

#TODO: Add WJets and ZJets bins
#zjets_bins = [
#]

#TODO: Add GammaJets bins
#gammajets_bins = [
#]
    
#TODO: maybe high EMF QCD

for year in years:
    datasets_info[year].update({
        bin: [
            {
                "redirector": "root://storage01.lcg.cscs.ch:1096//",
                "path": f"/pnfs/lcg.cscs.ch/cms/trivcat/store/user/cazzanig/darkshowers/samples/scouting_run3/ScoutingPFNanoAOD/signals/photons_enriched_signatures/{bin}/",
                "regex": f"",
                
            },
        ]
        for bin in signal_models
    })

for year in years:
    datasets_info[year].update({
        bin: [
            {
                "redirector": "root://storage01.lcg.cscs.ch:1096//",
                "path": f"/pnfs/lcg.cscs.ch/cms/trivcat/store/user/cazzanig/darkshowers/samples/scouting_run3/ScoutingPFNanoAOD/backgrounds/{bin}/",
                "regex": f"",
                
            },
        ]
        for bin in qcd_bins
    })

for year in years:
    datasets_info[year].update({
        bin: [
            {
                #"redirector": "root://storage01.lcg.cscs.ch:1096//",
                #"path": f"/pnfs/lcg.cscs.ch/cms/trivcat/store/user/cazzanig/darkshowers/samples/scouting/PFNano/QCD_HT_binned_2018_v0/{bin}/",
                "redirector": "root://cmsdcache-kit-disk.gridka.de:1094/",
                "path": f"/store/user/mgaisdor/SVJScouting_ntuples/MC/{year}/{bin}/",
                "regex": f"",
                
            },
        ]
        for bin in ttjets_bins
    })

#TODO: add WJets
#for year in years:
#    datasets_info[year].update({
#        bin: [
#            {
#                #"redirector": "root://storage01.lcg.cscs.ch:1096//",
#                #"path": f"/pnfs/lcg.cscs.ch/cms/trivcat/store/user/cazzanig/darkshowers/samples/scouting/PFNano/QCD_HT_binned_2018_v0/{bin}/",
#                #"regex": f"",
#                
#            },
#        ]
#        for bin in wjets_bins
#    })

#TODO: add ZJets
#for year in years:
#    datasets_info[year].update({
#        bin: [
#            {
#                #"redirector": "root://storage01.lcg.cscs.ch:1096//",
#                #"path": f"/pnfs/lcg.cscs.ch/cms/trivcat/store/user/cazzanig/darkshowers/samples/scouting/PFNano/QCD_HT_binned_2018_v0/{bin}/",
#                "regex": f"",
#                
#            },
#        ]
#        for bin in zjets_bins
#    })


#TODO: add GammaJets
#for year in years:
#    datasets_info[year].update({
#        bin: [
#            {
#                #"redirector": "root://storage01.lcg.cscs.ch:1096//",
#                #"path": f"/pnfs/lcg.cscs.ch/cms/trivcat/store/user/cazzanig/darkshowers/samples/scouting/PFNano/QCD_HT_binned_2018_v0/{bin}/",
#                "regex": f"",
#                
#            },
#        ]
#        for bin in zjets_bins
#    })


#TODO: maybe high EMF QCD


#TODO: add data when ready

#datasets_info["2018"].update({
#    "JetHT": [
#        ##########Run2018A
#        {
#            "redirector": "root://storage01.lcg.cscs.ch:1096/",
#            "path": f"/pnfs/lcg.cscs.ch/cms/trivcat/store/user/kadatta/PFNano/106x_v02/JetHT/Run2018A-UL2018_MiniAODv2-v1_PFNanov2pt2/221108_162639/0000/",
#            "regex": "",
#        },
#        {
#            "redirector": "root://storage01.lcg.cscs.ch:1096/",
#            "path": f"/pnfs/lcg.cscs.ch/cms/trivcat/store/user/kadatta/PFNano/106x_v02/JetHT/Run2018A-UL2018_MiniAODv2-v1_PFNanov2pt2/221108_162639/0001/",
#            "regex": "",
#        },
#        ##########Run2018B
#        {
#            "redirector": "root://storage01.lcg.cscs.ch:1096/",
#            "path": f"/pnfs/lcg.cscs.ch/cms/trivcat/store/user/kadatta/PFNano/106x_v02/JetHT/Run2018B-UL2018_MiniAODv2-v1_PFNanov2pt2/221108_162412/0000/",
#            "regex": "",
#        },
#        ##########Run2018C
#        {
#            "redirector": "root://storage01.lcg.cscs.ch:1096/",
#            "path": f"/pnfs/lcg.cscs.ch/cms/trivcat/store/user/kadatta/PFNano/106x_v02/JetHT/Run2018C-UL2018_MiniAODv2-v1_PFNanov2pt2/221108_163047/0000/",
#            "regex": "",
#        },
#        ##########Run2018D
#        {
#            "redirector": "root://storage01.lcg.cscs.ch:1096/",
#            "path": f"/pnfs/lcg.cscs.ch/cms/trivcat/store/user/kadatta/PFNano/106x_v02/JetHT/Run2018D-UL2018_MiniAODv2-v2_PFNanov2pt2/221108_163418/0000/",
#            "regex": "",
#        },
#        {
#            "redirector": "root://storage01.lcg.cscs.ch:1096/",
#            "path": f"/pnfs/lcg.cscs.ch/cms/trivcat/store/user/kadatta/PFNano/106x_v02/JetHT/Run2018D-UL2018_MiniAODv2-v2_PFNanov2pt2/221108_163418/0001/",
#            "regex": "",
#        },
#        {
#            "redirector": "root://storage01.lcg.cscs.ch:1096/",
#            "path": f"/pnfs/lcg.cscs.ch/cms/trivcat/store/user/kadatta/PFNano/106x_v02/JetHT/Run2018D-UL2018_MiniAODv2-v2_PFNanov2pt2/221108_163418/0002/",
#            "regex": "",
#        },
#    ]
#})



