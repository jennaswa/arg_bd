#!/bin/bash

#Raw read input files
IN1=rural_chicken2.fastq
IN2=rural_chicken3.fastq
IN3=rural_chicken4.fastq
IN4=rural_chicken5.fastq
IN5=rural_goat2.fastq
IN6=rural_goat3.fastq
IN7=rural_goat4.fastq
IN8=rural_goat5.fastq
IN9=rural_human1.fastq
IN10=rural_human2.fastq
IN11=rural_human3.fastq
IN12=rural_human4.fastq
IN13=urban_chicken1.fastq
IN14=urban_chicken2.fastq
IN15=urban_chicken4.fastq
IN16=urban_chicken5.fastq
IN17=urban_goat1.fastq
IN18=urban_goat2.fastq
IN19=urban_goat3.fastq
IN20=urban_goat4.fastq
IN21=urban_human1.fastq
IN22=urban_human2.fastq
IN23=urban_human3.fastq
IN24=urban_human4.fastq

#Samples
SAMP1=RC2
SAMP2=RC3
SAMP3=RC4
SAMP4=RC5
SAMP5=RG2
SAMP6=RG3
SAMP7=RG4
SAMP8=RG5
SAMP9=RH1
SAMP10=RH2
SAMP11=RH3
SAMP12=RH4
SAMP13=UC1
SAMP14=UC2
SAMP15=UC4
SAMP16=UC5
SAMP17=UG1
SAMP18=UG2
SAMP19=UG3
SAMP20=UG4
SAMP21=UH1
SAMP22=UH2
SAMP23=UH3
SAMP24=UH4

#assembling with flye
module load gcc/7.3.0
module load cmake/3.4.3
source activate flye

flye --nano-raw $IN1 -g 20m -o $SAMP1/flye/ -t 32 --meta
flye --nano-raw $IN2 -g 20m -o $SAMP2/flye/ -t 32 --meta
flye --nano-raw $IN3 -g 20m -o $SAMP3/flye/ -t 32 --meta
flye --nano-raw $IN4 -g 20m -o $SAMP4/flye/ -t 32 --meta
flye --nano-raw $IN5 -g 20m -o $SAMP5/flye/ -t 32 --meta
flye --nano-raw $IN6 -g 20m -o $SAMP6/flye/ -t 32 --meta
flye --nano-raw $IN7 -g 20m -o $SAMP7/flye/ -t 32 --meta
flye --nano-raw $IN8 -g 20m -o $SAMP8/flye/ -t 32 --meta
flye --nano-raw $IN9 -g 20m -o $SAMP9/flye/ -t 32 --meta
flye --nano-raw $IN10 -g 20m -o $SAMP10/flye/ -t 32 --meta
flye --nano-raw $IN11 -g 20m -o $SAMP11/flye/ -t 32 --meta
flye --nano-raw $IN12 -g 20m -o $SAMP12/flye/ -t 32 --meta
flye --nano-raw $IN13 -g 20m -o $SAMP13/flye/ -t 32 --meta
flye --nano-raw $IN14 -g 20m -o $SAMP14/flye/ -t 32 --meta
flye --nano-raw $IN15 -g 20m -o $SAMP15/flye/ -t 32 --meta
flye --nano-raw $IN16 -g 20m -o $SAMP16/flye/ -t 32 --meta
flye --nano-raw $IN17 -g 20m -o $SAMP17/flye/ -t 32 --meta
flye --nano-raw $IN18 -g 20m -o $SAMP18/flye/ -t 32 --meta
flye --nano-raw $IN19 -g 20m -o $SAMP19/flye/ -t 32 --meta
flye --nano-raw $IN20 -g 20m -o $SAMP20/flye/ -t 32 --meta
flye --nano-raw $IN21 -g 20m -o $SAMP21/flye/ -t 32 --meta
flye --nano-raw $IN22 -g 20m -o $SAMP22/flye/ -t 32 --meta
flye --nano-raw $IN23 -g 20m -o $SAMP23/flye/ -t 32 --meta
flye --nano-raw $IN24 -g 20m -o $SAMP24/flye/ -t 32 --meta

conda deactivate

#polishing with medaka
source activate medaka

medaka_consensus -i $IN1 -d $SAMP1/flye/assembly.fasta -o $SAMP1/medaka -M r941_min_high_g330 -T 32
medaka_consensus -i $IN2 -d $SAMP2/flye/assembly.fasta -o $SAMP2/medaka -M r941_min_high_g330 -T 32
medaka_consensus -i $IN3 -d $SAMP3/flye/assembly.fasta -o $SAMP3/medaka -M r941_min_high_g330 -T 32
medaka_consensus -i $IN4 -d $SAMP4/flye/assembly.fasta -o $SAMP4/medaka -M r941_min_high_g330 -T 32
medaka_consensus -i $IN5 -d $SAMP5/flye/assembly.fasta -o $SAMP5/medaka -M r941_min_high_g330 -T 32
medaka_consensus -i $IN6 -d $SAMP6/flye/assembly.fasta -o $SAMP6/medaka -M r941_min_high_g330 -T 32
medaka_consensus -i $IN7 -d $SAMP7/flye/assembly.fasta -o $SAMP7/medaka -M r941_min_high_g330 -T 32
medaka_consensus -i $IN8 -d $SAMP8/flye/assembly.fasta -o $SAMP8/medaka -M r941_min_high_g330 -T 32
medaka_consensus -i $IN9 -d $SAMP9/flye/assembly.fasta -o $SAMP9/medaka -M r941_min_high_g330 -T 32
medaka_consensus -i $IN10 -d $SAMP10/flye/assembly.fasta -o $SAMP10/medaka -M r941_min_high_g330 -T 32
medaka_consensus -i $IN11 -d $SAMP11/flye/assembly.fasta -o $SAMP11/medaka -M r941_min_high_g330 -T 32
medaka_consensus -i $IN12 -d $SAMP12/flye/assembly.fasta -o $SAMP12/medaka -M r941_min_high_g330 -T 32
medaka_consensus -i $IN13 -d $SAMP13/flye/assembly.fasta -o $SAMP13/medaka -M r941_min_high_g330 -T 32
medaka_consensus -i $IN14 -d $SAMP14/flye/assembly.fasta -o $SAMP14/medaka -M r941_min_high_g330 -T 32
medaka_consensus -i $IN15 -d $SAMP15/flye/assembly.fasta -o $SAMP15/medaka -M r941_min_high_g330 -T 32
medaka_consensus -i $IN16 -d $SAMP16/flye/assembly.fasta -o $SAMP16/medaka -M r941_min_high_g330 -T 32
medaka_consensus -i $IN17 -d $SAMP17/flye/assembly.fasta -o $SAMP17/medaka -M r941_min_high_g330 -T 32
medaka_consensus -i $IN18 -d $SAMP18/flye/assembly.fasta -o $SAMP18/medaka -M r941_min_high_g330 -T 32
medaka_consensus -i $IN19 -d $SAMP19/flye/assembly.fasta -o $SAMP19/medaka -M r941_min_high_g330 -T 32
medaka_consensus -i $IN20 -d $SAMP20/flye/assembly.fasta -o $SAMP20/medaka -M r941_min_high_g330 -T 32
medaka_consensus -i $IN21 -d $SAMP21/flye/assembly.fasta -o $SAMP21/medaka -M r941_min_high_g330 -T 32
medaka_consensus -i $IN22 -d $SAMP22/flye/assembly.fasta -o $SAMP22/medaka -M r941_min_high_g330 -T 32
medaka_consensus -i $IN23 -d $SAMP23/flye/assembly.fasta -o $SAMP23/medaka -M r941_min_high_g330 -T 32
medaka_consensus -i $IN24 -d $SAMP24/flye/assembly.fasta -o $SAMP24/medaka -M r941_min_high_g330 -T 32

conda deactivate
