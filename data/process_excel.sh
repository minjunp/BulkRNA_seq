#!/bin/bash

for i in $(seq 7 26)
do
	xlsx2csv Human_Brown_Fat_RNAseq_QC.xlsx | awk NR==$i | cut -f8,16 -d"," | awk 'BEGIN{x=""}{x=x"HA"$1; print x}' | sed 's/,/\t/g'
done
