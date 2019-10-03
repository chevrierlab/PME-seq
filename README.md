# PME-seq

This repository contains an example for running a differential expression analysis using bcbio to align the fastq files, and the limma package in R to model differential expression between tissues. It also contains code comparing the data used to data from a few other sources.

## files
* _bcbio_run.sh_: Script for preparing and launching bcbio
* _bcbio_slurm.sh_: Script for running bcbio, intended to be submitted to a cluster (_bcbio_run.sh_ does this)
* _comparison_data_: TPM matrices for comparing our data to other datasets in _comparison.Rmd_
* _comparison.Rmd_: R Markdown document for comparing our data to other datasets
* _download_fastqs.sh_: Script for downloading fastq files using the SRA toolkit
* _illumina-rnaseq.yaml_: Template description of bcbio pipeline. Used by _bcbio_run.sh_ to set up for bcbio
* _immune_specific_genes.txt_: a list of immune specific genes used in _tissue_specificity_analysis.Rmd_
* _sra_data.csv_: a csv files with SRA numbers in the first column and the corresponding sample name in the second column
* _tissue_specificity_analysis.Rmd_: R Markdown document detailing the tissue specificity analysis

## dependencies
The provided bits of code assume you have the following software installed: 
* [bcbio](https://github.com/bcbio/bcbio-nextgen)
  * bcbio is a tool for running various pre-processing pipelines for sequencing data.
  * The code was originally run on version 1.1.5
* [R](https://www.r-project.org/) and [RMarkdown](https://rmarkdown.rstudio.com/), we recommend using both with [Rstudio](https://www.rstudio.com/).
  * R is a programming language, and RMarkdown is a package for producing documents with embedded R scripts. Rstudio is an integrated devolpment enviroment (IDE) for R. 
  * The code was originally run on R version 3.5.2 and RStudio version 1.1.456
* [SRA toolkit](https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?view=software)
  * The NCBI SRA toolkit is a suite of programs used for accessing files from the SRA databse
  * The code was originally run on version 2.9.3

When running bcbio, the code also assumes that you are working on a linux-based computing cluster, running a scheduler. As written, it is setup for the SLURM scheduler, but it should work with other schedulers with minor modifications to _bcbio_run.sh_ and _bcbio_slurm.sh_ . Additionally, by modifying _bcbio_run.sh_ (and bipassing _bcbio_slurm.sh_), one could run bcbio locally as an alternative.

## Steps:
### 1: bcbio
We use bcbio to align our fastq files to a reference genome and then produce a table of counts for each gene/sample. 

Run `./download_fastqs.sh`. This runs a few commands to make a _fastqs_ directory, and then to download fastq files into it. This is the script that depends on the SRA toolkit.

While logged into your computing cluster of choice, in the main directory run `./bcbio_run.sh`. This will run a few commands to set up the directory for aligning with bcbio, and then submit the job descirbed in _bcbio_slurm.sh_ to the cluster.

### 2: Tissue Specificity Analysis 
We use R to analyze the counts table produced in __(1)__ to look for genes which are upregulated in particular tissues.

Open _tissue_specificity_analysis.Rmd_ in Rstudio. To run it all at once, knit it (there should be a "knit" button on the upper bar). Alternatively, you can step through the commands one by one.

### 3: Dataset Comparison
We use R to compare our data to data from a few other sources and asses its validity.

Open _comparison.Rmd_ in Rstudio. To run it all at once, knit it. Alternatively, you can step through the commands one by one.

Will take 20-30 minutes.
