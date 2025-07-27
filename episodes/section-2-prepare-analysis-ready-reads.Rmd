---
title: 'Prepare analysis ready reads'
teaching: 10
exercises: 2
---

:::::::::::::::::::::::::::::::::::::: questions 

- Why is it important to sort SAM/BAM files in a variant calling analysis pipeline?
- What are duplicate reads? How do I identify them in a BAM file?
- What is base quality score recalibration (BQSR)? How does it improve the accuracy of variant calls?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Sort aligned sequencing reads (SAM/BAM files) by genomic coordinates using `picard SortSam`.
- Generate basic alignment statistics using `samtools flagstat`.
- Identify and mark duplicate reads using `picard MarkDuplicates`.
- Perform BQSR using GATK `BaseRecalibrator` and `ApplyBQSR` tools.
- Run summary statistics and quality control of the alignment data. 

::::::::::::::::::::::::::::::::::::::::::::::::


::::::::::::::::::::::::::::::::::::: keypoints 

- Sorting BAM files ensures that reads are ordered by their genomic coordinates.
- Duplicate reads are often introduced during PCR amplification and do not represent independent sequencing events. They identified and flagged by `picard MarkDuplicates`, so that they can be excluded from downstream analysis.
- BQSR, performed using GATK `BaseRecalibrator` and `ApplyBQSR` tools, adjusts the base quality scores by correcting systematic errors made introduced during sequencing. 

::::::::::::::::::::::::::::::::::::::::::::::::

