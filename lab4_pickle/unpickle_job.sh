#!/bin/bash
#SBATCH --account=sta440-f20
#SBATCH -p common
#SBATCH -o info_unpickling.txt

module load Python/2.7.11
python unpickle_wesad.py
module load R
Rscript summarize_wesad.R
