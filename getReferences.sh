#!/bin/sh

# Mus musculus RNASeq failų atsiuntimo skriptas
# Visos komandos iš projekto šaknines direktorijos

#Ref genomas
i=67
while [ $i -le 87 ]
do
    efetch -db nucleotide -id NC_0000$i -format fasta > ./ref/NC_0000$i.fasta
    i=$(($i+1))
done


#Ref traskriptomas

???

#GFF
j=67
while [ $j -le 87 ]
do
    URL="https://www.ncbi.nlm.nih.gov/sviewer/viewer.cgi?db=nuccore&report=gff3&id=NC_0000"${j}
    wget -O ./NC_0000${j}.gff ${URL}
    j=$(($j+1))
done


#RNASeq raw duomenys

wget -O ./ref/SRR8985047_1.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR898/007/SRR8985047/SRR8985047_1.fastq.gz
wget -O ./ref/SRR8985047_2.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR898/007/SRR8985047/SRR8985047_2.fastq.gz

wget -O ./ref/SRR8985048_1.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR898/008/SRR8985048/SRR8985048_1.fastq.gz
wget -O ./ref/SRR8985048_2.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR898/008/SRR8985048/SRR8985048_2.fastq.gz

wget -O ./ref/SRR8985049_1.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR898/009/SRR8985049/SRR8985049_1.fastq.gz
wget -O ./ref/SRR8985049_2.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR898/009/SRR8985049/SRR8985049_2.fastq.gz

wget -O ./ref/SRR8985050_1.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR898/000/SRR8985050/SRR8985050_1.fastq.gz
wget -O ./ref/SRR8985050_2.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR898/000/SRR8985050/SRR8985050_2.fastq.gz