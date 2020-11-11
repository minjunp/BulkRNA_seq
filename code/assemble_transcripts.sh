#!/bin/bash

# -l <label>: Sets <label> as the prefix for the name of the output transcripts. Default: STRG
WORKING_DIR="/project/samee/minjun/RNAseq/code/reference/transcriptome"

for i in Vehicle Lactate ARC Lactate_ARC
do
stringtie -G $WORKING_DIR/hg19.refGene.gtf -o $WORKING_DIR/RNAseq_${i}.gtf -p 8 /project/samee/minjun/RNAseq/code/alignments/merged/${i}_merged.bam
done 

