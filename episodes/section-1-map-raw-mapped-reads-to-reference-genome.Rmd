---
title: 'Map raw unmapped reads to reference genome'
teaching: 10
exercises: 2
---

:::::::::::::::::::::::::::::::::::::: questions 

- How do you write a lesson using R Markdown and `{sandpaper}`?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Explain how to use markdown with the new lesson template
- Demonstrate how to include pieces of code, figures, and nested challenge blocks

::::::::::::::::::::::::::::::::::::::::::::::::

## Preparation and data import

Let’s start by setting up the directory structure for this analysis. The `data` directory is where the raw sequencing reads will be. All output files will be directed to the `output` directory. All reference files will be pointed to the `reference` directory. The command-line scripts are stored in simple bash script format in the `scripts` directory. For those interested, equivalent slurm scripts to run on Spartan are available in the `slurm_scripts` directory. Although all tools are installed on the server, we will create a `tools` directory.

Let’s begin by creating a byobu-screen session (see [Summary and Setup](https://kezgitareja.github.io/Variant-calling-using-GATK4/index.html) for more help):

::::::::::::::::::::::::::::::::::::: challenge 

```
cd
byobu-screen -S workshop
```

Create workshop directories:

```
mkdir data
mkdir output
mkdir reference
mkdir reference/hg38
mkdir scripts
mkdir slurm_scripts
mkdir temp
mkdir tools
```

:::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::: callout

#### Note

All analysis is being carried out in the home directory (the directory you log in to).

::::::::::::::::::::::::::::::::::::::::::::::

The data for this tutorial is sourced from the [International Genome Sample Resources](https://www.internationalgenome.org/data-portal/sample/NA12878). Raw sequencing reads from chromosome 20 are used in this tutorial. We have prepared the files which can be copied as follows:

::::::::::::::::::::::::::::::::::::: challenge 

```
cp -p /mnt/shared_data/NA12878.chr20.region_1.fastq.gz data/.
cp -p /mnt/shared_data/NA12878.chr20.region_2.fastq.gz data/.
```

:::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::: callout

#### Note

To perform quality control checks on the raw fastq data, use the tool [FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/). Another useful QC tool output aggregator is the [MultiQC](https://seqera.io/multiqc/) tool. MultiQC aggregates the output from several tools and outputs a single QC report for all samples. We will have a look at some of the QC data later in this section.

::::::::::::::::::::::::::::::::::::::::::::::

Next, we need to prepare the reference data. Luckily, we have downloaded the data and all we need to do is to create a [symbolic link](https://servicenow.iu.edu/kb?id=kb_article_view&sysparm_article=KB0023928) to the data folder as follows:

::::::::::::::::::::::::::::::::::::: challenge 

```
ln -s /mnt/shared_data/* reference/hg38/.
```

:::::::::::::::::::::::::::::::::

There are several files in the reference directory. These included the GATK bundle of reference files downloaded from [here](ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/hg38/). Additional files include in the directory are the BWA index files generated for the reference genome.

## Align genome

Run the command below to map the raw sequencing data to the Homo sapiens (human) genome assembly GRCh38 (hg38). We are using the [BWA-MEM](https://github.com/lh3/bwa) algorithms for mapping DNA sequences against large reference genomes. Note that we have already run the created the BWA index files by running the command `bwa index reference/hg38/Homo_sapiens_assembly38.fasta`.

Run BWA as follows, but first navigate to the scripts folder:

::::::::::::::::::::::::::::::::::::: challenge 

```
bwa mem -M -t 2 \
-R "@RG\tID:SRR622461.7\tSM:NA12878\tLB:ERR194147\tPL:ILLUMINA" \
reference/hg38/Homo_sapiens_assembly38.fasta \
data/NA12878.chr20.region_1.fastq.gz \
data/NA12878.chr20.region_2.fastq.gz | \
samtools view -b -h -o output/NA12878.bam -
```

:::::::::::::::::::::::::::::::::

There are two parts to the command here. The first part uses BWA to perform the alignment and the second part takes the output from BWA and uses Samtools to convert the output to the BAM format.

At the end of this step you should have a file called `NA12878.bam` in the `output` directory.

::::::::::::::::::::::::::::::::::::: keypoints 

- Use `.md` files for episodes when you want static content
- Use `.Rmd` files for episodes when you need to generate output
- Run `sandpaper::check_lesson()` to identify any issues with your lesson
- Run `sandpaper::build_lesson()` to preview your lesson locally

::::::::::::::::::::::::::::::::::::::::::::::::

