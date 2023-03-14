#!/bin/sh

## Reference genome preparation
#Your script should check if index files exist and if it does not exist - create a reference genome index.

hisat2-build ./ref/mm10.fa  ./ref/mm10
## Data QC
#Run FASTQC analysis on each of your FASTQC files.
for i in inputs/*.gz
do fastqc $i
done

#Generate MULTIQC report for (1) results.
multiqc inputs/*fastqc.zip -o inputs/

#Run standard FASTQ trimming: you should remove adapters, trim low-quality bases as well as remove reads that are shorter than 20 bp.
for i in inputs/*1.fastq.gz
do
    base=$(basename $i _1.fastq.gz)
    trim_galore -j 6 --paired inputs/${base}_1.fastq.gz inputs/${base}_2.fastq.gz -o outputs/
done


Rerun FASTQC on newly created/cleaned FASTQ files. 
Create MultiQC plots for your raw and processed data. 
## Mapping, some QC and quantification
Your script should:

Mapped each sample to the reference genome. After mapping, you should remove unmapped reads as well as reads that are mapped incorrectly. Mapping results should be saved in BAM format.
Deduplicate your file
Index your BAM files.
Run stringtie quantification on your BAM files.
Create a correlation diagram as well as a PCA plot for your data. Correlation and PCA plots should be saved to the results folder.