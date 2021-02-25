#!/bin/bash

#Run script to filter centrifuge results files - raw reads
cat RC2-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > RC2-bacteria.txt
cat RC3-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > RC3-bacteria.txt
cat RC4-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > RC4-bacteria.txt
cat RC5-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > RC5-bacteria.txt
cat RC-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > RC-bacteria.txt

cat RC2-bacteria.txt | awk '{total += $7} END {print "RC2 Total:", total, "bp"}' >> gbps-bacteria.txt
cat RC3-bacteria.txt | awk '{total += $7} END {print "RC3 Total:", total, "bp"}' >> gbps-bacteria.txt
cat RC4-bacteria.txt | awk '{total += $7} END {print "RC4 Total:", total, "bp"}' >> gbps-bacteria.txt
cat RC5-bacteria.txt | awk '{total += $7} END {print "RC5 Total:", total, "bp"}' >> gbps-bacteria.txt
cat RC-bacteria.txt | awk '{total += $7} END {print "RC Total:", total, "bp"}' >> gbps-bacteria.txt

cat RG2-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > RG2-bacteria.txt
cat RG3-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > RG3-bacteria.txt
cat RG4-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > RG4-bacteria.txt
cat RG5-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > RG5-bacteria.txt
cat RG-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > RG-bacteria.txt

cat RG2-bacteria.txt | awk '{total += $7} END {print "RG2 Total:", total, "bp"}' >> gbps-bacteria.txt
cat RG3-bacteria.txt | awk '{total += $7} END {print "RG3 Total:", total, "bp"}' >> gbps-bacteria.txt
cat RG4-bacteria.txt | awk '{total += $7} END {print "RG4 Total:", total, "bp"}' >> gbps-bacteria.txt
cat RG5-bacteria.txt | awk '{total += $7} END {print "RG5 Total:", total, "bp"}' >> gbps-bacteria.txt
cat RG-bacteria.txt | awk '{total += $7} END {print "RG Total:", total, "bp"}' >> gbps-bacteria.txt

cat RH1-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > RH1-bacteria.txt
cat RH2-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > RH2-bacteria.txt
cat RH3-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > RH3-bacteria.txt
cat RH4-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > RH4-bacteria.txt
cat RH-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > RH-bacteria.txt

cat RH1-bacteria.txt | awk '{total += $7} END {print "RH1 Total:", total, "bp"}' >> gbps-bacteria.txt
cat RH2-bacteria.txt | awk '{total += $7} END {print "RH2 Total:", total, "bp"}' >> gbps-bacteria.txt
cat RH3-bacteria.txt | awk '{total += $7} END {print "RH3 Total:", total, "bp"}' >> gbps-bacteria.txt
cat RH4-bacteria.txt | awk '{total += $7} END {print "RH4 Total:", total, "bp"}' >> gbps-bacteria.txt
cat RH-bacteria.txt | awk '{total += $7} END {print "RH Total:", total, "bp"}' >> gbps-bacteria.txt

cat UC1-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > UC1-bacteria.txt
cat UC2-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > UC2-bacteria.txt
cat UC4-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > UC4-bacteria.txt
cat UC5-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > UC5-bacteria.txt
cat UC-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > UC-bacteria.txt

cat UC1-bacteria.txt | awk '{total += $7} END {print "UC1 Total:", total, "bp"}' >> gbps-bacteria.txt
cat UC2-bacteria.txt | awk '{total += $7} END {print "UC2 Total:", total, "bp"}' >> gbps-bacteria.txt
cat UC4-bacteria.txt | awk '{total += $7} END {print "UC4 Total:", total, "bp"}' >> gbps-bacteria.txt
cat UC5-bacteria.txt | awk '{total += $7} END {print "UC5 Total:", total, "bp"}' >> gbps-bacteria.txt
cat UC-bacteria.txt | awk '{total += $7} END {print "UC Total:", total, "bp"}' >> gbps-bacteria.txt

cat UG1-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > UG1-bacteria.txt
cat UG2-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > UG2-bacteria.txt
cat UG3-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > UG3-bacteria.txt
cat UG4-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > UG4-bacteria.txt
cat UG-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > UG-bacteria.txt

cat UG1-bacteria.txt | awk '{total += $7} END {print "UG1 Total:", total, "bp"}' >> gbps-bacteria.txt
cat UG2-bacteria.txt | awk '{total += $7} END {print "UG2 Total:", total, "bp"}' >> gbps-bacteria.txt
cat UG3-bacteria.txt | awk '{total += $7} END {print "UG3 Total:", total, "bp"}' >> gbps-bacteria.txt
cat UG4-bacteria.txt | awk '{total += $7} END {print "UG4 Total:", total, "bp"}' >> gbps-bacteria.txt
cat UG-bacteria.txt | awk '{total += $7} END {print "UG Total:", total, "bp"}' >> gbps-bacteria.txt

cat UH1-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > UH1-bacteria.txt
cat UH2-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > UH2-bacteria.txt
cat UH3-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > UH3-bacteria.txt
cat UH4-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > UH4-bacteria.txt
cat UH-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > UH-bacteria.txt

cat UH1-bacteria.txt | awk '{total += $7} END {print "UH1 Total:", total, "bp"}' >> gbps-bacteria.txt
cat UH2-bacteria.txt | awk '{total += $7} END {print "UH2 Total:", total, "bp"}' >> gbps-bacteria.txt
cat UH3-bacteria.txt | awk '{total += $7} END {print "UH3 Total:", total, "bp"}' >> gbps-bacteria.txt
cat UH4-bacteria.txt | awk '{total += $7} END {print "UH4 Total:", total, "bp"}' >> gbps-bacteria.txt
cat UH-bacteria.txt | awk '{total += $7} END {print "UH Total:", total, "bp"}' >> gbps-bacteria.txt


#Run script to filter centrifuge results files - assembled contigs
cat RC2-assembly-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > RC2-assembly-bacteria.txt
cat RC3-assembly-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > RC3-assembly-bacteria.txt
cat RC4-assembly-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > RC4-assembly-bacteria.txt
cat RC5-assembly-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > RC5-assembly-bacteria.txt

cat RC2-assembly-bacteria.txt | awk '{total += $7} END {print "RC2 Total:", total, "bp"}' >> gbps-bacteria-assembly.txt
cat RC3-assembly-bacteria.txt | awk '{total += $7} END {print "RC3 Total:", total, "bp"}' >> gbps-bacteria-assembly.txt
cat RC4-assembly-bacteria.txt | awk '{total += $7} END {print "RC4 Total:", total, "bp"}' >> gbps-bacteria-assembly.txt
cat RC5-assembly-bacteria.txt | awk '{total += $7} END {print "RC5 Total:", total, "bp"}' >> gbps-bacteria-assembly.txt

cat RG2-assembly-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > RG2-assembly-bacteria.txt
cat RG3-assembly-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > RG3-assembly-bacteria.txt
cat RG4-assembly-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > RG4-assembly-bacteria.txt
#cat RG5-assembly-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > RG5-assembly-bacteria.txt

cat RG2-assembly-bacteria.txt | awk '{total += $7} END {print "RG2 Total:", total, "bp"}' >> gbps-bacteria-assembly.txt
cat RG3-assembly-bacteria.txt | awk '{total += $7} END {print "RG3 Total:", total, "bp"}' >> gbps-bacteria-assembly.txt
cat RG4-assembly-bacteria.txt | awk '{total += $7} END {print "RG4 Total:", total, "bp"}' >> gbps-bacteria-assembly.txt
#cat RG5-assembly-bacteria.txt | awk '{total += $7} END {print "RG5 Total:", total, "bp"}' >> gbps-bacteria-assembly.txt

cat RH1-assembly-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > RH1-assembly-bacteria.txt
cat RH2-assembly-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > RH2-assembly-bacteria.txt
cat RH3-assembly-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > RH3-assembly-bacteria.txt
cat RH4-assembly-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > RH4-assembly-bacteria.txt

cat RH1-assembly-bacteria.txt | awk '{total += $7} END {print "RH1 Total:", total, "bp"}' >> gbps-bacteria-assembly.txt
cat RH2-assembly-bacteria.txt | awk '{total += $7} END {print "RH2 Total:", total, "bp"}' >> gbps-bacteria-assembly.txt
cat RH3-assembly-bacteria.txt | awk '{total += $7} END {print "RH3 Total:", total, "bp"}' >> gbps-bacteria-assembly.txt
cat RH4-assembly-bacteria.txt | awk '{total += $7} END {print "RH4 Total:", total, "bp"}' >> gbps-bacteria-assembly.txt

cat UC1-assembly-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > UC1-assembly-bacteria.txt
cat UC2-assembly-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > UC2-assembly-bacteria.txt
cat UC4-assembly-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > UC4-assembly-bacteria.txt
cat UC5-assembly-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > UC5-assembly-bacteria.txt

cat UC1-assembly-bacteria.txt | awk '{total += $7} END {print "UC1 Total:", total, "bp"}' >> gbps-bacteria-assembly.txt
cat UC2-assembly-bacteria.txt | awk '{total += $7} END {print "UC2 Total:", total, "bp"}' >> gbps-bacteria-assembly.txt
cat UC4-assembly-bacteria.txt | awk '{total += $7} END {print "UC4 Total:", total, "bp"}' >> gbps-bacteria-assembly.txt
cat UC5-assembly-bacteria.txt | awk '{total += $7} END {print "UC5 Total:", total, "bp"}' >> gbps-bacteria-assembly.txt

cat UG1-assembly-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > UG1-assembly-bacteria.txt
cat UG2-assembly-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > UG2-assembly-bacteria.txt
cat UG3-assembly-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > UG3-assembly-bacteria.txt
cat UG4-assembly-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > UG4-assembly-bacteria.txt

cat UG1-assembly-bacteria.txt | awk '{total += $7} END {print "UG1 Total:", total, "bp"}' >> gbps-bacteria-assembly.txt
cat UG2-assembly-bacteria.txt | awk '{total += $7} END {print "UG2 Total:", total, "bp"}' >> gbps-bacteria-assembly.txt
cat UG3-assembly-bacteria.txt | awk '{total += $7} END {print "UG3 Total:", total, "bp"}' >> gbps-bacteria-assembly.txt
cat UG4-assembly-bacteria.txt | awk '{total += $7} END {print "UG4 Total:", total, "bp"}' >> gbps-bacteria-assembly.txt

cat UH1-assembly-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > UH1-assembly-bacteria.txt
cat UH2-assembly-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > UH2-assembly-bacteria.txt
cat UH3-assembly-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > UH3-assembly-bacteria.txt
cat UH4-assembly-results.txt | grep -Fv "unclassified" | grep -Fv "plasmid" > UH4-assembly-bacteria.txt

cat UH1-assembly-bacteria.txt | awk '{total += $7} END {print "UH1 Total:", total, "bp"}' >> gbps-bacteria-assembly.txt
cat UH2-assembly-bacteria.txt | awk '{total += $7} END {print "UH2 Total:", total, "bp"}' >> gbps-bacteria-assembly.txt
cat UH3-assembly-bacteria.txt | awk '{total += $7} END {print "UH3 Total:", total, "bp"}' >> gbps-bacteria-assembly.txt
cat UH4-assembly-bacteria.txt | awk '{total += $7} END {print "UH4 Total:", total, "bp"}' >> gbps-bacteria-assembly.txt
