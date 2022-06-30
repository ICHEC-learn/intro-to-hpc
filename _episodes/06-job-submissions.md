---
title: "Submitting Jobs"
teaching: 10
exercises: 0
questions:
- "What is the Slurm Workload Manager?"
- "How do I submit a simple job on a HPC?"
- "How can I submit a job with loaded modules"
objectives:
- "Write a submission script and submit it to a queue."
keypoints:
- "The scheduler handles how compute resources are shared between users"
- "A job is a shell script with specific instructions for the scheduler"
- "Ideally, every shell script should be run through an interpreter"
- "You should allocate more resources than you need, otherwise your job will be 'killed'"
---

<p align="center"><img src="../fig/ICHEC_Logo.jpg" width="40%"/></p>

## Job scripts

Job scripts are a form of bash script, but one which is managed with the Slurm Workload Manager, known as Slurm for
short. It is a free and open source job scheduler for Linux and UNIX-like kernels and is used by many of the world's
largest supercomputers and clusters.

Why is it needed you may ask? Think of it like a waiter at a restaurant, dealing with different clients, each coming in
and sending different orders to the kitchen. They are there to ensure that the kitchen doesn't get overrun with orders 
and so they can effectively plan a service. In the same way that you may have 100 customers and only 5 chefs and 10
stoves, there will likely not be enough compute resources to get your job submitted effectively.

When you create a job script
and submit it to a queue to run, a number of things happen.

1. The user submits the job to Slurm win a job file, which can be a `.sh`, `.job` extension
2. Slurm sends the job to the software to execute
3. The software does the job over an "X" period of time.
4. Slurm sends information back to the user in therms of slurm output (`slurm.log`) and software output (`output.log`).

A typical job script looks something like the code block below, which has been simplified to show the slurm notation.

~~~
#!/bin/bash

#Slurm flags
#SBATCH --account=course 
#SBATCH --nodes=1
#SBATCH --time=00:30:00
#SBATCH --job-name=test
#SBATCH --output=slurm.log

# Change into a directory where you want the job to run

cd $SLURM_SUBMIT_DIR

"""
Load modules, do some work
"""
~~~
{: .language-bash}

Notice that each of the slurm commands is denoted with the comment `#SBATCH`

The absolute essentials for a job submission file are;

1. Time
2. Account
3. Job Name
4. Nodes

The partition can usually be handled by slurm and the job can be sorted into a specific queue. However for a course
like this, we can assign the partition to `CourseDevQ`. You will only have access to this queue if you are logged in
with a `courseXX` account. You can also have reservations, which as the name suggests reserves a few compute nodes
for a group of users with the reservation keywords. The reservation can be thought of as the chef's table, a priority.

~~~
#SBATCH --partition=CourseDevQ 
#SBATCH --reservation=CourseReservation 
~~~
{: .language-bash}

You can also add in options such as `mail-user` from which you can add your email address, and `mail-type`, which will
send an email to the specified email address if you want to receive information on when your job starts and finishes.
These are handy tools but not often used.

~~~
#SBATCH --mail-user=myemailaddress@universityname.ie
#SBATCH --mail-type=BEGIN,END
~~~
{: .language-bash}

## Slurm commands

Its all well and good creating a job script, but we need to submit it to the queue. Luckily, slurm has a series of 
commands which can be used to submit, monitor and cancel a job. 

Upon submitting a job script, you will be presented with a job-id, which you can then use to check the status and/or
cancel the job.

|      Command      |          Description           |
|-------------------|--------------------------------|
|      `sinfo`      |         Queue Status           |
| `sbatch myjob.sh` |          Submit Job            |
| `squeue -u $USER` |        Check Job Status        |
|  `scancel 123456` |          Cancel Job            |
|    `mybalance`    | Check Project Account Balanace |

> ## Submitting a job
>
> ~~~
> #!/bin/bash
> 
> """
> ADD IN SLURM COMMANDS 
> """
>
> # Move into submit directory
>
> cd $SLURM_SUBMIT_DIR
>
> module load gcc/8.2.0
>
> # Compile the program
> ~~~
> {: .language-bash}
>
> Modify the file `myjob.sh` above and add in the appropriate SLURM commands 
>
> You can use a python file, or write your own C or C++ file. A standard C++ "Hello World" file has been created for
> you, which can be found [here](../files/hello_world.cpp)
>
> As an optional slurm flag, you can add in the `--mail-user` and `--mail-type` commands to get an email when the job
> finishes.
>
> Once the job is complete, have a look at the slurm output file, `slurm.log`. Is the output what you expected?
>
> > ## Solution
> > 
> > ~~~
> > #!/bin/bash
> >
> > #SBATCH --partition=CourseDevQ 
> > #SBATCH --reservation=CourseRESERVATION
> > #SBATCH --nodes=1
> > #SBATCH --time=00:05:00
> > #SBATCH --job-name=myjob
> > #SBATCH --account=course
> > #SBATCH --output=slurm.log
> > 
> > # Optional
> > #SBATCH --mail-user=username@example.com
> > #SBATCH --mail-type=BEGIN,END
> > 
> > # Move into submit directory
> > 
> > cd $SLURM_SUBMIT_DIR
> > 
> > module load gcc/8.2.0
> > 
> > # Compile the program
> > g++ -o helloworld.o hello_world.cpp
> >
> > ~~~
> > {: .language-bash}
> {: .solution}
{: .challenge}

> ## More practice with job submissions
>
> Head into the [`files/exercises`](../files/exercises/) directory in the cloned repository, you will find a series of 
> slurm scripts for you to edit and submit, again with the simple C++ file `hello_world.cpp`.
> 
> Each slurm script has an aspect that needs changing, so edit the slurm scripts accordingly.
> 
{: .challenge}


{% include links.md %}
