---
title: "Introduction"
teaching: 240
exercises: 2
---

:::::::::::::::::::::::::::::::::::::: questions 

- How 

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Take raw DNA sequencing reads and perform variant calling to produce a variant list using GATK4.
- Perform basic exploration of variants.

::::::::::::::::::::::::::::::::::::::::::::::::

Anticipated workshop duration when delivered to a group of participants is 4 hours. 

For queries relating to this workshop, contact Melbourne Bioinformatics (bioinformatics-training@unimelb.edu.au).

## Author Information
Khalid Mahmood
Melbourne Bioinformatics, University of Melbourne
Developed: July 2021
Reviewed: August 2024

## Overview

This workshop is designed for participants with some command-line knowledge. You will need to be able to `ssh` into a remote machine, navigate the directory structure and `scp` files from a remote computer to your local computer.

## Description 

This tutorial runs through the GATK4 best practices workflow for variant calling. The workflow starts with pairs of sequencing reads and performs a series of steps to determine a set of genetic variants.

Data: Illumina HiSeq paired-end (2×100 bp) reads in FASTQ format.
Tools: GATK4, Picard, Bcftools and jigv
Reference data: GATK4 hg38 reference bundle and hg38 refGene annotation (hg38.refGene.gtf.gz)

Slides and workshop instructions
Click [here](https://www.melbournebioinformatics.org.au/tutorials/tutorials/variant_calling_gatk1/files/VariantCallingUsingGATK4.pdf) for the slides.
Click [here](https://www.melbournebioinformatics.org.au/tutorials/tutorials/variant_calling_gatk1/files/variant_calling_gatk1.pdf) for a printer friendly PDF version of this workshop.


::::::::::::::::::::::::::::::::::::: keypoints 

- Use `.md` files for episodes when you want static content
- Use `.Rmd` files for episodes when you need to generate output
- Run `sandpaper::check_lesson()` to identify any issues with your lesson
- Run `sandpaper::build_lesson()` to preview your lesson locally

::::::::::::::::::::::::::::::::::::::::::::::::

[r-markdown]: https://rmarkdown.rstudio.com/
