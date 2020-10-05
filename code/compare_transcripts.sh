#!/bin/bash

WORKING_DIR="/project/samee/minjun/RNAseq/code/reference/transcriptome"

gffcompare -r $WORKING_DIR/Homo_sapiens.GRCh38.101.gtf -o /project/samee/minjun/RNAseq/code/transcripts/gffcmp $WORKING_DIR/stringtie_merged.gtf
