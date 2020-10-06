#!/bin/bash

# -e: Limits the processing of read alignments to only estimate and output the assembled transcripts matching the reference transcripts given with the -G option (requires -G, recommended for -B/-b). With this option, read bundles with no reference transcripts will be entirely skipped, which may provide a considerable speed boost when the given set of reference transcripts is limited to a set of target genes, for example.
# -B: This switch enables the output of Ballgown input table files (*.ctab) containing coverage data for the reference transcripts given with the -G option.
# -G <ref_ann.gff>: Use the reference annotation file (in GTF or GFF3 format) to guide the assembly process.
# -A <gene_abund.tab>: Gene abundances will be reported (tab delimited format) in the output file with the given name.
# -o <out_gtf>: output file name of the merged transcripts GTF  
WORKING_DIR="/project/samee/minjun/RNAseq/code"
BALLGOWN_DIR="/project/samee/minjun/RNAseq/code/ballgown"

cd $BALLGOWN_DIR
filenames="/project/samee/minjun/RNAseq/data/treatment.txt"
for i in $(cat $filenames | cut -f1)
do
	mkdir -p RNAseq_$i
	cd $WORKING_DIR/alignments
	filename=$(ls ${i}*.bam)
	cd $BALLGOWN_DIR	

	stringtie -e -B -G $WORKING_DIR/transcripts/gffcmp.annotated.gtf -A RNAseq_${i}_abundance.out -o $BALLGOWN_DIR/RNAseq_${i}/${i}.gtf -p 8 $WORKING_DIR/alignments/${filename}
done

for i in Vehicle Lactate ARC Lactate_ARC
do
mkdir -p RNAseq_${i}_merged
stringtie -e -B -G $WORKING_DIR/transcripts/gffcmp.annotated.gtf -A RNAseq_${i}_abundance.out -o $BALLGOWN_DIR/RNAseq_${i}_merged/${i}.gtf -p 8 $WORKING_DIR/alignments/merged/${i}_merged.bam
done
