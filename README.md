# RNAseq

## hisat2.sh
Alignment: Use the aligner HISAT2 to performspliced alignments to reference genome.
a) output .sam from HISAT
b) covert to .bam files 
c) sort .bam files

## merge_bam.sh
Merging bam files

[optional] Indexing bam files: To view bam files in IGV, we need to index them

## stringtie.sh
Assembling transcripts from merged bams: use stringtie to perform a reference guided transcriptome assembly and then determine transcript abundance estimates for those transcript. The so called “reference guided” mode is specified with -G ref_transcriptome.gtf. 

[optional] Merging Transcripts from merged bams: If transcript discovery is performed on tumor/normal sample independently, we need to create a unified version of the transcriptome. Use The StringTie --merge option. 
This can be used to compare transcripts using gffcompare tool (transcripts assembled by StringTie vs reference transcriptome).
