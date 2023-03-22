#!/bin/sh

# Visos komandos is projekto saknines direktorijos

## Reference genome preparation
#check if index files exist and if it does not exist - create a reference genome index.
gunzip ./ref/mm10.fa.gz

FILE=./ref/mm10.1.ht2
if [ -f "$FILE" ]; then
    echo "ref index exists."
else 
    hisat2-build ./ref/mm10.fa  ./ref/mm10
fi

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


#Rerun FASTQC on newly created/cleaned FASTQ files. 
for i in outputs/*.gz
do fastqc $i
done

Create MultiQC plots for your raw and processed data. 
## Mapping, some QC and quantification

#Mapped each sample to the reference genome. 
#After mapping, you should remove unmapped reads as well as reads that are mapped incorrectly. Mapping results should be saved in BAM format.
#Deduplicate your file

for i in outputs/*1_val_1.fq.gz
do 
base=$(basename $i _1_val_1.fq.gz)
hisat2 -p 6 --dta -x ./ref/mm10 -1 outputs/${base}_1_val_1.fq.gz -2 outputs/${base}_2_val_2.fq.gz -S outputs/${base}.sam 
done

for i in ./outputs/*.sam
do
    base=$(basename $i .sam)
    samtools view -F 260 -bS -@ 6 ./outputs/${base}.sam |  samtools sort -@ 6 -o ./outputs/tmp.bam # -F 260 filter unmapped, if one of paire is unmapped, secondary reads and PCR dup
    samtools sort -@ 6 -n ./outputs/tmp.bam -o ./outputs/foo.bam
    samtools fixmate -@ 6 -m -r ./outputs/foo.bam ./outputs/bar.bam # -r Remove secondary and unmapped reads, -m add tags
    samtools sort -@ 6 ./outputs/bar.bam -o ./outputs/foo.bam
    samtools markdup -@ 6 -r -s ./outputs/foo.bam ./outputs/bar.bam # -r Remove duplicate reads, -s statistics
    samtools sort -@ 6 ./outputs/bar.bam -o ./outputs/${base}.bam
done

rm outputs/tmp.bam outputs/bar.bam outputs/foo.bam

#Index your BAM files

for i in ./outputs/*.bam
do
samtools index $i
done

#Run stringtie quantification on your BAM files.

zcat ./ref/mm10.gff3.gz > ./ref/mm10.gff

for i in ./outputs/*.bam
do
ID=$(basename $i .bam)
stringtie -p 6 -G ./ref/mm10.gff -o ./outputs/${ID}/${ID}.gtf -l ${ID} $i
done

echo "./outputs/SRR8985047/SRR8985047.gtf" > results/mergelist.txt
echo "./outputs/SRR8985048/SRR8985048.gtf" >> results/mergelist.txt
echo "./outputs/SRR8985049/SRR8985049.gtf" >> results/mergelist.txt
echo "./outputs/SRR8985050/SRR8985050.gtf" >> results/mergelist.txt

stringtie --merge -p 6 -G ./ref/mm10.gff -o ./results/stringtie_merged.gtf ./results/mergelist.txt

for i in ./outputs/*.bam
do
ID=$(basename $i .bam)
stringtie -p 6 -e -B -G ./results/stringtie_merged.gtf -o ./outputs/${ID}/${ID}"/"${ID}.gtf $i
done

#Create a correlation diagram as well as a PCA plot for your data. Correlation and PCA plots should be saved to the results folder.

multiBamSummary bins --outFileName results/mapped.npz --binSize 10000 -p 6 --outRawCounts results/results.raw_counts.tsv -b outputs/*.bam

plotCorrelation -in results/mapped.npz -c pearson -p heatmap -o results/mapped_data_heatmap.pdf

plotCorrelation -in results/mapped.npz -c pearson -p scatterplot -o results/mapped_data_scatter.pdf

plotPCA -in results/mapped.npz -o results/mapped_data_PCA.pdf


# 47, 48 WT
# 49, 50 heterozygous

for i in outputs/*1_val_1.fq.gz
do 
base=$(basename $i _1_val_1.fq.gz)
hisat2 -p 6 --dta -x ./ref/mm10 -1 outputs/${base}_1_val_1.fq.gz -2 outputs/${base}_2_val_2.fq.gz -S test/${base}.sam 
done

for i in ./test/*.sam
do
    base=$(basename $i .sam)
    samtools view -F 260 -bS -@ 6 ./test/${base}.sam |  samtools sort -@ 6 -o ./test/tmp.bam
    samtools sort -@ 6 -n ./test/tmp.bam -o ./test/foo.bam
    samtools fixmate -@ 6 -m -r ./test/foo.bam ./test/bar.bam # -r Remove secondary and unmapped reads, -m add tags
    samtools sort -@ 6 ./test/bar.bam -o ./test/foo.bam
    samtools markdup -@ 6 -r -s ./test/foo.bam ./test/bar.bam # -r Remove duplicate reads, -s statistics
    samtools sort -@ 6 ./test/bar.bam -o ./test/${base}.bam
done
