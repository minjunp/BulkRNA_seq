# RNAseq

1. Alignment: Use the aligner HISAT2 to performspliced alignments to reference genome.
a) output .sam from HISAT
b) covert to .bam files 
c) sort .bam files

2. Merging bam files

3. Indexing bam files: To view bam files in IGV, we need to index them

4. Assembling transcripts from merged bams: use stringtie to perform a reference guided transcriptome assembly and then determine transcript abundance estimates for those transcript. The so called “reference guided” mode is specified with -G ref_transcriptome.gtf. 

5. Merging Transcripts from merged bams: If transcript discovery is performed on tumor/normal sample independently, we need to create a unified version of the transcriptome. Use The StringTie --merge option.
