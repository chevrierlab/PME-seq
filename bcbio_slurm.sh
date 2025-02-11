#!/bin/bash
#SBATCH -n 1
#SBATCH -J bcbio_protoc
#SBATCH --mem=16GB
#SBATCH -p broadwl
TAG=$1
bcbio_nextgen.py --retries 3 --tag protoc -s slurm --timeout 6000 -n 96 -q broadwl -t ipython ../config/bcbio_samples.yaml
