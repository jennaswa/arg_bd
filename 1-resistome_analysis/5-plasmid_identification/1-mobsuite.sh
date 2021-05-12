#!/bin/bash

module load gcc/7.3.0
module load cmake/3.4.3

source activate mobsuite

IN1=RC2/medaka/consensus.fasta
IN2=RC3/medaka/consensus.fasta
IN3=RC4/medaka/consensus.fasta
IN4=RC5/medaka/consensus.fasta
IN5=RG2/medaka/consensus.fasta
IN6=RG3/medaka/consensus.fasta
IN7=RG4/medaka/consensus.fasta
IN8=RG5/medaka/consensus.fasta
IN9=RH1/medaka/consensus.fasta
IN10=RH2/medaka/consensus.fasta
IN11=RH3/medaka/consensus.fasta
IN12=RH4/medaka/consensus.fasta
IN13=UC1/medaka/consensus.fasta
IN14=UC2/medaka/consensus.fasta
IN15=UC4/medaka/consensus.fasta
IN16=UC5/medaka/consensus.fasta
IN17=UG1/medaka/consensus.fasta
IN18=UG2/medaka/consensus.fasta
IN19=UG3/medaka/consensus.fasta
IN20=UG4/medaka/consensus.fasta
IN21=UH1/medaka/consensus.fasta
IN22=UH2/medaka/consensus.fasta
IN23=UH3/medaka/consensus.fasta
IN24=UH4/medaka/consensus.fasta

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

mob_recon --infile $IN1 --outdir $SAMP1/mobsuite -n 32
mob_recon --infile $IN2 --outdir $SAMP2/mobsuite -n 32
mob_recon --infile $IN3 --outdir $SAMP3/mobsuite -n 32
mob_recon --infile $IN4 --outdir $SAMP4/mobsuite -n 32
mob_recon --infile $IN5 --outdir $SAMP5/mobsuite -n 32
mob_recon --infile $IN6 --outdir $SAMP6/mobsuite -n 32
mob_recon --infile $IN7 --outdir $SAMP7/mobsuite -n 32
mob_recon --infile $IN8 --outdir $SAMP8/mobsuite -n 32
mob_recon --infile $IN9 --outdir $SAMP9/mobsuite -n 32
mob_recon --infile $IN10 --outdir $SAMP10/mobsuite -n 32
mob_recon --infile $IN11 --outdir $SAMP11/mobsuite -n 32
mob_recon --infile $IN12 --outdir $SAMP12/mobsuite -n 32
mob_recon --infile $IN13 --outdir $SAMP13/mobsuite -n 32
mob_recon --infile $IN14 --outdir $SAMP14/mobsuite -n 32
mob_recon --infile $IN15 --outdir $SAMP15/mobsuite -n 32
mob_recon --infile $IN16 --outdir $SAMP16/mobsuite -n 32
mob_recon --infile $IN17 --outdir $SAMP17/mobsuite -n 32
mob_recon --infile $IN18 --outdir $SAMP18/mobsuite -n 32
mob_recon --infile $IN19 --outdir $SAMP19/mobsuite -n 32
mob_recon --infile $IN20 --outdir $SAMP20/mobsuite -n 32
mob_recon --infile $IN21 --outdir $SAMP21/mobsuite -n 32
mob_recon --infile $IN22 --outdir $SAMP22/mobsuite -n 32
mob_recon --infile $IN23 --outdir $SAMP23/mobsuite -n 32
mob_recon --infile $IN24 --outdir $SAMP24/mobsuite -n 32
