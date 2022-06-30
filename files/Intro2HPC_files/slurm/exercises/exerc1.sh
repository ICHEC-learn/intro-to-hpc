#!/bin/bash

#Slurm flags
#SBATCH --partition=XXXXX
#SBATCH --nodes=1
#SBATCH --time=01:00:00
#SBATCH --job-name=XXXXX
#SBATCH --account=course    
#SBATCH --output=slurm.log
#SBATCH --mail-user=xxxxxxxxxxxxxxxxxxxxxx
#SBATCH --mail-type=BEGIN,END

cd $SLURM_SUBMIT_DIR

#Load module 

module load gcc/8.3.1      

#execute command 

g++ -o XXXXXXXXXXX hello_world.cpp

