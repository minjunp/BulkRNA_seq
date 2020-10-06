#!/bin/bash

# create a unified version of the transcriptome before proceeding to comparing expression between samples. 
#  The StringTie --merge option is used to combine multiple GTFs into a single GTF.
WORKING_DIR="/project/samee/minjun/RNAseq/code/reference/transcriptome"
stringtie --merge -p 8 -G $WORKING_DIR/hg19.refGene.gtf -o $WORKING_DIR/stringtie_merged.gtf $WORKING_DIR/RNAseq_Vehicle.gtf $WORKING_DIR/RNAseq_Lactate.gtf $WORKING_DIR/RNAseq_ARC.gtf $WORKING_DIR/RNAseq_Lactate_ARC.gtf
