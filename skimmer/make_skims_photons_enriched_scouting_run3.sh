#!/bin/bash

MEMORY=4GB
CORES=1
CHUNK_SIZE=100000 #10000 or 1000
N_WORKERS=8
#EXECUTOR=dask/etpcondor   # HTCondor at KIT ETP
#PORT=3719 # port for dask scheduler, needs to be opened by admins
#N_WORKERS=6
EXECUTOR=futures     # local job
FORCE_RECREATE=1 # 1 to recreate output file if it exists, 0 else
FIRST_FILE=0
LAST_FILE=-1 #150  # Use -1 to skim all input files

#MEMORY=10GB
#TIME=12:00:00
#PARTITION=standard
#CORES=2
#CHUNK_SIZE=10000
#N_WORKERS=300
##EXECUTOR=dask/lpccondor    # HTCondor at LPC
#EXECUTOR=dask/slurm          #dask/slurm     # local job
#FORCE_RECREATE=1   # 1 to recreate output file if it exists, 0 else
#FIRST_FILE=0
#LAST_FILE=-1  # Use -1 to skim all input files

dataset_directory=/work/cazzanig/datasets_photons_enriched_run3_scouting/

module=analysis_configs.scouting_run3_photon_enriched_pre_selection
selection_name=dummy_pre_selection

pfnano_corrections_file=/work/cazzanig/lund_weights_scouting/merged_processing/SVJProcessing/data/corrections_2026-06-10_09-23-50_all_corr.coffea

year=2024

add_weights_variations=0  # 1 to add PDF/scale weight variations, 0 else
apply_scouting_jec=0     # 1 to apply custom scouting residual JECs, 0 to disable

variations=(
    nominal
    # JEC/JER variations
    #jec_up
    #jec_down
    #jer_up
    #jer_down
    # Unclustered energy variations
    #unclEn_up
    #unclEn_down
    #SVJjec_up 
    #SVJjec_down
)

# Output directory for nominal samples - no variation of the uncertainties
#output_directory=root://cmseos.fnal.gov//store/user/lpcdarkqcd/tchannel_UL/${year}/Full/PrivateSkims/${variation}
output_directory=root://storage01.lcg.cscs.ch:1096//pnfs/lcg.cscs.ch/cms/trivcat/store/user/cazzanig/skims_example/ #_small


dataset_names=(
    #
    # Signals
    #
   
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

cross_sections=(
    # # We normalize all the signals to 1 pb, so that we can easily scale them to any cross section we want in the analysis.
    #
    # Signals
    #
    
    1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0
    #1.0

    # #
    # # Backgrounds
    # #
    # # QCD
    # #
    #113300.0
    #7581.0
    #623.3
    #178.7
    #30.62
    #9.306
    #0.5015
    #0.04264	
    #0.004454
    #0.0005539

    # #
    # # TTJets
    # #
    #92.66
    #8.046	
    #0.7624
    #0.03632
    #0.001523

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
make_skims() {

    local dataset_directory=$1
    local module=$2
    local selection_name=$3
    local year=$4
    local variation=$5
    local dataset_name=$6
    local output_directory=$7
    local xsec=$8

    echo "Output directory: ${output_directory}/${year}/${selection_name}/${variation}/${dataset_name}"

    # Path automatically built when preparing input files lists
    local files_list_directory=${dataset_directory}/skim_input_files_list/${year}/${selection_name}/${dataset_name}
    local output_directory=${output_directory}/${year}/${selection_name}/${variation}/${dataset_name}

    #create output directory if it does not exist
    #gfal-mkdir -p ${output_directory}


    local output_redirector=$(echo ${output_directory} | cut -d/ -f 1-4)
    local output_dir=$(echo ${output_directory} | cut -d/ -f 4-)
    xrdfs ${output_redirector} ls ${output_dir} > /dev/null 2>&1
    if [ "$?" != "0" ]; then
        xrdfs ${output_redirector} mkdir -p ${output_dir}
    fi

    i_file=-1
    for files_list in $(ls ${files_list_directory} | sort -V); do
        ((i_file++))
        if [ ${i_file} -le ${LAST_FILE} ] || [ "${LAST_FILE}" == "-1" ]; then
            if [ ${i_file} -ge ${FIRST_FILE} ]; then

                local input_files=${files_list_directory}/${files_list}
                local output_file=${output_directory}/${files_list/.txt/.root}
                local output_file_name_tmp=$(echo ${ouput_file}_$(date +"%Y%m%d-%H%M%S") | shasum | cut -d " " -f1).root
                local output_file_tmp=/work/${USER}/tmp/${output_file_name_tmp}

                echo ""
                echo "Making skim file ${output_file}"

                local output_redirector=$(echo ${output_file} | cut -d/ -f 1-4)
                local output_file_path=$(echo ${output_file} | cut -d/ -f 4-)
                xrdfs ${output_redirector} ls ${output_file_path} > /dev/null 2>&1
                if [ "$?" != "0" ] || [ "${FORCE_RECREATE}" == "1" ]; then
                    if [ "${apply_scouting_jec}" == "1" ]; then
                        scouting_jec_flag=""
                    else
                        scouting_jec_flag="--disable_scouting_jec"
                    fi
                    if [ "${variation}" == "nominal" ]; then
                        variation_flag=""
                    else
                        variation_flag="-varnano ${variation}"
                    fi
                    if [ ${add_weights_variations} == 1 ]; then
                        weight_variation_flag="-wvarnano scale pdf pu"
                    else
                        weight_variation_flag=""
                    fi
                    python skim.py -i ${input_files} -o ${output_file_tmp} -p ${module} -pd ${dataset_name} -y ${year} -nano -mc -xsec ${xsec} -e ${EXECUTOR} -n ${N_WORKERS} -c ${CHUNK_SIZE} --memory ${MEMORY} --cores ${CORES} -pn_tagger ${variation_flag} ${weight_variation_flag} ${scouting_jec_flag} -m 1
                    #python skim.py -i ${input_files} -o ${output_file_tmp} -p ${module} -pd ${dataset_name} -y ${year} -e ${EXECUTOR} -n ${N_WORKERS} -c ${CHUNK_SIZE} --memory ${MEMORY} --queue ${PARTITION} --cores ${CORES} ${variation_flag} ${weight_variation_flag} ${scouting_jec_flag} -xsec ${xsec} -corrfile ${pfnano_corrections_file} -nano -mc  

                    xrdcp -f ${output_file_tmp} ${output_file}
                    echo ${output_file} has been saved.
                    rm ${output_file_tmp}
                else
                    echo ${output_file} already exists and FORCE_RECREATE is 0. Skipping.
                fi
            fi
        fi
    done
}


#for dataset_name in ${dataset_names[@]}; do
#    make_skims ${dataset_directory} ${module} ${selection_name} ${year} ${dataset_name} ${output_directory}
#done

n_datasets=${#dataset_names[@]}

for ((i=0; i<$n_datasets; i++)); do
    dataset_name=${dataset_names[i]}
    cross_section=${cross_sections[i]}
    for variation in ${variations[@]}; do
        make_skims ${dataset_directory} ${module} ${selection_name} ${year} ${variation} ${dataset_name} ${output_directory} ${cross_section}
    done
done
