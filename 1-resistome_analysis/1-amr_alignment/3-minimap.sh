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

#Catenate all samples for host
find . -type f -name "rural_chicken*.fastq" -exec cat {} \; > ./rural_chicken.fastq
find . -type f -name "rural_goat*.fastq" -exec cat {} \; > ./rural_goat.fastq
find . -type f -name "rural_human*.fastq" -exec cat {} \; > ./rural_human.fastq
find . -type f -name "urban_chicken*.fastq" -exec cat {} \; > ./urban_chicken.fastq
find . -type f -name "urban_goat*.fastq" -exec cat {} \; > ./urban_goat.fastq
find . -type f -name "urban_human*.fastq" -exec cat {} \; > ./urban_human.fastq

IN25=rural_chicken.fastq
IN26=rural_goat.fastq
IN27=rural_human.fastq
IN28=urban_chicken.fastq
IN29=urban_goat.fastq
IN30=urban_human.fastq

#Assembled input files
IN31=RC2-consensus.fastq
IN32=RC3-consensus.fastq
IN33=RC4-consensus.fastq
IN34=RC5-consensus.fastq
IN35=RG2-consensus.fastq
IN36=RG3-consensus.fastq
IN37=RG4-consensus.fastq
IN38=RG5-consensus.fastq
IN39=RH1-consensus.fastq
IN40=RH2-consensus.fastq
IN41=RH3-consensus.fastq
IN42=RH4-consensus.fastq
IN43=UC1-consensus.fastq
IN44=UC2-consensus.fastq
IN45=UC4-consensus.fastq
IN46=UC5-consensus.fastq
IN47=UG1-consensus.fastq
IN48=UG2-consensus.fastq
IN49=UG3-consensus.fastq
IN50=UG4-consensus.fastq
IN51=UH1-consensus.fastq
IN52=UH2-consensus.fastq
IN53=UH3-consensus.fastq
IN54=UH4-consensus.fastq

OUT1=RC2
OUT2=RC3
OUT3=RC4
OUT4=RC5
OUT5=RG2
OUT6=RG3
OUT7=RG4
OUT8=RG5
OUT9=RH1
OUT10=RH2
OUT11=RH3
OUT12=RH4
OUT13=UC1
OUT14=UC2
OUT15=UC4
OUT16=UC5
OUT17=UG1
OUT18=UG2
OUT19=UG3
OUT20=UG4
OUT21=UH1
OUT22=UH2
OUT23=UH3
OUT24=UH4
OUT25=RC
OUT26=RG
OUT27=RH
OUT28=UC
OUT29=UG
OUT30=UH

RESpaf1=$OUT1-amrresults.paf
RESpaf2=$OUT2-amrresults.paf
RESpaf3=$OUT3-amrresults.paf
RESpaf4=$OUT4-amrresults.paf
RESpaf5=$OUT5-amrresults.paf
RESpaf6=$OUT6-amrresults.paf
RESpaf7=$OUT7-amrresults.paf
RESpaf8=$OUT8-amrresults.paf
RESpaf9=$OUT9-amrresults.paf
RESpaf10=$OUT10-amrresults.paf
RESpaf11=$OUT11-amrresults.paf
RESpaf12=$OUT12-amrresults.paf
RESpaf13=$OUT13-amrresults.paf
RESpaf14=$OUT14-amrresults.paf
RESpaf15=$OUT15-amrresults.paf
RESpaf16=$OUT16-amrresults.paf
RESpaf17=$OUT17-amrresults.paf
RESpaf18=$OUT18-amrresults.paf
RESpaf19=$OUT19-amrresults.paf
RESpaf20=$OUT20-amrresults.paf
RESpaf21=$OUT21-amrresults.paf
RESpaf22=$OUT22-amrresults.paf
RESpaf23=$OUT23-amrresults.paf
RESpaf24=$OUT24-amrresults.paf
RESpaf25=$OUT25-amrresults.paf
RESpaf26=$OUT26-amrresults.paf
RESpaf27=$OUT27-amrresults.paf
RESpaf28=$OUT28-amrresults.paf
RESpaf29=$OUT29-amrresults.paf
RESpaf30=$OUT30-amrresults.paf
RESpaf31=$OUT1-assembly-amrresults.paf
RESpaf32=$OUT2-assembly-amrresults.paf
RESpaf33=$OUT3-assembly-amrresults.paf
RESpaf34=$OUT4-assembly-amrresults.paf
RESpaf35=$OUT5-assembly-amrresults.paf
RESpaf36=$OUT6-assembly-amrresults.paf
RESpaf37=$OUT7-assembly-amrresults.paf
RESpaf38=$OUT8-assembly-amrresults.paf
RESpaf39=$OUT9-assembly-amrresults.paf
RESpaf40=$OUT10-assembly-amrresults.paf
RESpaf41=$OUT11-assembly-amrresults.paf
RESpaf42=$OUT12-assembly-amrresults.paf
RESpaf43=$OUT13-assembly-amrresults.paf
RESpaf44=$OUT14-assembly-amrresults.paf
RESpaf45=$OUT15-assembly-amrresults.paf
RESpaf46=$OUT16-assembly-amrresults.paf
RESpaf47=$OUT17-assembly-amrresults.paf
RESpaf48=$OUT18-assembly-amrresults.paf
RESpaf49=$OUT19-assembly-amrresults.paf
RESpaf50=$OUT20-assembly-amrresults.paf
RESpaf51=$OUT21-assembly-amrresults.paf
RESpaf52=$OUT22-assembly-amrresults.paf
RESpaf53=$OUT23-assembly-amrresults.paf
RESpaf54=$OUT24-assembly-amrresults.paf

#Specify reference database
REF=ResFinder_chars_dedup.fasta

#Run minimap2, base level alignment with secondary
minimap2 -cx map-ont $REF $IN1 > $RESpaf1
minimap2 -cx map-ont $REF $IN2 > $RESpaf2
minimap2 -cx map-ont $REF $IN3 > $RESpaf3
minimap2 -cx map-ont $REF $IN4 > $RESpaf4
minimap2 -cx map-ont $REF $IN5 > $RESpaf5
minimap2 -cx map-ont $REF $IN6 > $RESpaf6
minimap2 -cx map-ont $REF $IN7 > $RESpaf7
minimap2 -cx map-ont $REF $IN8 > $RESpaf8
minimap2 -cx map-ont $REF $IN9 > $RESpaf9
minimap2 -cx map-ont $REF $IN10 > $RESpaf10
minimap2 -cx map-ont $REF $IN11 > $RESpaf11
minimap2 -cx map-ont $REF $IN12 > $RESpaf12
minimap2 -cx map-ont $REF $IN13 > $RESpaf13
minimap2 -cx map-ont $REF $IN14 > $RESpaf14
minimap2 -cx map-ont $REF $IN15 > $RESpaf15
minimap2 -cx map-ont $REF $IN16 > $RESpaf16
minimap2 -cx map-ont $REF $IN17 > $RESpaf17
minimap2 -cx map-ont $REF $IN18 > $RESpaf18
minimap2 -cx map-ont $REF $IN19 > $RESpaf19
minimap2 -cx map-ont $REF $IN20 > $RESpaf20
minimap2 -cx map-ont $REF $IN21 > $RESpaf21
minimap2 -cx map-ont $REF $IN22 > $RESpaf22
minimap2 -cx map-ont $REF $IN23 > $RESpaf23
minimap2 -cx map-ont $REF $IN24 > $RESpaf24
minimap2 -cx map-ont $REF $IN25 > $RESpaf25
minimap2 -cx map-ont $REF $IN26 > $RESpaf26
minimap2 -cx map-ont $REF $IN27 > $RESpaf27
minimap2 -cx map-ont $REF $IN28 > $RESpaf28
minimap2 -cx map-ont $REF $IN29 > $RESpaf29
minimap2 -cx map-ont $REF $IN30 > $RESpaf30
minimap2 -cx map-ont $REF $IN31 > $RESpaf31
minimap2 -cx map-ont $REF $IN32 > $RESpaf32
minimap2 -cx map-ont $REF $IN33 > $RESpaf33
minimap2 -cx map-ont $REF $IN34 > $RESpaf34
minimap2 -cx map-ont $REF $IN35 > $RESpaf35
minimap2 -cx map-ont $REF $IN36 > $RESpaf36
minimap2 -cx map-ont $REF $IN37 > $RESpaf37
minimap2 -cx map-ont $REF $IN38 > $RESpaf38
minimap2 -cx map-ont $REF $IN39 > $RESpaf39
minimap2 -cx map-ont $REF $IN40 > $RESpaf40
minimap2 -cx map-ont $REF $IN41 > $RESpaf41
minimap2 -cx map-ont $REF $IN42 > $RESpaf42
minimap2 -cx map-ont $REF $IN43 > $RESpaf43
minimap2 -cx map-ont $REF $IN44 > $RESpaf44
minimap2 -cx map-ont $REF $IN45 > $RESpaf45
minimap2 -cx map-ont $REF $IN46 > $RESpaf46
minimap2 -cx map-ont $REF $IN47 > $RESpaf47
minimap2 -cx map-ont $REF $IN48 > $RESpaf48
minimap2 -cx map-ont $REF $IN49 > $RESpaf49
minimap2 -cx map-ont $REF $IN50 > $RESpaf50
minimap2 -cx map-ont $REF $IN51 > $RESpaf51
minimap2 -cx map-ont $REF $IN52 > $RESpaf52
minimap2 -cx map-ont $REF $IN53 > $RESpaf53
minimap2 -cx map-ont $REF $IN54 > $RESpaf54

#Output primary alignments only
awk '($17~"tp:A:P") {print $0}' $RESpaf1 > $OUT1-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf2 > $OUT2-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf3 > $OUT3-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf4 > $OUT4-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf5 > $OUT5-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf6 > $OUT6-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf7 > $OUT7-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf8 > $OUT8-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf9 > $OUT9-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf10 > $OUT10-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf11 > $OUT11-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf12 > $OUT12-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf13 > $OUT13-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf14 > $OUT14-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf15 > $OUT15-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf16 > $OUT16-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf17 > $OUT17-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf18 > $OUT18-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf19 > $OUT19-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf20 > $OUT20-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf21 > $OUT21-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf22 > $OUT22-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf23 > $OUT23-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf24 > $OUT24-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf25 > $OUT25-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf26 > $OUT26-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf27 > $OUT27-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf28 > $OUT28-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf29 > $OUT29-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf30 > $OUT30-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf31 > $OUT1-assembly-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf32 > $OUT2-assembly-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf33 > $OUT3-assembly-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf34 > $OUT4-assembly-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf35 > $OUT5-assembly-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf36 > $OUT6-assembly-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf37 > $OUT7-assembly-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf38 > $OUT8-assembly-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf39 > $OUT9-assembly-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf40 > $OUT10-assembly-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf41 > $OUT11-assembly-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf42 > $OUT12-assembly-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf43 > $OUT13-assembly-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf44 > $OUT14-assembly-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf45 > $OUT15-assembly-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf46 > $OUT16-assembly-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf47 > $OUT17-assembly-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf48 > $OUT18-assembly-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf49 > $OUT19-assembly-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf50 > $OUT20-assembly-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf51 > $OUT21-assembly-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf52 > $OUT22-assembly-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf53 > $OUT23-assembly-prim-amrresults.paf
awk '($17~"tp:A:P") {print $0}' $RESpaf54 > $OUT24-assembly-prim-amrresults.paf
