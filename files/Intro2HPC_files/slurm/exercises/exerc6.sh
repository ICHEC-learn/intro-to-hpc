#!/bin/bash

#Slurm flags
#SBATCH --partition=CourseDevQ
#SBATCH --nodes=XXXX
#SBATCH --time=00:30:00
#SBATCH --job-name=myjob
#SBATCH --account=course
#SBATCH --output=slurm.log
#SBATCH --mail-type=BEGIN,END

cd $SLURM_SUBMIT_DIR

#Load compiler’s module

load gcc/8.3.1

#compile the program
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


