#!/bin/bash

# input files:
echo "$1: name of first paird-end fastq file"
echo "$2: name of second paired-end fastq file"
echo "$3: name of output bam file"

# -p: specified number of parallel search threads
# -q: Reads (specified with <m1>, <m2>, <s>) are FASTQ files
# --dta: # --downstream-transcriptome-assembly, Report alignments tailored for transcript assemblers including StringTie.
# -x: The basename of the index for the reference genome.
# -1,-2: Comma-separated paired-end files
# -S align.sam \ # File to write SAM alignments to.
# convert to BAM format. -S: efficiently filter BAM file for alignments satisfying various conditions, -f: Specify output format, -l: Set compression level for BAM output
# sort that BAM file. -t: Number of threads to use, -m: Sets an upper bound for used memory, -o: output file name.

hisat2 -p 8 \
       -q \
       --dta \
       -x /project/samee/minjun/RNAseq/code/reference/hg19/genome \
       -1 $1 \
       -2 $2 \
       | sambamba view -S -f bam -l 0 /dev/stdin \
       | sambamba sort -t 8 -m 32G -o /project/samee/minjun/RNAseq/code/alignments/$3 /dev/stdin
