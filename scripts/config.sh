export CWD=$PWD
# where programs are
export BIN_DIR="/rsgrps/bhurwitz/hurwitzlab/bin"
export VIR_DATA="/rsgrps/bhurwitz/alise/tools/virsorter-data"
# where the dataset to prepare is
export DIR="/rsgrps/bhurwitz/alise/my_data/Nostoc_project/Lichen_metagenomes/experiments/3-mock_community/mock1/mock1_5000pb_10kcontigs" # Directory where the data is stored
export OUT_DIR="/rsgrps/bhurwitz/alise/my_data/Nostoc_project/Lichen_metagenomes/experiments/3-mock_community/mock1/VirSorter/mock1_5000pb_10kcontigs"
#place to store the scripts
export SCRIPT_DIR="$PWD/scripts"
# User informations
export QUEUE="standard"
export GROUP="bhurwitz"
export MAIL_USER="aponsero@email.arizona.edu"
export MAIL_TYPE="bea"

#
# --------------------------------------------------
function init_dir {
    for dir in $*; do
        if [ -d "$dir" ]; then
            rm -rf $dir/*
        else
            mkdir -p "$dir"
        fi
    done
}

# --------------------------------------------------
function lc() {
    wc -l $1 | cut -d ' ' -f 1
}
