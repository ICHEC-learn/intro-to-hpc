---
title: "Connecting to a remote system"
teaching: 10
exercises: 10
questions:
  - "What is an SSH key, and how do I set it up?"
  - "How can I connect to a remote cluster?"
objectives:
  - "Set up an SSH key pair"
  - "Connect to a remote HPC system"
keypoints:
  - "SSH keys are used to establish secure shell connections to remote computers. Most HPCs worldwide require them to gain access."
  - "To log into a HPC, use `ssh YourUsername@remote.computer.address`"
---

<p align="center"><img src="../fig/ICHEC_Logo.jpg" width="40%"/></p>
## Setting up a key pair
When you set up an SSH key, you generate a "key-pair", a public and private key.

See here for a recap

https://www.ichec.ie/academic/national-hpc/documentation/tutorials/setting-ssh-keys

> ## `.challenge`
>
> Login to your course account on Kay. You will have been given a courseXX and a password.
> {: .challenge}

> ## `.solution`
>
> {: .solution}
> `.language-bash`: Bash shell commands:

```
ssh courseXX@kay.ichec.ie -i ~/.ssh/id_ed25519
```

{: .language-bash}

`.language-html`: HTML source:

{% include links.md %}
