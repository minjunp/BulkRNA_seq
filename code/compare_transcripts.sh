#!/bin/bash

WORKING_DIR="/project/samee/minjun/RNAseq/code/reference/transcriptome"

gffcompare -r $WORKING_DIR/hg19.refGene.gtf -o /project/samee/minjun/RNAseq/code/transcripts/gffcmp $WORKING_DIR/stringtie_merged.gtf
