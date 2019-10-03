#!/bin/bash
# this script makes a folder for fastq files 
# then downloads the fastq files into it, and names them properly

# make a folder to keep our fastqs and move into it
mkdir fastqs
cd fastqs

# we're reading in the information on from our SRA csv and operating on each line
for line in `cat ../sra_data.csv`; do
    # we're moving the line into an array that's split by commas
    # this way we can access the SRA number and the sample name separately 
    IFS=',' read -ra line_arr <<< "$line";
    # we use fasterq-dump from the SRA toolkit to download the fastq file
    # the SRA number is the zeroth element of our array
    fasterq-dump ${line_arr[0]}
    # fasterq-dump names the file after the SRA number, we rename it with the sample name
    # the sample name is the first element of our array
    mv ${line_arr[0]}.fastq ${line_arr[1]}.fastq
    # zipped fastq files take up much less space, so it's better to store them zipped
    # comment out this line if you don't care about storage 
    # and want this script to be faster
    # (but don't forget to remove the ".gz" from bcbio_run.sh)
    gzip ${line_arr[1]}.fastq 

    # just some convenient messaging
    echo Finished ${line_arr[1]}
done

# return to the main folder
cd ..
