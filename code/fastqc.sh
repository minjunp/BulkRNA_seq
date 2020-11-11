#!/bin/bash

module load fastqc/0.11.2
cd /project/samee/minjun/RNAseq/data
# loop over all names
for i in $(ls | grep "HA" | cut -f1 -d"_")
do
        folder_name=$i*
        cd $folder_name
        fastq_start=$(ls | head -1)
        fastq_end=$(ls | tail -1)

        fastqc -o /project/samee/minjun/RNAseq/code/qc_outs $fastq_start $fastq_end
	cd /project/samee/minjun/RNAseq/data
done

