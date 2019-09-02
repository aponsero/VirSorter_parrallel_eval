#!/bin/sh
set -u
#
# Checking args
#

source scripts/config.sh

if [[ ! -d "$DIR" ]]; then
    echo "$DIR directory does not exist. Please provide a directory containing evaluation set files to process. Job terminated."
    exit 1
fi

if [[ -f "$DIR/virSorter_list.txt" ]]; then
    rm "$DIR/virSorter_list.txt"
fi

export FILE_LIST="$DIR/virSorter_list.txt"
cd $DIR
find . -type f -name "*.fasta">> $FILE_LIST
find . -type f -name "*.fa">> $FILE_LIST
export NUM_FILES=$(wc -l < "$FILE_LIST")

if [[ $NUM_FILES -eq 0 ]]; then
  echo "No models found in $DIR, please correct config file. Job terminated."
  exit 1
fi

if [[ ! -d "$OUT_DIR" ]]; then
    echo "$OUT_DIR does not exist. Directory created for pipeline output."
    mkdir -p "$OUT_DIR"
fi

#
# Job submission
#

PREV_JOB_ID=""
ARGS="-q $QUEUE -W group_list=$GROUP -M $MAIL_USER -m $MAIL_TYPE"

#
## 01-run evals
#

PROG="01-run-evaluation"
export STDERR_DIR="$SCRIPT_DIR/err/$PROG"
export STDOUT_DIR="$SCRIPT_DIR/out/$PROG"
init_dir "$STDERR_DIR" "$STDOUT_DIR"


echo "launching $SCRIPT_DIR/run_analysis.sh "

JOB_ID=`qsub $ARGS -v FILE_LIST,DIR,OUT_DIR,STDERR_DIR,STDOUT_DIR,VIR_DATA -N run_virSorter_evaluation -e "$STDERR_DIR" -o "$STDOUT_DIR" -J 1-$NUM_FILES $SCRIPT_DIR/run_analysis.sh`

if [ "${JOB_ID}x" != "x" ]; then
      echo Job: \"$JOB_ID\"
      PREV_JOB_ID=$JOB_ID 
else
      echo Problem submitting job. Job terminated
fi
echo "job successfully submited"



           











