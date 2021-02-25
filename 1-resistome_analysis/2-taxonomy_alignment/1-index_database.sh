#!/bin/bash

#Prior to running index_database.sh:
#download source package from github.com/infphilo/centrifuge/releases/tag/v1.0.4-beta
#upload to working directory



#Description of index_database.sh:
#Install Centrifuge
#Add following line to seqid2taxid.map:
#45202  45202
#Save as seqid2taxid-noplasmids.map and upload to ./centrifuge-1.0.4-beta/
#Rename plasmid headers in RefSeq to be associated with NCBI:txid 45202, "unidentified plasmid"
#Index RefSeq with plasmids removed for Centrifuge



#Install Centrifuge (https://ccb.jhu.edu/software/centrifuge/manual.shtml)
centrifuge-download -o taxonomy taxonomy
centrifuge-download -o library -m -d "archaea,bacteria,viral" refseq > seq2taxid.map

cat library/*/*.fna > input-sequences.fna



#Edit seq2taxid.map file
cat seqid2taxid.map >> seqid2taxid-noplasmids.map
echo "45202 45202" >> seqid2taxid-noplasmids.map



#Edit plasmid sequence headers
sed "/plasmid/c\>45202 unidentified plasmid" input-sequences.fna > input-sequences_noplasmids.fna



#Index RefSeq with plasmids removed
##build centrifuge index with 4 threads
centrifuge-build -p 4 --conversion-table seqid2taxid-noplasmids.map \
                 --taxonomy-tree taxonomy/nodes.dmp --name-table taxonomy/names.dmp \
                 input-sequences_noplasmids.fna abvnp
