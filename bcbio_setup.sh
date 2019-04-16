#Directory containing:
#Run/
#	fastq/
#		samples.fq
#	samples.csv
#	illumina-rnaseq.yaml

bcbio_nextgen.py -w template illumina-rnaseq.yaml samples.csv fastq/

cd samples/work

# make/move bcbio_slurm.sh to work/ 
sbatch bcbio_slurm.sh