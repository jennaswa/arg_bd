#!/bin/bash

#Install ResFinder
git clone https://git@bitbucket.org/genomicepidemiology/resfinder_db.git

#Reformat resfinder database
#Catenate all drug class databases into one
cd resfinder_db/
cat *.fsa > ResFinder.fasta

#Edit characters to be accepted in downstream analysis
sed "s/'/-/g" ResFinder.fasta | sed "s/[()]/_/g" > ResFinder_chars.fasta

#Remove empty lines and duplicated sequences
python dedup_database.py
