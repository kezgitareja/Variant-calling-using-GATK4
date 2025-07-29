---
title: 'Filter and prepare analysis ready variants'
teaching: 10
exercises: 2
---

:::::::::::::::::::::::::::::::::::::: questions 

- How

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Explain

::::::::::::::::::::::::::::::::::::::::::::::::

## Variant Quality Score Recalibration

The raw VCF file from the previous step (`output.vcf.gz`) contains 10467 variants. Not all of these are real, therefore, the aim of this step is to filter out artifacts or false positive variants. GATK has provided different workflows for variant filtering. Here we will walk through the Variant Quality Score Recalibration or the VQSR strategy. VQSR is a two step process (1) the first step builds a model that describes how variant metric or quality measures co-vary with the known variants in the training set. (2) The second step then ranks each variant according to the target sensitivity cutoff and applies a filter expression.

::::::::::::::::::::::::::::::::::::: challenge 

#### Challenge 4.1

Step 1. VariantRecalibrator

```bash
gatk --java-options "-Xmx7g" VariantRecalibrator \
    -V output/output.vcf.gz \
    --trust-all-polymorphic \
    -mode SNP \
    --max-gaussians 6 \
    --resource:hapmap,known=false,training=true,truth=true,prior=15 reference/hg38/hapmap_3.3.hg38.vcf.gz \
    --resource:omni,known=false,training=true,truth=true,prior=12 reference/hg38/1000G_omni2.5.hg38.vcf.gz \
    --resource:1000G,known=false,training=true,truth=false,prior=10 reference/hg38/1000G_phase1.snps.high_confidence.hg38.vcf.gz \
    --resource:dbsnp,known=true,training=false,truth=false,prior=7 reference/hg38/dbsnp_138.hg38.vcf.gz \
    -an QD -an MQRankSum -an ReadPosRankSum -an FS -an MQ -an SOR -an DP \
    -O output/cohort_snps.recal \
    --tranches-file output/cohort_snps.tranches
```

Step 2. ApplyVQSR

```bash
gatk --java-options "-Xmx7g" ApplyVQSR \
    -R reference/hg38/Homo_sapiens_assembly38.fasta \
    -V output/output.vcf.gz \
    -O output/output.vqsr.vcf \
    --truth-sensitivity-filter-level 99.0 \
    --tranches-file output/cohort_snps.tranches \
    --recal-file output/cohort_snps.recal \
    -mode SNP
```

:::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::: callout

#### Countvariants
There are number of ways to count the variants in a VCF file. A very straight forward way using the GATK4 tools is as follows:

```bash
gatk CountVariants -V output/output.vqsr.vcf
```

```output
Tool returned:
10467
```

::::::::::::::::::::::::::::::::::::::::::::::



::::::::::::::::::::::::::::::::::::: keypoints 

- Use 

::::::::::::::::::::::::::::::::::::::::::::::::

