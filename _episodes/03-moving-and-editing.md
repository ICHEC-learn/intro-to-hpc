---
title: "Moving and editing"
teaching: 10
exercises: 0
questions:
- "How can I edit files on my HPC"
- "How can I change file permissions?"
- "How can I transfer files from a HPC"
objectives:
- "Learn how to navigate around a remote system"
- "Utilise navigational Linux commands"
- "Utilise the `vim` text editor tool"
keypoints:
- "You will have 2 main directories associated with your account. Your `work` directory will have much more space than `home`"
- "Absolute path is the location in a file system relative to the root `/` directory"
- "Relative path is the location in a file system relative to the directory you are currently in"
- "`vim` is one of the most popular and flexible text editors"
---

<p align="center"><img src="../fig/ICHEC_Logo.jpg" width="40%"/></p>


## File permissions

All files have owners. There is yourself, the machine user, a group owner, which is a group on a machine and then
others. 

Once you are on a machine and have multiple people on the same machine, it is important to know that others can access
your files. By default, you, the machine user and write and edit a file, but everyone else will have read-only 
privileges. Let's see what this looks like.

~~~
$ ls - lh hamlet.txt
~~~
{: .language-bash}

~~~
-rw-r--r--  1 user  staff  193K 11 Jan 12:00 hamlet.txt
~~~
{: .output}

The `-h` flag puts our output into human-readable format, so the size of our file is expressed in kilobytes. The main
area of interest for us though is on the left.

The first `-` may sometimes be filled with `d`, standing for directory, however our interest area are the 9 characters
to the right, which is divided into three sections, user, group and other.

The first section above has the three characters `rw-`, which indicates that the user can read and write content to the
file. The permission can be changed so that the file can be executed or run, however we will come to that shortly.

The second section `r--` refers to the group owner, i.e. a group on a machine. Here the `w` has been replaced with a
`-` indicating that the group has read-only permissions. This is a similar case for the third section, also `r--`,
which indicates that others have read-only permissions.

Who cares you may ask. Well, a common occurrence is that people on a project or a course would need to
share and edit files,or need to access materials from a directory outside of their account. As things stand, this is
not possible, but by changing permissions, this is possible.

We can change the permissions of a file using `chmod` along with a variety of flags which can add or take away file
permissions. Let's change the permissions of our `correct.txt`, then use `echo` to write to the file.

~~~
$ chmod u-w correct.txt
$ echo "new line" > correct.txt
~~~
{: .language-bash}

~~~
permission denied: correct.txt
~~~
{: .output}

As you can see, because we have changed permissions, we cannot edit the file anymore.

Let us change the permissions, but add writing permissions to all users (user, group, other)

~~~
$ chmod ugo+w correct.txt
~~~
{: .language-bash}

Now when we check the permissions with `ls -lh` we can see that the permissions have changed to;

~~~
-rw-rw-rw-
~~~
{: .output}

> ## Changing file permissions
>
> You may need to change the permissions of a file so group users can edit, or execute the file.
> 
> Create a new file, `my_script.sh`, which should automatically have the permissions `-rw-r--r--`. Check yourself that
> the file has these permissions, then;
> 1. Add executable permissions for user and group
> 2. Remove reading permissions for other
>
> > ## Solution
> >
> > ~~~
> > $ chmod ug+x my_script.sh
> > $ chmod o-r my_script.sh
> > ~~~
> > {: .language-bash}
> {: .solution}
{: .challenge}

There are also number notations corresponding to `u`, `g` and `o` read, write and executable permissions, as shown in
the table below. 

| Character | Number Notation | Character | Number Notation |
|-----------|-----------------|-----------|-----------------|
|   `---`   |        0        |   `r--`   |        4        |
|   `--x`   |        1        |   `r-x`   |        5        |
|   `-w-`   |        2        |   `rw-`   |        6        |
|   `-wx`   |        3        |   `rwx`   |        7        |

These numbers are read in as a three character long binary number, read from right to left. The below example shows how
the numbers can be summed up, so that;
1. The owner can read, write and execute the file
2. The group can read and execute the file, but not edit it
3. All others cannot read, write or execute it

~~~
OWNER  GROUP  OTHER
r w x  r w x  r w x
1 1 1  1 0 1  0 0 0
  7      5      0
  |______|______|
         |
        750
~~~
{: .output}

If we wanted to change a file's permissions to match the above, we can do so using;

~~~
$ chmod 750 my_script.sh
~~~
{: .language-bash}

> ## Who has what permissions?
> 
> Have a look at the different `rwx` permissions and numerical equivalents, and deduce who has what permissions, or who
> has been granted, or had permissions retracted
>
> 1. `rwxrwxr--`
> 2. `r--r--r--`
> 3. `755`
> 4. `700`
> 5. `rwxrw-r--`
> 6. `chmod u+x file`
> 7. `chmod go-wx file`
>
> > ## Solution
> >
> > 1. **User** and **group** can *read*, *write*, *execute*. **Other** can only *read* the file.
> > 2. **User**, **group** and **other** can only *read* the file
> > 3. **User** can *read*, *write* and *execute* the file. **Group** and **other** can *read* and *write* the file.
> > 4. **User** can *read*, *write* and *execute* the file, **group** and **other** cannot do anything.
> > 5. **User** can *read*, *write* and *execute* the file. **Group** can *read* and write the file. **Other** can read
> >    the file.
> > 6. The **user** has been given permission to *execute* the file.
> > 7. **Group** and **other** has has permissions to *read* and *write* the file retracted.
> {: .solution}
{: .challenge}

## File transfer with `scp`

> ## 
> 
{: .challenge}

> ## Common problems
>
> ### Running the command on remote host
>
> As mentioned
> ### Unable to open two terminal windows e.g cygwin
>
> You will ideally need two terminal windows open to get this working optimally, although it can be done with just one.
>
> For users of Cygwin, using two terminal windows simultaneously can be tricky. We recommend therefore taking a note of
> the directory where your file is stored on the supercomputer before attempting.
> 
> You 
> 
> 
{: .callout}

{% include links.md %}
