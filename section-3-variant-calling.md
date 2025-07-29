---
title: 'Variant calling'
teaching: 10
exercises: 2
---

:::::::::::::::::::::::::::::::::::::: questions 

- How 

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Explain 

::::::::::::::::::::::::::::::::::::::::::::::::

The next step in the GATK best practices workflow is to proceed with the variant calling.

There are a couple of workflows to call variants using GATK4. Here we will follow the Genomic Variant Call Format (GVCF) workflow which is more suited for scalable variant calling i.e. allows incremental addition of samples for joint genotyping.

## Apply HaplotypeCaller

HaplotypeCaller is the focal tool within GATK4 to simultaneously call germline SNVs and small Indels using local de novo assembly of haplotype regions.

Briefly, the HaplotypeCaller works by: 1. Identify active regions or regions with evidence of variations. 2. Re-asssemble the active regions. 3. Re-align active region reads to the assembled regions to identify allele. More details about the HaplotypeCaller can be found [here](https://gatk.broadinstitute.org/hc/en-us/articles/360037225632-HaplotypeCaller).

::::::::::::::::::::::::::::::::::::: challenge 

#### Challenge 3.1

```bash
gatk --java-options "-Xmx7g" HaplotypeCaller \
    -I output/NA12878.sort.dup.bqsr.bam \
    -R reference/hg38/Homo_sapiens_assembly38.fasta \
    -ERC GVCF \
    -L chr20 \
    -O output/NA12878.g.vcf.gz
```
:::::::::::::::::::::::::::::::::

The output of this step is a GVCF file. The format for the GVCF file is similar to a VCF file. The key difference is that the GVCF file contains records for each sequenced genomic coordinate. The `--emit-ref-confidence` or `-ERC` parameter lets you select a method to summarise confidence in the genomic site being homozygous-reference. The option `-ERC GVCF` is more efficient and recommended for large samples and therefore more scalable.

## Apply CombineGVCFs

The CombineGVCFs tool is applied to combine multiple single sample GVCF files, merging them into a single multi-sample GVCF file.

We have pre-processed two additional samples (NA12891 and NA12892) up to the HaplotypeCaller step (above). Let’s first copy the GVCF files to the output directory.

::::::::::::::::::::::::::::::::::::: challenge 

#### Challenge 3.2

Let's make sure that we are in the appropriate directory:

```bash
cd
cp /mnt/shared_data/NA12891.g.vcf.gz* output/.
cp /mnt/shared_data/NA12892.g.vcf.gz* output/.
```

Then, merge GVCF files into a single multi-sample GVCF file:

```bash
gatk --java-options "-Xmx7g" CombineGVCFs \
    -R reference/hg38/Homo_sapiens_assembly38.fasta \
    -V output/NA12878.g.vcf.gz \
    -V output/NA12891.g.vcf.gz \
    -V output/NA12892.g.vcf.gz \
    -L chr20 \
    -O output/cohort.g.vcf.gz
```
:::::::::::::::::::::::::::::::::

Now, let’s take a look at the combined GVCF file:

::::::::::::::::::::::::::::::::::::: challenge 

#### Challenge 3.3

```bash
less output/cohort.g.vcf.gz
```

Work your way down to the variant records. How many samples do you see in the VCF file? Hint: Look at the header row.

:::::::::::::::::::::::::::::::::

Now that we have a merged GVCF file, we are ready to perform genotyping.

## Apply GenotypeGVCFs

GATK uses a modified version (to include multi-allelic variants) to calculate the posterior probability of a non-reference allele. More details [here](https://gatk.broadinstitute.org/hc/en-us/articles/360035890511-Assigning-per-sample-genotypes-HaplotypeCaller).

::::::::::::::::::::::::::::::::::::: challenge 

#### Challenge 3.4

```bash
gatk --java-options "-Xmx7g" GenotypeGVCFs \
    -R reference/hg38/Homo_sapiens_assembly38.fasta \
    -V output/cohort.g.vcf.gz \
    -L chr20 \
    -O output/output.vcf.gz
```
:::::::::::::::::::::::::::::::::

Let's take a look at the output:

::::::::::::::::::::::::::::::::::::: challenge 

#### Challenge 3.5

```bash
less output/output.vcf.gz
```
:::::::::::::::::::::::: solution 

## Visualisation of VCF file

Screenshot.

:::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::

An alternative to CombineGVCFs is [GenomicsDBImport](https://gatk.broadinstitute.org/hc/en-us/articles/360057439331-GenomicsDBImport), which is more efficient for large sample numbers and stores the content in a GenomicsDB data store. Therefore, CombineGVCFs could be slow and inefficient for more than a few samples. A possible work around is to split up the tasks into per interval regions such as chromosomes.

::::::::::::::::::::::::::::::::::::: keypoints 

- Use

::::::::::::::::::::::::::::::::::::::::::::::::

