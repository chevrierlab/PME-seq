# nature-protocol

This repository contains an example for running a differential expression analysis using bcbio to align the fastq files, and the limma package in R to model differential expression. 

## files
* _comparison_data_: TPM matrices for comparing our data to other datasets in _comparison.Rmd_
* _comparison.Rmd_: R Markdown document for comparing our data to other datasets
* _tissue_specificity_analysis.Rmd_: R Markdown document detailing the tissue specificity analysis
* _bcbio_run.sh_: Script for preparing and launching bcbio
* _bcbio_slurm.sh_: Script for running bcbio, intended to be submitted to a cluster (_bcbio_run.sh_ does this)
* _illumina-rnaseq.yaml_: Template description of bcbio pipeline. Used by _bcbio_run.sh_ to set up for bcbio.

## dependencies
The provided bits of code assume you have the following software installed: 
* [bcbio](https://github.com/bcbio/bcbio-nextgen)
* [R](https://www.r-project.org/) and [RMarkdown](https://rmarkdown.rstudio.com/), likely through [Rstudio](https://www.rstudio.com/)

When running bcbio, the code also assumes that you are working on a linux-based computing cluster, running a scheduler. As written, it is setup for the SLURM scheduler, but it should work with other schedulers with minor modifications to _bcbio_run.sh_ and _bcbio_slurm.sh_ . Additionally, by modifying _bcbio_run.sh_ (and bipassing _bcbio_slurm.sh_), one could run bcbio locally as an alternative.

## 1: bcbio
While logged into your computing cluster of choice, in the main directory run `./bcbio_run.sh`. This will run a few commands to set up the directory for aligning with bcbio, and then submit the job descirbed in _bcbio_slurm.sh_ to the cluster.

## 2: R
Open _tissue_specificity_analysis.Rmd_ in Rstudio. To run it all at once, knit it. Alternatively, you can step through the commands one by one.
