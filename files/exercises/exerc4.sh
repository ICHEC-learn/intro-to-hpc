#!/bin/bash

#Slurm flags
#SBATCH --partition=XXXXXXXXXXX
#SBATCH --nodes=1
#SBATCH --time=00:30:00
#SBATCH --job-name=myjob
#SBATCH --account=XXXXXXXXXXX
#SBATCH --output=slurm.log
#SBATCH --mail-user=XXXXXXXXXXXXXXXXXXXXX
#SBATCH --mail-type=BEGIN,END

cd $SLURM_SUBMIT_DIR

#Load compiler’s module

module unload gcc/8.3.1

#compile the program
g++ -o helloworld.o hello_world.cpp


