#!/bin/bash

#Run script to filter fasta files
#w ARGS
cat RH2/medaka/consensus.fasta | grep -A 1 -wFf RH2pathogens_readids-assembly.txt --no-group-separator > pathogens_wARGS_RH2.fasta
cat UG4/medaka/consensus.fasta | grep -A 1 -wFf UG4pathogens_readids-assembly.txt --no-group-separator > pathogens_wARGS_UG4.fasta
cat UH1/medaka/consensus.fasta | grep -A 1 -wFf UH1pathogens_readids-assembly.txt --no-group-separator > pathogens_wARGS_UH1.fasta

#wout ARGs
cat RC3/medaka/consensus.fasta | grep -A 1 -wFf RC3ALLpathogens_woutARGs_readids-assembly.txt --no-group-separator > pathogens_woutARGS_RC3.fasta
cat RG4/medaka/consensus.fasta | grep -A 1 -wFf RG4ALLpathogens_woutARGs_readids-assembly.txt --no-group-separator > pathogens_woutARGS_RG4.fasta
cat RH1/medaka/consensus.fasta | grep -A 1 -wFf RH1ALLpathogens_woutARGs_readids-assembly.txt --no-group-separator > pathogens_woutARGS_RH1.fasta
cat RH2/medaka/consensus.fasta | grep -A 1 -wFf RH2ALLpathogens_woutARGs_readids-assembly.txt --no-group-separator > pathogens_woutARGS_RH2.fasta
cat RH3/medaka/consensus.fasta | grep -A 1 -wFf RH3ALLpathogens_woutARGs_readids-assembly.txt --no-group-separator > pathogens_woutARGS_RH3.fasta
cat RH4/medaka/consensus.fasta | grep -A 1 -wFf RH4ALLpathogens_woutARGs_readids-assembly.txt --no-group-separator > pathogens_woutARGS_RH4.fasta
cat UC1/medaka/consensus.fasta | grep -A 1 -wFf UC1ALLpathogens_woutARGs_readids-assembly.txt --no-group-separator > pathogens_woutARGS_UC1.fasta
cat UC2/medaka/consensus.fasta | grep -A 1 -wFf UC2ALLpathogens_woutARGs_readids-assembly.txt --no-group-separator > pathogens_woutARGS_UC2.fasta
cat UC4/medaka/consensus.fasta | grep -A 1 -wFf UC4bALLpathogens_woutARGs_readids-assembly.txt --no-group-separator > pathogens_woutARGS_UC4b.fasta
cat UC5/medaka/consensus.fasta | grep -A 1 -wFf UC5ALLpathogens_woutARGs_readids-assembly.txt --no-group-separator > pathogens_woutARGS_UC5.fasta
cat UG1/medaka/consensus.fasta | grep -A 1 -wFf UG1ALLpathogens_woutARGs_readids-assembly.txt --no-group-separator > pathogens_woutARGS_UG1.fasta
cat UG2/medaka/consensus.fasta | grep -A 1 -wFf UG2ALLpathogens_woutARGs_readids-assembly.txt --no-group-separator > pathogens_woutARGS_UG2.fasta
cat UG3/medaka/consensus.fasta | grep -A 1 -wFf UG3ALLpathogens_woutARGs_readids-assembly.txt --no-group-separator > pathogens_woutARGS_UG3.fasta
cat UG4/medaka/consensus.fasta | grep -A 1 -wFf UG4ALLpathogens_woutARGs_readids-assembly.txt --no-group-separator > pathogens_woutARGS_UG4.fasta
cat UH1/medaka/consensus.fasta | grep -A 1 -wFf UH1ALLpathogens_woutARGs_readids-assembly.txt --no-group-separator > pathogens_woutARGS_UH1.fasta
cat UH2/medaka/consensus.fasta | grep -A 1 -wFf UH2ALLpathogens_woutARGs_readids-assembly.txt --no-group-separator > pathogens_woutARGS_UH2.fasta
cat UH3/medaka/consensus.fasta | grep -A 1 -wFf UH3ALLpathogens_woutARGs_readids-assembly.txt --no-group-separator > pathogens_woutARGS_UH3.fasta
cat UH4/medaka/consensus.fasta | grep -A 1 -wFf UH4ALLpathogens_woutARGs_readids-assembly.txt --no-group-separator > pathogens_woutARGS_UH4.fasta
