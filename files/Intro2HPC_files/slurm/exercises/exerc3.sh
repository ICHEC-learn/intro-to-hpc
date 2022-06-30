#!/bin/bash

#Slurm flags
#SBATCH --partition=CourseDevQ
#SBATCH --nodes=1
#SBATCH --time=00:30:00
#SBATCH --job-name=XXXXXX
#SBATCH --account=course
#SBATCH --output=slurm.log
#SBATCH --mail-user=XXXXXXXXXXXXXXXXXXXXXX
#SBATCH --mail-type=BEGIN,END

cd $SLURM_SUBMIT_DIR

#Load compiler’s module

module load XXXXXXXXXX

#compile the program
g++ -o helloworld.o hello_world.cpp

