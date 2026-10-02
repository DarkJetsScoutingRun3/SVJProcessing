#!/bin/bash

dataset_directory=/work/cazzanig/datasets_photons_enriched_run3_scouting/
dataset_config=dataset_configs.photon_enriched_scouting_dataset_paths

module=analysis_configs.scouting_run3_photon_enriched_pre_selection
selection_name=dummy_pre_selection

#module=analysis_configs.t_channel_wnae_qcd_training_region
#selection_name=t_channel_wnae_qcd_training_region

#module=analysis_configs.t_channel_wnae_top_training_region
#selection_name=t_channel_wnae_top_training_region

#module=analysis_configs.t_channel_lost_lepton_control_region
#selection_name=t_channel_lost_lepton_control_region

year=2024

dataset_names=(
    #
    # Signals
    #
    s-channel_mMed-1000_mDark-10_rinv-0.3_brgamma-0.0_ctauPion-0.001
   #s-channel_mMed-1000_mDark-10_rinv-0.3_brgamma-0.0_ctauPion-100
   #s-channel_mMed-1000_mDark-10_rinv-0.3_brgamma-0.3_ctauPion-0.001
   #s-channel_mMed-1000_mDark-10_rinv-0.3_brgamma-0.3_ctauPion-100
   #s-channel_mMed-1000_mDark-10_rinv-0.3_brgamma-0.5_ctauPion-0.001
   #s-channel_mMed-1000_mDark-10_rinv-0.3_brgamma-0.5_ctauPion-100
   #s-channel_mMed-1000_mDark-10_rinv-0.3_brgamma-0.8_ctauPion-0.001
   #s-channel_mMed-1000_mDark-10_rinv-0.3_brgamma-0.8_ctauPion-100
   #s-channel_mMed-1000_mDark-10_rinv-0_brgamma-0.0_ctauPion-0.001
   #s-channel_mMed-1000_mDark-10_rinv-0_brgamma-0.3_ctauPion-0.001
   #s-channel_mMed-1000_mDark-10_rinv-0_brgamma-0.5_ctauPion-0.001
   #s-channel_mMed-1000_mDark-10_rinv-0_brgamma-0.8_ctauPion-0.001
   #s-channel_mMed-1000_mDark-10_rinv-0_brgamma-0.8_ctauPion-100
   #s-channel_mMed-1000_mDark-5_rinv-0.3_brgamma-0.0_ctauPion-0.001
   #s-channel_mMed-1000_mDark-5_rinv-0.3_brgamma-0.0_ctauPion-100
   #s-channel_mMed-1000_mDark-5_rinv-0.3_brgamma-0.3_ctauPion-0.001
   #s-channel_mMed-1000_mDark-5_rinv-0.3_brgamma-0.3_ctauPion-100
   #s-channel_mMed-1000_mDark-5_rinv-0.3_brgamma-0.5_ctauPion-0.001
   #s-channel_mMed-1000_mDark-5_rinv-0.3_brgamma-0.5_ctauPion-100
   #s-channel_mMed-1000_mDark-5_rinv-0.3_brgamma-0.8_ctauPion-0.001
   #s-channel_mMed-1000_mDark-5_rinv-0.3_brgamma-0.8_ctauPion-100
   #s-channel_mMed-1000_mDark-5_rinv-0_brgamma-0.0_ctauPion-0.001
   #s-channel_mMed-1000_mDark-5_rinv-0_brgamma-0.0_ctauPion-100
   #s-channel_mMed-1000_mDark-5_rinv-0_brgamma-0.3_ctauPion-0.001
   #s-channel_mMed-1000_mDark-5_rinv-0_brgamma-0.3_ctauPion-100
   #s-channel_mMed-1000_mDark-5_rinv-0_brgamma-0.5_ctauPion-0.001
   #s-channel_mMed-1000_mDark-5_rinv-0_brgamma-0.5_ctauPion-100
   #s-channel_mMed-1000_mDark-5_rinv-0_brgamma-0.8_ctauPion-0.001
   #s-channel_mMed-1000_mDark-5_rinv-0_brgamma-0.8_ctauPion-100
   #s-channel_mMed-1500_mDark-10_rinv-0.3_brgamma-0.0_ctauPion-0.001
   #s-channel_mMed-1500_mDark-10_rinv-0.3_brgamma-0.0_ctauPion-100
   #s-channel_mMed-1500_mDark-10_rinv-0.3_brgamma-0.3_ctauPion-0.001
   #s-channel_mMed-1500_mDark-10_rinv-0.3_brgamma-0.3_ctauPion-100
   #s-channel_mMed-1500_mDark-10_rinv-0.3_brgamma-0.5_ctauPion-0.001
   #s-channel_mMed-1500_mDark-10_rinv-0.3_brgamma-0.5_ctauPion-100
   #s-channel_mMed-1500_mDark-10_rinv-0.3_brgamma-0.8_ctauPion-0.001
   #s-channel_mMed-1500_mDark-10_rinv-0.3_brgamma-0.8_ctauPion-100
   #s-channel_mMed-1500_mDark-10_rinv-0_brgamma-0.0_ctauPion-0.001
   #s-channel_mMed-1500_mDark-10_rinv-0_brgamma-0.3_ctauPion-0.001
   #s-channel_mMed-1500_mDark-10_rinv-0_brgamma-0.5_ctauPion-0.001
   #s-channel_mMed-1500_mDark-10_rinv-0_brgamma-0.5_ctauPion-100
   #s-channel_mMed-1500_mDark-10_rinv-0_brgamma-0.8_ctauPion-0.001
   #s-channel_mMed-1500_mDark-10_rinv-0_brgamma-0.8_ctauPion-100
   #s-channel_mMed-1500_mDark-5_rinv-0.3_brgamma-0.0_ctauPion-0.001
   #s-channel_mMed-1500_mDark-5_rinv-0.3_brgamma-0.0_ctauPion-100
   #s-channel_mMed-1500_mDark-5_rinv-0.3_brgamma-0.3_ctauPion-0.001
   #s-channel_mMed-1500_mDark-5_rinv-0.3_brgamma-0.3_ctauPion-100
   #s-channel_mMed-1500_mDark-5_rinv-0.3_brgamma-0.5_ctauPion-0.001
   #s-channel_mMed-1500_mDark-5_rinv-0.3_brgamma-0.5_ctauPion-100
   #s-channel_mMed-1500_mDark-5_rinv-0.3_brgamma-0.8_ctauPion-0.001
   #s-channel_mMed-1500_mDark-5_rinv-0.3_brgamma-0.8_ctauPion-100
   #s-channel_mMed-1500_mDark-5_rinv-0_brgamma-0.0_ctauPion-0.001
   #s-channel_mMed-1500_mDark-5_rinv-0_brgamma-0.0_ctauPion-100
   #s-channel_mMed-1500_mDark-5_rinv-0_brgamma-0.3_ctauPion-0.001
   #s-channel_mMed-1500_mDark-5_rinv-0_brgamma-0.3_ctauPion-100
   #s-channel_mMed-1500_mDark-5_rinv-0_brgamma-0.5_ctauPion-0.001
   #s-channel_mMed-1500_mDark-5_rinv-0_brgamma-0.5_ctauPion-100
   #s-channel_mMed-1500_mDark-5_rinv-0_brgamma-0.8_ctauPion-0.001
   #s-channel_mMed-1500_mDark-5_rinv-0_brgamma-0.8_ctauPion-100
   #s-channel_mMed-2500_mDark-10_rinv-0.3_brgamma-0.0_ctauPion-0.001
   #s-channel_mMed-2500_mDark-10_rinv-0.3_brgamma-0.0_ctauPion-100
   #s-channel_mMed-2500_mDark-10_rinv-0.3_brgamma-0.3_ctauPion-0.001
   #s-channel_mMed-2500_mDark-10_rinv-0.3_brgamma-0.5_ctauPion-0.001
   #s-channel_mMed-2500_mDark-10_rinv-0.3_brgamma-0.5_ctauPion-100
   #s-channel_mMed-2500_mDark-10_rinv-0.3_brgamma-0.8_ctauPion-0.001
   #s-channel_mMed-2500_mDark-10_rinv-0.3_brgamma-0.8_ctauPion-100
   #s-channel_mMed-2500_mDark-10_rinv-0_brgamma-0.0_ctauPion-0.001
   #s-channel_mMed-2500_mDark-10_rinv-0_brgamma-0.3_ctauPion-0.001
   #s-channel_mMed-2500_mDark-10_rinv-0_brgamma-0.5_ctauPion-0.001
   #s-channel_mMed-2500_mDark-10_rinv-0_brgamma-0.8_ctauPion-0.001
   #s-channel_mMed-2500_mDark-5_rinv-0.3_brgamma-0.0_ctauPion-0.001
   #s-channel_mMed-2500_mDark-5_rinv-0.3_brgamma-0.0_ctauPion-100
   #s-channel_mMed-2500_mDark-5_rinv-0.3_brgamma-0.3_ctauPion-0.001
   #s-channel_mMed-2500_mDark-5_rinv-0.3_brgamma-0.3_ctauPion-100
   #s-channel_mMed-2500_mDark-5_rinv-0.3_brgamma-0.5_ctauPion-0.001
   #s-channel_mMed-2500_mDark-5_rinv-0.3_brgamma-0.5_ctauPion-100
   #s-channel_mMed-2500_mDark-5_rinv-0.3_brgamma-0.8_ctauPion-0.001
   #s-channel_mMed-2500_mDark-5_rinv-0.3_brgamma-0.8_ctauPion-100
   #s-channel_mMed-2500_mDark-5_rinv-0_brgamma-0.0_ctauPion-0.001
   #s-channel_mMed-2500_mDark-5_rinv-0_brgamma-0.0_ctauPion-100
   #s-channel_mMed-2500_mDark-5_rinv-0_brgamma-0.3_ctauPion-0.001
   #s-channel_mMed-2500_mDark-5_rinv-0_brgamma-0.3_ctauPion-100
   #s-channel_mMed-2500_mDark-5_rinv-0_brgamma-0.5_ctauPion-0.001
   #s-channel_mMed-2500_mDark-5_rinv-0_brgamma-0.5_ctauPion-100
   #s-channel_mMed-2500_mDark-5_rinv-0_brgamma-0.8_ctauPion-0.001
   #s-channel_mMed-2500_mDark-5_rinv-0_brgamma-0.8_ctauPion-100
   #s-channel_mMed-3500_mDark-10_rinv-0.3_brgamma-0.0_ctauPion-0.001
   #s-channel_mMed-3500_mDark-10_rinv-0.3_brgamma-0.3_ctauPion-0.001
   #s-channel_mMed-3500_mDark-10_rinv-0.3_brgamma-0.3_ctauPion-100
   #s-channel_mMed-3500_mDark-10_rinv-0.3_brgamma-0.5_ctauPion-0.001
   #s-channel_mMed-3500_mDark-10_rinv-0.3_brgamma-0.5_ctauPion-100
   #s-channel_mMed-3500_mDark-10_rinv-0.3_brgamma-0.8_ctauPion-0.001
   #s-channel_mMed-3500_mDark-10_rinv-0.3_brgamma-0.8_ctauPion-100
   #s-channel_mMed-3500_mDark-10_rinv-0_brgamma-0.0_ctauPion-0.001
   #s-channel_mMed-3500_mDark-10_rinv-0_brgamma-0.3_ctauPion-0.001
   #s-channel_mMed-3500_mDark-10_rinv-0_brgamma-0.5_ctauPion-0.001
   #s-channel_mMed-3500_mDark-10_rinv-0_brgamma-0.8_ctauPion-0.001
   #s-channel_mMed-3500_mDark-5_rinv-0.3_brgamma-0.0_ctauPion-0.001
   #s-channel_mMed-3500_mDark-5_rinv-0.3_brgamma-0.0_ctauPion-100
   #s-channel_mMed-3500_mDark-5_rinv-0.3_brgamma-0.3_ctauPion-0.001
   #s-channel_mMed-3500_mDark-5_rinv-0.3_brgamma-0.3_ctauPion-100
   #s-channel_mMed-3500_mDark-5_rinv-0.3_brgamma-0.5_ctauPion-0.001
   #s-channel_mMed-3500_mDark-5_rinv-0.3_brgamma-0.5_ctauPion-100
   #s-channel_mMed-3500_mDark-5_rinv-0.3_brgamma-0.8_ctauPion-0.001
   #s-channel_mMed-3500_mDark-5_rinv-0.3_brgamma-0.8_ctauPion-100
   #s-channel_mMed-3500_mDark-5_rinv-0_brgamma-0.0_ctauPion-0.001
   #s-channel_mMed-3500_mDark-5_rinv-0_brgamma-0.0_ctauPion-100
   #s-channel_mMed-3500_mDark-5_rinv-0_brgamma-0.3_ctauPion-0.001
   #s-channel_mMed-3500_mDark-5_rinv-0_brgamma-0.3_ctauPion-100
   #s-channel_mMed-3500_mDark-5_rinv-0_brgamma-0.5_ctauPion-0.001
   #s-channel_mMed-3500_mDark-5_rinv-0_brgamma-0.5_ctauPion-100
   #s-channel_mMed-3500_mDark-5_rinv-0_brgamma-0.8_ctauPion-0.001
   #s-channel_mMed-3500_mDark-5_rinv-0_brgamma-0.8_ctauPion-100
   #s-channel_mMed-4500_mDark-10_rinv-0.3_brgamma-0.0_ctauPion-0.001
   #s-channel_mMed-4500_mDark-10_rinv-0.3_brgamma-0.3_ctauPion-0.001
   #s-channel_mMed-4500_mDark-10_rinv-0.3_brgamma-0.5_ctauPion-0.001
   #s-channel_mMed-4500_mDark-10_rinv-0.3_brgamma-0.5_ctauPion-100
   #s-channel_mMed-4500_mDark-10_rinv-0.3_brgamma-0.8_ctauPion-0.001
   #s-channel_mMed-4500_mDark-10_rinv-0.3_brgamma-0.8_ctauPion-100
   #s-channel_mMed-4500_mDark-10_rinv-0_brgamma-0.0_ctauPion-0.001
   #s-channel_mMed-4500_mDark-10_rinv-0_brgamma-0.3_ctauPion-0.001
   #s-channel_mMed-4500_mDark-10_rinv-0_brgamma-0.5_ctauPion-0.001
   #s-channel_mMed-4500_mDark-10_rinv-0_brgamma-0.8_ctauPion-0.001
   #s-channel_mMed-4500_mDark-5_rinv-0.3_brgamma-0.0_ctauPion-0.001
   #s-channel_mMed-4500_mDark-5_rinv-0.3_brgamma-0.0_ctauPion-100
   #s-channel_mMed-4500_mDark-5_rinv-0.3_brgamma-0.3_ctauPion-0.001
   #s-channel_mMed-4500_mDark-5_rinv-0.3_brgamma-0.3_ctauPion-100
   #s-channel_mMed-4500_mDark-5_rinv-0.3_brgamma-0.5_ctauPion-0.001
   #s-channel_mMed-4500_mDark-5_rinv-0.3_brgamma-0.5_ctauPion-100
   #s-channel_mMed-4500_mDark-5_rinv-0.3_brgamma-0.8_ctauPion-0.001
   #s-channel_mMed-4500_mDark-5_rinv-0.3_brgamma-0.8_ctauPion-100
   #s-channel_mMed-4500_mDark-5_rinv-0_brgamma-0.0_ctauPion-0.001
   #s-channel_mMed-4500_mDark-5_rinv-0_brgamma-0.0_ctauPion-100
   #s-channel_mMed-4500_mDark-5_rinv-0_brgamma-0.3_ctauPion-0.001
   #s-channel_mMed-4500_mDark-5_rinv-0_brgamma-0.3_ctauPion-100
   #s-channel_mMed-4500_mDark-5_rinv-0_brgamma-0.5_ctauPion-0.001
   #s-channel_mMed-4500_mDark-5_rinv-0_brgamma-0.5_ctauPion-100
   #s-channel_mMed-4500_mDark-5_rinv-0_brgamma-0.8_ctauPion-0.001
   #s-channel_mMed-4500_mDark-5_rinv-0_brgamma-0.8_ctauPion-100
   #s-channel_mMed-500_mDark-10_rinv-0.3_brgamma-0.0_ctauPion-0.001
   #s-channel_mMed-500_mDark-10_rinv-0.3_brgamma-0.0_ctauPion-100
   #s-channel_mMed-500_mDark-10_rinv-0.3_brgamma-0.3_ctauPion-0.001
   #s-channel_mMed-500_mDark-10_rinv-0.3_brgamma-0.3_ctauPion-100
   #s-channel_mMed-500_mDark-10_rinv-0.3_brgamma-0.5_ctauPion-0.001
   #s-channel_mMed-500_mDark-10_rinv-0.3_brgamma-0.5_ctauPion-100
   #s-channel_mMed-500_mDark-10_rinv-0.3_brgamma-0.8_ctauPion-0.001
   #s-channel_mMed-500_mDark-10_rinv-0.3_brgamma-0.8_ctauPion-100
   #s-channel_mMed-500_mDark-10_rinv-0_brgamma-0.0_ctauPion-0.001
   #s-channel_mMed-500_mDark-10_rinv-0_brgamma-0.0_ctauPion-100
   #s-channel_mMed-500_mDark-10_rinv-0_brgamma-0.3_ctauPion-0.001
   #s-channel_mMed-500_mDark-10_rinv-0_brgamma-0.3_ctauPion-100
   #s-channel_mMed-500_mDark-10_rinv-0_brgamma-0.5_ctauPion-0.001
   #s-channel_mMed-500_mDark-10_rinv-0_brgamma-0.5_ctauPion-100
   #s-channel_mMed-500_mDark-10_rinv-0_brgamma-0.8_ctauPion-0.001
   #s-channel_mMed-500_mDark-10_rinv-0_brgamma-0.8_ctauPion-100
   #s-channel_mMed-500_mDark-5_rinv-0.3_brgamma-0.0_ctauPion-0.001
   #s-channel_mMed-500_mDark-5_rinv-0.3_brgamma-0.0_ctauPion-100
   #s-channel_mMed-500_mDark-5_rinv-0.3_brgamma-0.3_ctauPion-0.001
   #s-channel_mMed-500_mDark-5_rinv-0.3_brgamma-0.3_ctauPion-100
   #s-channel_mMed-500_mDark-5_rinv-0.3_brgamma-0.5_ctauPion-0.001
   #s-channel_mMed-500_mDark-5_rinv-0.3_brgamma-0.5_ctauPion-100
   #s-channel_mMed-500_mDark-5_rinv-0.3_brgamma-0.8_ctauPion-0.001
   #s-channel_mMed-500_mDark-5_rinv-0.3_brgamma-0.8_ctauPion-100
   #s-channel_mMed-500_mDark-5_rinv-0_brgamma-0.0_ctauPion-0.001
   #s-channel_mMed-500_mDark-5_rinv-0_brgamma-0.0_ctauPion-100
   #s-channel_mMed-500_mDark-5_rinv-0_brgamma-0.3_ctauPion-0.001
   #s-channel_mMed-500_mDark-5_rinv-0_brgamma-0.3_ctauPion-100
   #s-channel_mMed-500_mDark-5_rinv-0_brgamma-0.5_ctauPion-0.001
   #s-channel_mMed-500_mDark-5_rinv-0_brgamma-0.5_ctauPion-100
   #s-channel_mMed-500_mDark-5_rinv-0_brgamma-0.8_ctauPion-0.001
   #s-channel_mMed-500_mDark-5_rinv-0_brgamma-0.8_ctauPion-100
   #s-channel_mMed-700_mDark-10_rinv-0.3_brgamma-0.0_ctauPion-0.001
   #s-channel_mMed-700_mDark-10_rinv-0.3_brgamma-0.0_ctauPion-100
   #s-channel_mMed-700_mDark-10_rinv-0.3_brgamma-0.3_ctauPion-0.001
   #s-channel_mMed-700_mDark-10_rinv-0.3_brgamma-0.3_ctauPion-100
   #s-channel_mMed-700_mDark-10_rinv-0.3_brgamma-0.5_ctauPion-0.001
   #s-channel_mMed-700_mDark-10_rinv-0.3_brgamma-0.5_ctauPion-100
   #s-channel_mMed-700_mDark-10_rinv-0.3_brgamma-0.8_ctauPion-0.001
   #s-channel_mMed-700_mDark-10_rinv-0.3_brgamma-0.8_ctauPion-100
   #s-channel_mMed-700_mDark-10_rinv-0_brgamma-0.0_ctauPion-0.001
   #s-channel_mMed-700_mDark-10_rinv-0_brgamma-0.0_ctauPion-100
   #s-channel_mMed-700_mDark-10_rinv-0_brgamma-0.3_ctauPion-0.001
   #s-channel_mMed-700_mDark-10_rinv-0_brgamma-0.3_ctauPion-100
   #s-channel_mMed-700_mDark-10_rinv-0_brgamma-0.5_ctauPion-0.001
   #s-channel_mMed-700_mDark-10_rinv-0_brgamma-0.5_ctauPion-100
   #s-channel_mMed-700_mDark-10_rinv-0_brgamma-0.8_ctauPion-0.001
   #s-channel_mMed-700_mDark-10_rinv-0_brgamma-0.8_ctauPion-100
   #s-channel_mMed-700_mDark-5_rinv-0.3_brgamma-0.0_ctauPion-0.001
   #s-channel_mMed-700_mDark-5_rinv-0.3_brgamma-0.0_ctauPion-100
   #s-channel_mMed-700_mDark-5_rinv-0.3_brgamma-0.3_ctauPion-0.001
   #s-channel_mMed-700_mDark-5_rinv-0.3_brgamma-0.3_ctauPion-100
   #s-channel_mMed-700_mDark-5_rinv-0.3_brgamma-0.5_ctauPion-0.001
   #s-channel_mMed-700_mDark-5_rinv-0.3_brgamma-0.5_ctauPion-100
   #s-channel_mMed-700_mDark-5_rinv-0.3_brgamma-0.8_ctauPion-0.001
   #s-channel_mMed-700_mDark-5_rinv-0.3_brgamma-0.8_ctauPion-100
   #s-channel_mMed-700_mDark-5_rinv-0_brgamma-0.0_ctauPion-0.001
   #s-channel_mMed-700_mDark-5_rinv-0_brgamma-0.0_ctauPion-100
   #s-channel_mMed-700_mDark-5_rinv-0_brgamma-0.3_ctauPion-0.001
   #s-channel_mMed-700_mDark-5_rinv-0_brgamma-0.3_ctauPion-100
   #s-channel_mMed-700_mDark-5_rinv-0_brgamma-0.5_ctauPion-0.001
   #s-channel_mMed-700_mDark-5_rinv-0_brgamma-0.5_ctauPion-100
   #s-channel_mMed-700_mDark-5_rinv-0_brgamma-0.8_ctauPion-0.001
   #s-channel_mMed-700_mDark-5_rinv-0_brgamma-0.8_ctauPion-100
   #s-channel_mMed-850_mDark-10_rinv-0.3_brgamma-0.0_ctauPion-0.001
   #s-channel_mMed-850_mDark-10_rinv-0.3_brgamma-0.0_ctauPion-100
   #s-channel_mMed-850_mDark-10_rinv-0.3_brgamma-0.3_ctauPion-0.001
   #s-channel_mMed-850_mDark-10_rinv-0.3_brgamma-0.3_ctauPion-100
   #s-channel_mMed-850_mDark-10_rinv-0.3_brgamma-0.5_ctauPion-0.001
   #s-channel_mMed-850_mDark-10_rinv-0.3_brgamma-0.5_ctauPion-100
   #s-channel_mMed-850_mDark-10_rinv-0.3_brgamma-0.8_ctauPion-0.001
   #s-channel_mMed-850_mDark-10_rinv-0.3_brgamma-0.8_ctauPion-100
   #s-channel_mMed-850_mDark-10_rinv-0_brgamma-0.0_ctauPion-0.001
   #s-channel_mMed-850_mDark-10_rinv-0_brgamma-0.3_ctauPion-0.001
   #s-channel_mMed-850_mDark-10_rinv-0_brgamma-0.3_ctauPion-100
   #s-channel_mMed-850_mDark-10_rinv-0_brgamma-0.5_ctauPion-0.001
   #s-channel_mMed-850_mDark-10_rinv-0_brgamma-0.5_ctauPion-100
   #s-channel_mMed-850_mDark-10_rinv-0_brgamma-0.8_ctauPion-0.001
   #s-channel_mMed-850_mDark-10_rinv-0_brgamma-0.8_ctauPion-100
   #s-channel_mMed-850_mDark-5_rinv-0.3_brgamma-0.0_ctauPion-0.001
   #s-channel_mMed-850_mDark-5_rinv-0.3_brgamma-0.0_ctauPion-100
   #s-channel_mMed-850_mDark-5_rinv-0.3_brgamma-0.3_ctauPion-0.001
   #s-channel_mMed-850_mDark-5_rinv-0.3_brgamma-0.3_ctauPion-100
   #s-channel_mMed-850_mDark-5_rinv-0.3_brgamma-0.5_ctauPion-0.001
   #s-channel_mMed-850_mDark-5_rinv-0.3_brgamma-0.5_ctauPion-100
   #s-channel_mMed-850_mDark-5_rinv-0.3_brgamma-0.8_ctauPion-0.001
   #s-channel_mMed-850_mDark-5_rinv-0.3_brgamma-0.8_ctauPion-100
   #s-channel_mMed-850_mDark-5_rinv-0_brgamma-0.0_ctauPion-0.001
   #s-channel_mMed-850_mDark-5_rinv-0_brgamma-0.0_ctauPion-100
   #s-channel_mMed-850_mDark-5_rinv-0_brgamma-0.3_ctauPion-0.001
   #s-channel_mMed-850_mDark-5_rinv-0_brgamma-0.3_ctauPion-100
   #s-channel_mMed-850_mDark-5_rinv-0_brgamma-0.5_ctauPion-0.001
   #s-channel_mMed-850_mDark-5_rinv-0_brgamma-0.5_ctauPion-100
   #s-channel_mMed-850_mDark-5_rinv-0_brgamma-0.8_ctauPion-0.001
   #s-channel_mMed-850_mDark-5_rinv-0_brgamma-0.8_ctauPion-100

    # #
    # # Backgrounds
    # #
    # # QCD
    # #
    #QCD_Bin-PT-170to300
    #QCD_Bin-PT-300to470
    #QCD_Bin-PT-470to600
    #QCD_Bin-PT-600to800
    #QCD_Bin-PT-800to1000
    #QCD_Bin-PT-1000to1500
    #QCD_Bin-PT-1500to2000
    #QCD_Bin-PT-2000to2500
    #QCD_Bin-PT-2500to3000
    #QCD_Bin-PT-3000toInf


    # #
    # # TTJets
    # #
    #TT-3Jets_Bin-HT-100to400
    #TT-3Jets_Bin-HT-400to800
    #TT-3Jets_Bin-HT-800to1500
    #TT-3Jets_Bin-HT-1500to2500
    #TT-3Jets_Bin-HT-2500toInf

    # #
    # # WJets
    # #
    # 

    # #
    # # ZJets
    # #
    # 

    # #
    # # Gamma+jets
    # #
    # 

    # #
    # # EM QCD
    # #
    # 

    # #
    # # Data
    # #
    # 

)


prepare_input_files_list() {

    local dataset_config=$1
    local dataset_directory=$2
    local module=$3
    local selection_name=$4
    local year=$5
    local dataset_name=$6

    echo ""
    echo "Preparing input files for dataset ${dataset_name} year ${year} and selection ${selection_name}"

    #python list_dataset_files.py -d ${dataset_name} -y ${year} -c ${dataset_config} -o ${dataset_directory} -nano
    #python compute_unweighted_selection_efficiency.py -d ${dataset_name} -y ${year} -p ${module} -s ${selection_name} -i ${dataset_directory} -o ${dataset_directory} -n 30 -e futures -c 1000 -nano  -precision 15 -mc
    python prepare_input_files_list.py -d ${dataset_name} -y ${year} -s ${selection_name} -i ${dataset_directory} -o ${dataset_directory} -m 50000 #50000
}


for dataset_name in ${dataset_names[@]}; do

    prepare_input_files_list ${dataset_config} ${dataset_directory} ${module} ${selection_name} ${year} ${dataset_name}

done

