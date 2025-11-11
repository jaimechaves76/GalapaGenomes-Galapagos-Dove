#!/bin/bash

source_file=$1
output_dir=$2

########## --- Safe mode --- ##########
# -e : exit if any command returns a failed value
# -u : exit on undefined variables instead of using empty strings
# -o : won't silently ignore errors in pipelines
set -euo pipefail

########### --- Logging helper --- ##########
# Creates log directory unless it already exists
mkdir -p "$output_dir/log"
# Sets LOGFILE name based on run time
LOGFILE="$output_dir/log/script_$(date +%Y%m%d_%H%M%S).log"
# When log command is used, timestamps the message to terminal and log file
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" | tee -a "$LOGFILE"
}
# If an error is thrown, print the error message to the log file
trap 'log "ERROR on line $LINENO: $BASH_COMMAND"; exit 1' ERR
# Redirect all stdout and stderr to log, but also show it in the terminal
exec > >(tee -a "$LOGFILE") 2>&1

log "Starting fastqc ..."

# --- Main script ---
# set variables here

nthreads=8

# initialize the conda environment
source "$HOME/miniconda3/etc/profile.d/conda.sh"
set +u # Temporarily disable unset-variable errors, so command can run properly
conda activate fastqc_env
set -u # Reenable unset-variable errors



# Creates data directory unless it already exists
mkdir -p "$output_dir"
# run the fastqc program and output files in data directory
fastqc -t $nthreads --noextract $source_file -o $output_dir

log "fastqc complete"

log "Input directory: ${source_file}"
log "Output directory: ${output_dir}"
