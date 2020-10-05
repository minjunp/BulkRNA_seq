#!/bin/bash

# create a unified version of the transcriptome before proceeding to comparing expression between samples. 
#  The StringTie --merge option is used to combine multiple GTFs into a single GTF.
WORKING_DIR="/project/samee/minjun/RNAseq/code/reference/transcriptome"
stringtie --merge -p 8 -G $WORKING_DIR/Homo_sapiens.GRCh38.101.gtf -o $WORKING_DIR/stringtie_merged.gtf $WORKING_DIR/Vehicle.gtf $WORKING_DIR/Lactate.gtf $WORKING_DIR/ARC.gtf $WORKING_DIR/Lactate_ARC.gtf
