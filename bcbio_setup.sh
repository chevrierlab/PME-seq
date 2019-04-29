#Directory containing:
#Run/
#	fastq/
#		samples.fastq.gz
#	bcbio_samples.csv
#	illumina-rnaseq.yaml

bcbio_nextgen.py -w template illumina-rnaseq.yaml bcbio_samples.csv fastqs/*.gz


mv bcbio_slurm.sh bcbio_samples/work
cd bcbio_samples/work

# make/move bcbio_slurm.sh to work/ 
sbatch bcbio_slurm.sh
