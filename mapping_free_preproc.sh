#!/bin/sh

# Visos komandos is projekto saknines direktorijos


## Reference transcriptome preparation

# check if index files exist and in case it does not exist - create a reference transcriptome index.
gunzip ./ref/mm10.fasta_cdnaRef.fa.gz

FILE=./ref/mm10_cDNA/ref_indexing.log
if [ -f "$FILE" ]; then
    echo "ref index exists."
else 
    salmon index -t ./ref/mm10.fasta_cdnaRef.fa -i ./ref/mm10_cDNA
fi

## Data QC

#Run FASTQC analysis on each of your FASTQC files.
for i in inputs/*fastq.gz
do fastqc $i
done

#Generate MULTIQC report for (1) results.
multiqc inputs/*fastqc.zip -o inputs/

#Run standard FASTQ trimming: you should remove any adapters, trim low-quality bases as well as remove reads that are shorter than 20 bp.
for i in inputs/*1.fastq.gz
do
    base=$(basename $i _1.fastq.gz)
    trim_galore -j 6 --paired inputs/${base}_1.fastq.gz inputs/${base}_2.fastq.gz -o outputs/
done

#Rerun FASTQC on newly created/cleaned FASTQ files.
for i in outputs/*fastq.gz
do fastqc $i
done

## Quantification

#Quantify each of your samples

for i in outputs/*1_val_1.fq.gz
do
base=$(basename $i _1_val_1.fq.gz)
salmon quant -i ./ref/mm10_cDNA -l IU -1 outputs/${base}_1_val_1.fq.gz -2 outputs/${base}_2_val_2.fq.gz --validateMappings -o outputs/${base}_transcripts_quant
done
