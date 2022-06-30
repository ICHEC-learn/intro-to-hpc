#!/bin/bash

#Slurm flags
#SBATCH --partition=CourseDevQ
#SBATCH --reservation=ENTER_RESERVATION
#SBATCH --nodes=1
#SBATCH --time=00:30:00
#SBATCH --job-name=myjob
#SBATCH --account=course
#SBATCH --output=slurm.log
#SBATCH --mail-user=USERNAME@EXAMPLE.COM
#SBATCH --mail-type=BEGIN,END

cd $SLURM_SUBMIT_DIR

#Load compiler’s module

module load gcc/8.3.1

#compile the program
g++ -o helloworld.o hello_world.cpp

