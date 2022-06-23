---
title: "Understanding Modules and Environments"
teaching: 10
exercises: 0
questions:
- "What are modules?"
- "How can I see what modules are available?"
- "How can I load/unload modules on an HPC system?"
- "What is an environment"
- "How can I set up an environment" 
objectives:
- "Use modules to use specific compilers and libraries"
- "Set up a conda environment"
keypoints:
- "Modules are the way to make software, compilers and libraries available within the login session"
- "To load a module, use `module load my_module`"
- "An environment typically refers to a directory that contains a specific collection of installed packages"
- "The `base` conda environment will have a selection of python packages"
---

<p align="center"><img src="../fig/ICHEC_Logo.jpg" width="40%"/></p>

## Modules

Modules are more of a concept, and a way of implementing and loading software packages on an HPC system. On your local
machine, let's take Anaconda as an example, you install it and it is there ready for you to use.

On an HPC, for the login nodes, for commonly used software packages, this is also true. But for the compute nodes, we 
need to load the software packages so we can use them. You may be asking though, why do we even need to load them? This
is because supercomputers will have hundreds of different software packages, much more than any individual will ever
use. Each of these software packages need different settings in terms of paths and other environment variables, which
can inadvertently affect each other or even be mutually exclusive. Users may also want different versions of the same 
software, which in general cannot be intstalled or used in parallel on the same system.

Therefore the settings for all these software packages and their supported versions are encapsulated in environment
modules maintained by the module system. Thus, there is a command for accessing the module system, `module`. This
command on its own displays a manual of the different options available for the command.

It is through the loading of these modules that we can have access to software packages when running jobs on the
compute nodes and doing quick tests on login nodes. 

If we type the following;

~~~
$ module list
~~~
{: .language-bash}

We get the following output;

~~~
No Modulefiles Currently Loaded.
~~~
{: .output}

So from here, we can load some software packages. We will refer to them as modules from now on. From here, we need to 
figure out the software packages that we will need. We can easily do this by typing;

~~~
$ module avail
~~~
{: .language-bash}

~~~
--------------------------------------- /ichec/modules ----------------------------------------
abaqus/2017                     hdf5/intel_mpi/1.12.0
abaqus/2018(default)            intel/2017u8
...                             ...
~~~
{: .output}

This shows all the available modules that are currently installed on ICHEC systems, and as you can see, it is a fairly
extensive list. You may find however that not all modules are available that you may wish to use in your workflow. This
is when you can install a package yourself, however doing so will require you to use the login nodes and when coming to
use this package, you will need to reference the directory in which the package is installed. This however is beyond
the scope of this lesson, and you are free to explore this in your own time.

We can use the `load` command to load a module. Let's keep things simple and load the `conda/2` module, and then display
the modules that we have loaded.

~~~
$ module load conda/2
$ module list
~~~
{: .language-bash}

~~~
Currently Loaded Modulefiles:
  1) conda/2
~~~
{: .output}

To unload a module or a number of modules, we can do two things. First is to use `module unload conda/2`, but we may
want to make sure all modules are unloaded and this can be done using `purge`.

~~~
$ module purge
~~~
{: .language-bash}

> ## Loading and unloading modules
>
> 1. Try and load an `intel` module, of which there are plenty to choose from.
> 2. Load another `intel` module. What happens?
> 3. Load a few more modules of your choosing and list them out
> 4. Use a combination of `unload` and `purge` to remove the currently loaded modules
>
{: .challenge}

{% include links.md %}
