#!/bin/bash

#PBS -l select=1:ncpus=28:mem=6gb
#PBS -l walltime=24:00:00
#PBS -l place=free:shared

source activate virsorter

HOST=`hostname`
LOG="$STDOUT_DIR/${HOST}.log"
ERRORLOG="$STDERR_DIR/${HOST}.log"

if [ ! -f "$LOG" ] ; then
    touch "$LOG"
fi
echo "Started `date`">>"$LOG"
echo "Host `hostname`">>"$LOG"

MYFILE=`head -n +${PBS_ARRAY_INDEX} $FILE_LIST | tail -n 1`
FILENAME="${MYFILE:2}"
FILE="$DIR/$FILENAME"
OUT="$OUT_DIR/${FILENAME%???}"

wrapper_phage_contigs_sorter_iPlant.pl -f $FILE --db 1 --wdir $OUT --ncpu 20 --data-dir $VIR_DATA

echo "Finished `date`">>"$LOG"
