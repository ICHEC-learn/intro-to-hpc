---
title: "Submitting Jobs"
teaching: 10
exercises: 0
questions:
- "What is the difference between a login node and a compute node?"
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

{% include links.md %}
