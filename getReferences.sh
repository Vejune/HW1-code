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
wget -O ./ref/NC_000067.gff "https://www.ncbi.nlm.nih.gov/sviewer/viewer.cgi?db=nuccore&report=gff3&id=NC_000067"
wget -O ./ref/NC_000068.gff "https://www.ncbi.nlm.nih.gov/sviewer/viewer.cgi?db=nuccore&report=gff3&id=NC_000068"
wget -O ./ref/NC_000069.gff "https://www.ncbi.nlm.nih.gov/sviewer/viewer.cgi?db=nuccore&report=gff3&id=NC_000069"
wget -O ./ref/NC_000070.gff "https://www.ncbi.nlm.nih.gov/sviewer/viewer.cgi?db=nuccore&report=gff3&id=NC_000070"
wget -O ./ref/NC_000071.gff "https://www.ncbi.nlm.nih.gov/sviewer/viewer.cgi?db=nuccore&report=gff3&id=NC_000071"
wget -O ./ref/NC_000072.gff "https://www.ncbi.nlm.nih.gov/sviewer/viewer.cgi?db=nuccore&report=gff3&id=NC_000072"
wget -O ./ref/NC_000073.gff "https://www.ncbi.nlm.nih.gov/sviewer/viewer.cgi?db=nuccore&report=gff3&id=NC_000073"
wget -O ./ref/NC_000074.gff "https://www.ncbi.nlm.nih.gov/sviewer/viewer.cgi?db=nuccore&report=gff3&id=NC_000074"
wget -O ./ref/NC_000075.gff "https://www.ncbi.nlm.nih.gov/sviewer/viewer.cgi?db=nuccore&report=gff3&id=NC_000075"
wget -O ./ref/NC_000076.gff "https://www.ncbi.nlm.nih.gov/sviewer/viewer.cgi?db=nuccore&report=gff3&id=NC_000076"
wget -O ./ref/NC_000077.gff "https://www.ncbi.nlm.nih.gov/sviewer/viewer.cgi?db=nuccore&report=gff3&id=NC_000077"
wget -O ./ref/NC_000078.gff "https://www.ncbi.nlm.nih.gov/sviewer/viewer.cgi?db=nuccore&report=gff3&id=NC_000078"
wget -O ./ref/NC_000079.gff "https://www.ncbi.nlm.nih.gov/sviewer/viewer.cgi?db=nuccore&report=gff3&id=NC_000079"
wget -O ./ref/NC_000080.gff "https://www.ncbi.nlm.nih.gov/sviewer/viewer.cgi?db=nuccore&report=gff3&id=NC_000080"
wget -O ./ref/NC_000081.gff "https://www.ncbi.nlm.nih.gov/sviewer/viewer.cgi?db=nuccore&report=gff3&id=NC_000081"
wget -O ./ref/NC_000082.gff "https://www.ncbi.nlm.nih.gov/sviewer/viewer.cgi?db=nuccore&report=gff3&id=NC_000082"
wget -O ./ref/NC_000083.gff "https://www.ncbi.nlm.nih.gov/sviewer/viewer.cgi?db=nuccore&report=gff3&id=NC_000083"
wget -O ./ref/NC_000084.gff "https://www.ncbi.nlm.nih.gov/sviewer/viewer.cgi?db=nuccore&report=gff3&id=NC_000084"
wget -O ./ref/NC_000085.gff "https://www.ncbi.nlm.nih.gov/sviewer/viewer.cgi?db=nuccore&report=gff3&id=NC_000085"
wget -O ./ref/NC_000086.gff "https://www.ncbi.nlm.nih.gov/sviewer/viewer.cgi?db=nuccore&report=gff3&id=NC_000086"
wget -O ./ref/NC_000087.gff "https://www.ncbi.nlm.nih.gov/sviewer/viewer.cgi?db=nuccore&report=gff3&id=NC_000087"

#RNASeq raw duomenys
wget -O ./ref/SRR8985047_1.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR898/007/SRR8985047/SRR8985047_1.fastq.gz
wget -O ./ref/SRR8985047_2.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR898/007/SRR8985047/SRR8985047_2.fastq.gz

wget -O ./ref/SRR8985048_1.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR898/008/SRR8985048/SRR8985048_1.fastq.gz
wget -O ./ref/SRR8985048_2.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR898/008/SRR8985048/SRR8985048_2.fastq.gz

wget -O ./ref/SRR8985049_1.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR898/009/SRR8985049/SRR8985049_1.fastq.gz
wget -O ./ref/SRR8985049_2.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR898/009/SRR8985049/SRR8985049_2.fastq.gz

wget -O ./ref/SRR8985050_1.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR898/000/SRR8985050/SRR8985050_1.fastq.gz
wget -O ./ref/SRR8985050_2.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR898/000/SRR8985050/SRR8985050_2.fastq.gz
