#!/bin/bash

WORKING_DIR=$(pwd)

# loop over all names
for i in $(ls | grep "HA" | cut -f1 -d"_")
do 
	treatment=$(cat /project/samee/minjun/RNAseq/data/treatment.txt | awk -v var=$i '{if ($1==var) print $2}')
	
	folder_name=$i*
	cd $folder_name
	fastq_start=$(ls | head -1)
	fastq_end=$(ls | tail -1)
	
	/project/samee/minjun/RNAseq/code/run_hisat2.sh $fastq_start $fastq_end ${i}_${treatment}.bam

	cd $WORKING_DIR # go back to working directory
done 
