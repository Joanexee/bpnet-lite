#!/bin/bash
#SBATCH --job-name=bpnet_train
#SBATCH --output=logs/bpnet_negative_%j.out
#SBATCH --error=logs/bpnet_negative_%j.err
#SBATCH --time=24:00:00                    # Walltime: HH:MM:SS
#SBATCH --account=mcieslik0
#SBATCH --partition=spgpu                    # Or use spgpu for A40s
#SBATCH --gres=gpu:1                       # Request 1 GPU
#SBATCH --cpus-per-task=10                 # Use 30 CPU cores
#SBATCH --mem=20G                          # Use 50 GB of memory
#SBATCH --ntasks=1                         # Single task (not MPI)

source ~/.bashrc
# Activate your environment
conda activate BPNet-env  # Make sure to use your BPNet environment
# Run your training script
cd /home/haotingc/scratch_mcieslik/bpnet-lite/notebooks/bpnet_example
# bpnet negatives -i "../../examples/ENCSR000AKO.bed" -f "/home/haotingc/scratch_mcieslik/Lyra_model/genome/hg38.fa" -o "../../examples/ENCSR000AKO_negatives.bed" -w 2114 -x 1000 -v
# bpnet fit -p bpnet_fit_example.json
bpnet predict -p bpnet_predict_example.json
