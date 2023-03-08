#!/bin/sh

# Basic info about Mus musculus data 
# Visos komandos iš projekto šaknines direktorijos

# Calculate (and print to the screen) the number of sequences in your reference genome
cat ./ref/*.fasta | grep ">" | wc -l

# Calculate (and print to the screen) the number of reads in each sample.

for j in ./inputs/*.fastq.gz
    do zcat $j | grep "@" | wc -l
    done

# Calculate the number of protein-coding genes in your genome.

for i in ./ref/*.gff
    do cat $i |grep "CDS" | awk '{ print $9 }' | uniq | wc -l >> gene_count
    done

    sum gene_count
