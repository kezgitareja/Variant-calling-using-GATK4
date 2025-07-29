---
title: 'Exporting variant data and visualisation'
teaching: 10
exercises: 2
---

:::::::::::::::::::::::::::::::::::::: questions 

- How 

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Explain 

::::::::::::::::::::::::::::::::::::::::::::::::

VCF files, although in tabular format, are not user friendly. We will go through a couple of ways to share share and visualise variant data. This is important for downstream analysis as well as sharing data. First, we will convert the VCF file in to a TSV file (ready for Excel for example) in a manner where we extract data fields of interest.

## VariantsToTable

This GATK4 tool extracts fields of interest from each record in a VCF file. [VariantsToTable](https://gatk.broadinstitute.org/hc/en-us/articles/360056968292-VariantsToTable) can extract field from both the INFO and FORMAT columns in the VCF file.

::::::::::::::::::::::::::::::::::::::: callout

#### Note
VariantsToTable, by default, only extracts PASS or . (no filtering applied) variants. Use the `--show-filtered` parameter to show all variants.

::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: challenge 

#### Challenge 5.1

```bash
gatk VariantsToTable \
    -R reference/hg38/Homo_sapiens_assembly38.fasta \
    -V output/output.vqsr.varfilter.pass.vcf.gz \
    -F CHROM -F POS -F FILTER -F TYPE -GF AD -GF DP \
    --show-filtered \
    -O output/output.vqsr.varfilter.pass.tsv
```
:::::::::::::::::::::::::::::::::

## HTML report

Another useful method for sharing data is an interactive HTML file. This is suited for sharing a smaller subset of variants along with sequencing data. Here we will go through a simple example using the [jigv](https://github.com/brentp/jigv) tool. See below on how to download and setup jigv.

::::::::::::::::::::::::::::::::::::: challenge 

#### Challenge 5.2

Download jigv:
```bash
wget https://github.com/brentp/jigv/releases/download/v0.1.10/jigv
```
Make jigv executable:
```bash
chmod +x jigv
```
:::::::::::::::::::::::::::::::::

Screenshot

::::::::::::::::::::::::::::::::::::: challenge 

#### Challenge 5.3

We will start with creating a subset of variants to report:

```bash
bcftools view output/output.vqsr.varfilter.pass.vcf.gz \
chr20:3822018-3999324 | \
bgzip -c > output/subset.vcf.gz

tabix -p vcf output/subset.vcf.gz
```

Now, we will call the jigv tool command to generate the report:

```bash
./jigv --sample NA12878 \
--sites output/subset.vcf.gz \
--fasta reference/hg38/Homo_sapiens_assembly38.fasta \
output/NA12878.sort.dup.bqsr.bam > output/NA12878.jigv.html
```
:::::::::::::::::::::::::::::::::

Here is an example [report](https://www.melbournebioinformatics.org.au/tutorials/tutorials/variant_calling_gatk1/files/NA12878.html) we created earlier.

## Additional Information: Introduction to variant annotation using Ensembl VEP

This is a very brief introduction to variant annotation using the [Ensembl Variant Effect Predictor (VEP)](https://asia.ensembl.org/Tools/VEP) tool. Follow the link to the Web Interface and upload your final output variant file and click Run.

Here is a link to the annotation output [file](https://www.melbournebioinformatics.org.au/tutorials/tutorials/variant_calling_gatk1/files/output.vqsr.varfilter.pass.vep.re_NM.xlsx) created earlier in Excel format.

We can also take another look at the updated MultiQC report with annotatio summary [here](https://www.melbournebioinformatics.org.au/tutorials/tutorials/variant_calling_gatk1/files/multiqc_report_vep.html).

::::::::::::::::::::::::::::::::::::: keypoints 

- Use  

::::::::::::::::::::::::::::::::::::::::::::::::

