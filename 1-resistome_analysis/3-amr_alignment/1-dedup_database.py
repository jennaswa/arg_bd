#!/bin/bash

## https://bioinformatics.stackexchange.com/questions/2817/how-do-i-find-identical-sequences-in-a-fasta-file
from Bio import SeqIO
from Bio.Seq import Seq
from Bio.SeqRecord import SeqRecord
from Bio.Alphabet import generic_dna
from collections import defaultdict

dedup_records = defaultdict(list)

for record in SeqIO.parse("ResFinder_chars.fasta", "fasta"):
    # Use the sequence as the key and then have a list of id's as the value
    dedup_records[str(record.seq)].append(record.id)

# this creates a generator; if you need a physical list, replace the outer "(", ")" by "[" and "]", respectively
final_seq = (SeqRecord(Seq(seqi, generic_dna), id="|".join(gi), name='', description='') for seqi, gi in dedup_records.items())

# write file
SeqIO.write(final_seq, 'ResFinder_chars_dedup.fasta', 'fasta')
