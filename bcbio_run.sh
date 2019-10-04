#!/bin/bash
# this script prepares and launches bcbio 
# after running it nothing else needs to be done for bcbio

# Directory containing:
# Run/
#	  fastq/
#		  samples.fastq.gz
#	  illumina-rnaseq.yaml

# bcbio needs a csv file with a list of all of our fastq files
ls fastqs/ -1 > bcbio_samples.csv

# this command sets up the directory and configuration for bcbio
bcbio_nextgen.py -w template illumina-rnaseq.yaml bcbio_samples.csv fastqs/*.gz

# bcbio needs to be run from the newly created work directory
# so we move the script we'll submit to the cluster into that directory
mv bcbio_slurm.sh bcbio_samples/work
# then we move ourselves to the work directory
cd bcbio_samples/work

# sbatch submits our script that runs bcbio to the computing cluster
# from here it will run on the cluster (with slurm, it's progress can be checked with squeue)
sbatch bcbio_slurm.sh

# to run bcbio locally instead of submitting it as a job, use:
# bcbio_nextgen.py ../config/bcbio_samples.yaml
