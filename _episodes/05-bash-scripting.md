---
title: "Bash Scripting"
teaching: 10
exercises: 0
questions:
- "What is a scripting language"
objectives:
- "Write a script"
- "Write simple loop and conditional statements"
- "Understand how to use variables in a bash script"
keypoints:
- "A shell script is a list of bash commands in a `.sh` text file"
- "Bash scripting is an essential element in HPC"
---

<p align="center"><img src="../fig/ICHEC_Logo.jpg" width="40%"/></p>

## What is bash scripting?

If you have taken our [intro-to-linux](https://ichec-learn.github.io/intro-to-linux/) course, you should already be
familiar with the concept of bash scripting. If so then you can skip to the [next episode](06-job-submissions.md).

Bash scripting is by far the most important concept in HPC computing, without it, you cannot submit submission scripts
to the login nodes to run. We will look over some concepts and key skills associated with a simple bash script before
we move onto actual job submissions in the next episode.

## Text editors

There are plenty of text editors in bash scripting, but we will only focus on two here, `nano` and `vim`. Both have
their advantages and disadvantages.

Text editors work like commands, in the format `editor_name file_to_edit`, and opens up a window in which you can edit
the file. 

If the file that you are editing does not exist, then it creates one for you.

### `nano`

Nano is considered a very good option for beginners as it is simple to work with, and can help you edit anything, 
however if you wish to get things done quicker and have access to more features and shortcuts, then switch to `vim`.

### `vim`

Vim or **V**i **IM**proved is a highly flexible text editor designed for use on the command line and as its own GUI,
but is often the go-to and must know tool for anyone wishing to work on a UNIX system, mainly because all the tools for
editing text are there for you to use.

It can be tricky for beginners to get used to the different modes and shortcuts, but once gotten used to, it can save a
lot of time and effort.

> ## Getting used to text editors
>
> Using either `vim` or `nano`, get used to working with some of the commands to write text, open, close and save the
> files. 
>
> If you are using `vim` we recommend using this time to look at `vimtutor`. Type into your terminal
>
> ~~~
> vimtutor
> ~~~
> {: .language-bash}
>
> And you will get a window with an interactive tutorial with clear and instructive commands.
>
> ~~~
> ===============================================================================
> =    W e l c o m e   t o   t h e   V I M   T u t o r    -    Version 1.7      =
> ===============================================================================
> 
>      Vim is a very powerful editor that has many commands, too many to
>      explain in a tutor such as this.  This tutor is designed to describe
>      enough of the commands that you will be able to easily use Vim as
>      an all-purpose editor.
>     
>      ...       ...       ...       ...       ...       ...       ...       ...
>
>                         Lesson 1.1:  MOVING THE CURSOR
>
>
>   ** To move the cursor, press the h,j,k,l keys as indicated. **
>             ^
>             k              Hint:  The h key is at the left and moves left.
>       < h       l >               The l key is at the right and moves right.
>             j                     The j key looks like a down arrow.
>             v
>  1. Move the cursor around the screen until you are comfortable.
>
>      ...       ...       ...       ...       ...       ...       ...       ...
>
> ~~~
> {: .output}
{: .challenge}

## Creating a bash script

Now that you have gotten used to a text editor, we can start doing some bash scripting. These scripts typically have
the extension `.sh`.

A very simple bash script is shown below. Recreate the text below in a file called `script.sh`

~~~
#!/bin/bash

# Comments are denoted with a hashtag, and will not be shown in the output

echo "Hello from bash"
~~~
{: .language-bash}

We can run this file in the terminal in two ways.
1. Using the `bash` command;

~~~
$ bash script.sh
~~~
{: .language-bash}

2. Changing permissions with `chmod`, and being able to run the file as a command 

~~~
$ chmod u+x script.sh
$ ./script.sh
~~~
{: .language-bash}

Doing it this way can mean that depending on your shell, the file name may change to green. A green file usually is an
indication that the file is executable and can be run.

Once the script file has been run, whatever you type is the same as typing in a terminal, but allows you to save
complex sequences of commands.

We can extend this to work on files as well, which we are covering in the exercise below

> ## Running a coded file 
>
> In your chosen language, create a file `.c`, `.cpp`, `.py` that prints a simple message or does some arithmetic.
> You will need either anaconda or a suitable compiler to get this working.
> 
> Run the file as normal in a terminal (NB: For C, C++ remember to run the output file rather than the `.c`, `.cpp`
> file)
>
> > ## Solution
> >
> > Here is a solution for Python 3. This file prints out a string and utilises the `math` library
> > 
> > `hello.py`
> > ~~~
> > import math 
> >
> > print("Hello")
> > 
> > print(f'The value of pi is approximately {math.pi:.3f}.')
> > ~~~
> > {: .language-python}
> >
> > ~~~
> > $ python3 hello.py
> > ~~~
> > {: .language-bash}
> >
> > ~~~
> > Hello
> > The value of pi is approximately 3.142.
> > ~~~
> > {: .output}
> >
> > `script.sh`
> > ~~~
> > #!/bin/bash
> > 
> > echo "Running python3 file"
> >
> > # Running python file
> > python3 hello.py
> > 
> > echo "Run successful"
> > ~~~
> > {: .language-bash}
> >
> > ~~~
> > Running python3 file\n
> > Hello
> > The value of pi is approximately 3.142.
> > Run successful
> > ~~~
> > {: .language-bash}
> > 
> {: .solution}
{: .challenge}

{% include links.md %}
