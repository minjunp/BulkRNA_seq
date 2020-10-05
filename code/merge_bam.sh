#!/bin/bash

# $1: all bam files to merge
WORKING_DIR=$(pwd)
cd /project/samee/minjun/RNAseq/code/alignments
for i in Vehicle Lactate ARC Lactate_ARC
do	
	pairs=$(ls *.bam | grep ${i} | awk '{x=x$1" "}END{print x}')
	echo $pairs
	sambamba merge -t 8 /project/samee/minjun/RNAseq/code/alignments/merged/${i}_merged.bam $pairs
done
# indexing BAMs
module load samtools/1.9
cd /project/samee/minjun/RNAseq/code/alignments/merged
for i in $(ls *bam)
do
        samtools index $i
done

