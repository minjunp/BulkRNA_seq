#!/bin/bash

# -e: Limits the processing of read alignments to only estimate and output the assembled transcripts matching the reference transcripts given with the -G option (requires -G, recommended for -B/-b). With this option, read bundles with no reference transcripts will be entirely skipped, which may provide a considerable speed boost when the given set of reference transcripts is limited to a set of target genes, for example.
# -B: This switch enables the output of Ballgown input table files (*.ctab) containing coverage data for the reference transcripts given with the -G option.
# -G <ref_ann.gff>: Use the reference annotation file (in GTF or GFF3 format) to guide the assembly process.
# -A <gene_abund.tab>: Gene abundances will be reported (tab delimited format) in the output file with the given name.
# -o <out_gtf>: output file name of the merged transcripts GTF  
for i in Vehicle Lactate ARC Lactate_ARC
do
stringtie -p 8 -e -G /project/samee/minjun/RNAseq/code/reference/transcriptome/Homo_sapiens.GRCh38.101.gtf -o /project/samee/minjun/RNAseq/code/ballgown/${i}.gtf -A /project/samee/minjun/RNAseq/code/ballgown/${i}_abundances.tsv /project/samee/minjun/RNAseq/code/alignments/merged/${i}_merged.bam
done
