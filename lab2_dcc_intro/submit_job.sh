#!/bin/bash
#SBATCH --account=sta440-f20
#SBATCH -p common
#SBATCH -N1
#SBATCH -c1
#SBATCH --mem=1G

module load R/4.0.0
Rscript merge_files.R
