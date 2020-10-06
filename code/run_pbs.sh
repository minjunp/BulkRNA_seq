#!/bin/bash

############################# BEGIN PBS DIRECTIVES #############################

### mail on job exit
#PBS -m e

### email address to send job updates
#PBS -M minjunp@bcm.edu

### keep job output and error files in your home directory
### this overrides -e and -o options to specify error/output file locations
#PBS -k oe

### request 8 CPUs on 1 node
#PBS -l nodes=4:ppn=16

### reques virtual memory TOTAL
#PBS -l vmem=64GB

### request 14 days walltime
#PBS -l walltime=24:00:00

############################## END PBS DIRECTIVES ##############################


### enable 'module' commands
source /etc/profile.d/modules.sh
#module load anaconda3/5.0.1
source activate
export PATH=/home/minjunp/anaconda3/bin:$PATH
export PATH=/home/minjunp/anaconda3:$PATH
conda env list
conda activate RNAseq

### JOB PREP ###

### check $HOSTNAME of host running job
echo "hostname:  $HOSTNAME"

### check $HOME of user submitting job
echo "pbs_o_home:  $PBS_O_HOME"

### check $CWD at job submission
echo "pbs_o_workdir:  $PBS_O_WORKDIR"

### check local scratch on compute node running job
echo "tmpdir:  $TMPDIR"

### JOB EXECUTION ###

### stage data to local scratch
#cp sourcefile $TMPDIR/

### write data to local scratch
#myprogram sourcefile >> $TMPDIR/sourcefile.out

#$PBS_O_WORKDIR/assemble_transcripts.sh
$PBS_O_WORKDIR/estimate_abundance.sh
#$PBS_O_WORKDIR/hisat2.sh $PBS_O_WORKDIR/HA21225_S25_L003_R1_001.fastq.gz $PBS_O_WORKDIR/HA21225_S25_L003_R2_001.fastq.gz HA21225.bam

### JOB TERMINATION ###

### copy output to pillar
#cp $TMPDIR/sourcefile.out /home/user/sourcefile.out

### clean up local scratch
#rm -f $TMPDIR/sourcefile
