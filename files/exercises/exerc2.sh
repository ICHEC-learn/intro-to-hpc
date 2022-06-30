#!/bin/bash

#Slurm flags
#SBATCH --partition=CourseDevQ
#SBATCH --nodes=1
#SBATCH --time=XXXXXXXXX
#SBATCH --job-name=XXXXXXXXX
#SBATCH --account=XXXXXXXXX
#SBATCH --output=slurm.log
#SBATCH --mail-user=xxxxxxxxxxxxxxxxxxxxxx
#SBATCH --mail-type=BEGIN,END

cd $XXXXXXXXXXXXXXXXx

#Load module 

module load gcc/8.3.1      

#execute command 

g++ -o helloworld.o hello_world.cpp

