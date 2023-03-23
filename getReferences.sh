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

cat ref/*.fasta > ref/mm10.fasta


#Ref traskriptomas

wget -O ./ref/MusMusculus_cdnaRef.fa.gz https://ftp.ensembl.org/pub/release-67/fasta/mus_musculus/cdna/Mus_musculus.NCBIM37.67.cdna.all.fa.gz

#GFF
j=67
while [ $j -le 87 ]
do
    URL="https://www.ncbi.nlm.nih.gov/sviewer/viewer.cgi?db=nuccore&report=gff3&id=NC_0000"${j}
    wget -O ./ref/NC_0000${j}.gff ${URL}
    j=$(($j+1))
done


#RNASeq raw duomenys

wget -O ./inputs/SRR8985047_1.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR898/007/SRR8985047/SRR8985047_1.fastq.gz
                                       ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR898/007/SRR8985047/SRR8985047_1.fastq.gz
wget -O ./inputs/SRR8985047_2.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR898/007/SRR8985047/SRR8985047_2.fastq.gz
                                       ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR898/007/SRR8985047/SRR8985047_2.fastq.gz

wget -O ./inputs/SRR8985048_1.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR898/008/SRR8985048/SRR8985048_1.fastq.gz
                                       ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR898/008/SRR8985048/SRR8985048_1.fastq.gz
wget -O ./inputs/SRR8985048_2.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR898/008/SRR8985048/SRR8985048_2.fastq.gz
                                       ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR898/008/SRR8985048/SRR8985048_2.fastq.gz

wget -O ./inputs/SRR8985049_1.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR898/009/SRR8985049/SRR8985049_1.fastq.gz
                                       ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR898/009/SRR8985049/SRR8985049_1.fastq.gz
wget -O ./inputs/SRR8985049_2.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR898/009/SRR8985049/SRR8985049_2.fastq.gz
                                       ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR898/009/SRR8985049/SRR8985049_2.fastq.gz

wget -O ./inputs/SRR8985050_1.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR898/000/SRR8985050/SRR8985050_1.fastq.gz
                                       ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR898/000/SRR8985050/SRR8985050_1.fastq.gz
wget -O ./inputs/SRR8985050_2.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR898/000/SRR8985050/SRR8985050_2.fastq.gz
                                       ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR898/000/SRR8985050/SRR8985050_2.fastq.gz



#new ref

#ref genome
wget -O ./ref/mm10.fa.gz https://ftp.ensembl.org/pub/release-109/fasta/mus_musculus/dna/Mus_musculus.GRCm39.dna.primary_assembly.fa.gz

#Ref traskriptomas
wget -O ./ref/mm10.fasta_cdnaRef.fa.gz https://ftp.ensembl.org/pub/release-67/fasta/mus_musculus/cdna/Mus_musculus.NCBIM37.67.cdna.all.fa.gz

#GFF

wget -O ./ref/mm10.gff3.gz https://ftp.ensembl.org/pub/release-109/gff3/mus_musculus/Mus_musculus.GRCm39.109.gff3.gz


wget -O ./test_in/SRR8985047_1.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR898/007/SRR8985047/SRR8985047_1.fastq.gz
wget -O ./test_in/SRR8985047_2.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR898/007/SRR8985047/SRR8985047_2.fastq.gz

wget -O ./test_in/SRR8985048_1.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR898/008/SRR8985048/SRR8985048_1.fastq.gz
wget -O ./test_in/SRR8985048_2.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR898/008/SRR8985048/SRR8985048_2.fastq.gz

wget -O ./test_in/SRR8985049_1.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR898/009/SRR8985049/SRR8985049_1.fastq.gz
wget -O ./test_in/SRR8985049_2.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR898/009/SRR8985049/SRR8985049_2.fastq.gz

wget -O ./test_in/SRR8985050_1.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR898/000/SRR8985050/SRR8985050_1.fastq.gz
wget -O ./test_in/SRR8985050_2.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR898/000/SRR8985050/SRR8985050_2.fastq.gz