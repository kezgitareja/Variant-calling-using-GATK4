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


::::::::::::::::::::::::::::::::::::: keypoints 

- Use `.md` files for episodes when you want static content
- Use `.Rmd` files for episodes when you need to generate output
- Run `sandpaper::check_lesson()` to identify any issues with your lesson
- Run `sandpaper::build_lesson()` to preview your lesson locally

::::::::::::::::::::::::::::::::::::::::::::::::

