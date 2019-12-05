# VirSorter_parrallel_eval
Pipeline for parrallel VirSorter on HPC (PBS scheduler)

## Requirements

### VirSorter
VirFinder is a tool available at https://github.com/simroux/VirSorter

## Quick start

### Edit scripts/config.sh file
please modify the following attributes:

  - VIR_DATA path to VirSorter data folder
  - DIR: path to directory where the data is stored
  - OUT_DIR: path to ouput directory
  
  - MAIL_USER : indicate here your arizona.edu email
  - GROUP : indicate here your group affiliation

You can also modify

  - BIN = change for your own bin directory.
  - MAIL_TYPE = change the mail type option. By default set to "bea".
  - QUEUE = change the submission queue. By default set to "standard".
  
  ### Run pipeline
  
  Run 
  ```bash
  ./run.sh
  ```
  This command will place one job in queue.
  
