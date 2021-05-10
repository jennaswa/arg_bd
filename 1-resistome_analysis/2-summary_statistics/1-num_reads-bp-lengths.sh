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

#Assembled input files
IN25=RC2-consensus.fasta
IN26=RC3-consensus.fasta
IN27=RC4-consensus.fasta
IN28=RC5-consensus.fasta
IN29=RG2-consensus.fasta
IN30=RG3-consensus.fasta
IN31=RG4-consensus.fasta
IN32=RG5-consensus.fasta
IN32=RH1-consensus.fasta
IN34=RH2-consensus.fasta
IN35=RH3-consensus.fasta
IN36=RH4-consensus.fasta
IN37=UC1-consensus.fasta
IN38=UC2-consensus.fasta
IN39=UC4-consensus.fasta
IN40=UC5-consensus.fasta
IN41=UG1-consensus.fasta
IN42=UG2-consensus.fasta
IN43=UG3-consensus.fasta
IN44=UG4-consensus.fasta
IN45=UH1-consensus.fasta
IN46=UH2-consensus.fasta
IN47=UH3-consensus.fasta
IN48=UH4-consensus.fasta

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

#Catenate all samples for host
find . -type f -name "rural_chicken*.fastq" -exec cat {} \; > ./rural_chicken.fastq
find . -type f -name "rural_goat*.fastq" -exec cat {} \; > ./rural_goat.fastq
find . -type f -name "rural_human*.fastq" -exec cat {} \; > ./rural_human.fastq
find . -type f -name "urban_chicken*.fastq" -exec cat {} \; > ./urban_chicken.fastq
find . -type f -name "urban_goat*.fastq" -exec cat {} \; > ./urban_goat.fastq
find . -type f -name "urban_human*.fastq" -exec cat {} \; > ./urban_human.fastq
find . -type f -name "R*C*consensus.fasta" -exec cat {} \; > ./RC-consensus.fasta
find . -type f -name "R*G*consensus.fasta" -exec cat {} \; > ./RG-consensus.fasta
find . -type f -name "R*H*consensus.fasta" -exec cat {} \; > ./RH-consensus.fasta
find . -type f -name "U*C*consensus.fasta" -exec cat {} \; > ./UC-consensus.fasta
find . -type f -name "U*G*consensus.fasta" -exec cat {} \; > ./UG-consensus.fasta
find . -type f -name "U*H*consensus.fasta" -exec cat {} \; > ./UH-consensus.fasta

#Count number of reads in fastq files
cat $IN1 | echo $((`wc -l`/4)) > $SAMP1-number_reads.txt
cat $IN2 | echo $((`wc -l`/4)) > $SAMP2-number_reads.txt
cat $IN3 | echo $((`wc -l`/4)) > $SAMP3-number_reads.txt
cat $IN4 | echo $((`wc -l`/4)) > $SAMP4-number_reads.txt
cat $IN5 | echo $((`wc -l`/4)) > $SAMP5-number_reads.txt
cat $IN6 | echo $((`wc -l`/4)) > $SAMP6-number_reads.txt
cat $IN7 | echo $((`wc -l`/4)) > $SAMP7-number_reads.txt
cat $IN8 | echo $((`wc -l`/4)) > $SAMP8-number_reads.txt
cat $IN9 | echo $((`wc -l`/4)) > $SAMP9-number_reads.txt
cat $IN10 | echo $((`wc -l`/4)) > $SAMP10-number_reads.txt
cat $IN11 | echo $((`wc -l`/4)) > $SAMP11-number_reads.txt
cat $IN12 | echo $((`wc -l`/4)) > $SAMP12-number_reads.txt
cat $IN13 | echo $((`wc -l`/4)) > $SAMP13-number_reads.txt
cat $IN14 | echo $((`wc -l`/4)) > $SAMP14-number_reads.txt
cat $IN15 | echo $((`wc -l`/4)) > $SAMP15-number_reads.txt
cat $IN16 | echo $((`wc -l`/4)) > $SAMP16-number_reads.txt
cat $IN17 | echo $((`wc -l`/4)) > $SAMP17-number_reads.txt
cat $IN18 | echo $((`wc -l`/4)) > $SAMP18-number_reads.txt
cat $IN19 | echo $((`wc -l`/4)) > $SAMP19-number_reads.txt
cat $IN20 | echo $((`wc -l`/4)) > $SAMP20-number_reads.txt
cat $IN21 | echo $((`wc -l`/4)) > $SAMP21-number_reads.txt
cat $IN22 | echo $((`wc -l`/4)) > $SAMP22-number_reads.txt
cat $IN23 | echo $((`wc -l`/4)) > $SAMP23-number_reads.txt
cat $IN24 | echo $((`wc -l`/4)) > $SAMP24-number_reads.txt

cat rural_chicken.fastq | echo $((`wc -l`/4)) > rural_chicken-number_reads.txt
cat rural_goat.fastq | echo $((`wc -l`/4)) > rural_goat-number_reads.txt
cat rural_human.fastq | echo $((`wc -l`/4)) > rural_human-number_reads.txt
cat urban_chicken.fastq | echo $((`wc -l`/4)) > urban_chicken-number_reads.txt
cat urban_goat.fastq | echo $((`wc -l`/4)) > urban_goat-number_reads.txt
cat urban_human.fastq | echo $((`wc -l`/4)) > urban_human-number_reads.txt

#Count base pairs in fastq files
cat $IN1 | paste - - - - | cut -f 2 | tr -d '\n' | wc -c > $SAMP1-number_base_pairs.txt
cat $IN2 | paste - - - - | cut -f 2 | tr -d '\n' | wc -c > $SAMP2-number_base_pairs.txt
cat $IN3 | paste - - - - | cut -f 2 | tr -d '\n' | wc -c > $SAMP3-number_base_pairs.txt
cat $IN4 | paste - - - - | cut -f 2 | tr -d '\n' | wc -c > $SAMP4-number_base_pairs.txt
cat $IN5 | paste - - - - | cut -f 2 | tr -d '\n' | wc -c > $SAMP5-number_base_pairs.txt
cat $IN6 | paste - - - - | cut -f 2 | tr -d '\n' | wc -c > $SAMP6-number_base_pairs.txt
cat $IN7 | paste - - - - | cut -f 2 | tr -d '\n' | wc -c > $SAMP7-number_base_pairs.txt
cat $IN8 | paste - - - - | cut -f 2 | tr -d '\n' | wc -c > $SAMP8-number_base_pairs.txt
cat $IN9 | paste - - - - | cut -f 2 | tr -d '\n' | wc -c > $SAMP9-number_base_pairs.txt
cat $IN10 | paste - - - - | cut -f 2 | tr -d '\n' | wc -c > $SAMP10-number_base_pairs.txt
cat $IN11 | paste - - - - | cut -f 2 | tr -d '\n' | wc -c > $SAMP11-number_base_pairs.txt
cat $IN12 | paste - - - - | cut -f 2 | tr -d '\n' | wc -c > $SAMP12-number_base_pairs.txt
cat $IN13 | paste - - - - | cut -f 2 | tr -d '\n' | wc -c > $SAMP13-number_base_pairs.txt
cat $IN14 | paste - - - - | cut -f 2 | tr -d '\n' | wc -c > $SAMP14-number_base_pairs.txt
cat $IN15 | paste - - - - | cut -f 2 | tr -d '\n' | wc -c > $SAMP15-number_base_pairs.txt
cat $IN16 | paste - - - - | cut -f 2 | tr -d '\n' | wc -c > $SAMP16-number_base_pairs.txt
cat $IN17 | paste - - - - | cut -f 2 | tr -d '\n' | wc -c > $SAMP17-number_base_pairs.txt
cat $IN18 | paste - - - - | cut -f 2 | tr -d '\n' | wc -c > $SAMP18-number_base_pairs.txt
cat $IN19 | paste - - - - | cut -f 2 | tr -d '\n' | wc -c > $SAMP19-number_base_pairs.txt
cat $IN20 | paste - - - - | cut -f 2 | tr -d '\n' | wc -c > $SAMP20-number_base_pairs.txt
cat $IN21 | paste - - - - | cut -f 2 | tr -d '\n' | wc -c > $SAMP21-number_base_pairs.txt
cat $IN22 | paste - - - - | cut -f 2 | tr -d '\n' | wc -c > $SAMP22-number_base_pairs.txt
cat $IN23 | paste - - - - | cut -f 2 | tr -d '\n' | wc -c > $SAMP23-number_base_pairs.txt
cat $IN24 | paste - - - - | cut -f 2 | tr -d '\n' | wc -c > $SAMP24-number_base_pairs.txt

cat rural_chicken.fastq | paste - - - - | cut -f 2 | tr -d '\n' | wc -c > rural_chicken-number_base_pairs.txt
cat rural_goat.fastq | paste - - - - | cut -f 2 | tr -d '\n' | wc -c > rural_goat-number_base_pairs.txt
cat rural_human.fastq | paste - - - - | cut -f 2 | tr -d '\n' | wc -c > rural_human-number_base_pairs.txt
cat urban_chicken.fastq | paste - - - - | cut -f 2 | tr -d '\n' | wc -c > urban_chicken-number_base_pairs.txt
cat urban_goat.fastq | paste - - - - | cut -f 2 | tr -d '\n' | wc -c > urban_goat-number_base_pairs.txt
cat urban_human.fastq | paste - - - - | cut -f 2 | tr -d '\n' | wc -c > urban_human-number_base_pairs.txt

#Get fastq read length distribution
cat $IN1 | awk '{if(NR%4==2) print length($1)}' | sort | uniq -c > $SAMP1-read_lengths.txt
cat $IN2 | awk '{if(NR%4==2) print length($1)}' | sort | uniq -c > $SAMP2-read_lengths.txt
cat $IN3 | awk '{if(NR%4==2) print length($1)}' | sort | uniq -c > $SAMP3-read_lengths.txt
cat $IN4 | awk '{if(NR%4==2) print length($1)}' | sort | uniq -c > $SAMP4-read_lengths.txt
cat $IN5 | awk '{if(NR%4==2) print length($1)}' | sort | uniq -c > $SAMP5-read_lengths.txt
cat $IN6 | awk '{if(NR%4==2) print length($1)}' | sort | uniq -c > $SAMP6-read_lengths.txt
cat $IN7 | awk '{if(NR%4==2) print length($1)}' | sort | uniq -c > $SAMP7-read_lengths.txt
cat $IN8 | awk '{if(NR%4==2) print length($1)}' | sort | uniq -c > $SAMP8-read_lengths.txt
cat $IN9 | awk '{if(NR%4==2) print length($1)}' | sort | uniq -c > $SAMP9-read_lengths.txt
cat $IN10 | awk '{if(NR%4==2) print length($1)}' | sort | uniq -c > $SAMP10-read_lengths.txt
cat $IN11 | awk '{if(NR%4==2) print length($1)}' | sort | uniq -c > $SAMP11-read_lengths.txt
cat $IN12 | awk '{if(NR%4==2) print length($1)}' | sort | uniq -c > $SAMP12-read_lengths.txt
cat $IN13 | awk '{if(NR%4==2) print length($1)}' | sort | uniq -c > $SAMP13-read_lengths.txt
cat $IN14 | awk '{if(NR%4==2) print length($1)}' | sort | uniq -c > $SAMP14-read_lengths.txt
cat $IN15 | awk '{if(NR%4==2) print length($1)}' | sort | uniq -c > $SAMP15-read_lengths.txt
cat $IN16 | awk '{if(NR%4==2) print length($1)}' | sort | uniq -c > $SAMP16-read_lengths.txt
cat $IN17 | awk '{if(NR%4==2) print length($1)}' | sort | uniq -c > $SAMP17-read_lengths.txt
cat $IN18 | awk '{if(NR%4==2) print length($1)}' | sort | uniq -c > $SAMP18-read_lengths.txt
cat $IN19 | awk '{if(NR%4==2) print length($1)}' | sort | uniq -c > $SAMP19-read_lengths.txt
cat $IN20 | awk '{if(NR%4==2) print length($1)}' | sort | uniq -c > $SAMP20-read_lengths.txt
cat $IN21 | awk '{if(NR%4==2) print length($1)}' | sort | uniq -c > $SAMP21-read_lengths.txt
cat $IN22 | awk '{if(NR%4==2) print length($1)}' | sort | uniq -c > $SAMP22-read_lengths.txt
cat $IN23 | awk '{if(NR%4==2) print length($1)}' | sort | uniq -c > $SAMP23-read_lengths.txt
cat $IN24 | awk '{if(NR%4==2) print length($1)}' | sort | uniq -c > $SAMP24-read_lengths.txt

cat rural_chicken.fastq | awk '{if(NR%4==2) print length($1)}' | sort | uniq -c > rural_chicken-read_lengths.txt
cat rural_goat.fastq | awk '{if(NR%4==2) print length($1)}' | sort | uniq -c > rural_goat-read_lengths.txt
cat rural_human.fastq | awk '{if(NR%4==2) print length($1)}' | sort | uniq -c > rural_human-read_lengths.txt
cat urban_chicken.fastq | awk '{if(NR%4==2) print length($1)}' | sort | uniq -c > urban_chicken-read_lengths.txt
cat urban_goat.fastq | awk '{if(NR%4==2) print length($1)}' | sort | uniq -c > urban_goat-read_lengths.txt
cat urban_human.fastq | awk '{if(NR%4==2) print length($1)}' | sort | uniq -c > urban_human-read_lengths.txt

#Count number of reads in fasta files
cat $IN25 | echo $((`wc -l`/2)) > $SAMP1-number_reads.txt
cat $IN26 | echo $((`wc -l`/2)) > $SAMP2-number_reads.txt
cat $IN27 | echo $((`wc -l`/2)) > $SAMP3-number_reads.txt
cat $IN28 | echo $((`wc -l`/2)) > $SAMP4-number_reads.txt
cat $IN29 | echo $((`wc -l`/2)) > $SAMP5-number_reads.txt
cat $IN30 | echo $((`wc -l`/2)) > $SAMP6-number_reads.txt
cat $IN31 | echo $((`wc -l`/2)) > $SAMP7-number_reads.txt
cat $IN32 | echo $((`wc -l`/2)) > $SAMP8-number_reads.txt
cat $IN33 | echo $((`wc -l`/2)) > $SAMP9-number_reads.txt
cat $IN34 | echo $((`wc -l`/2)) > $SAMP10-number_reads.txt
cat $IN35 | echo $((`wc -l`/2)) > $SAMP11-number_reads.txt
cat $IN36 | echo $((`wc -l`/2)) > $SAMP12-number_reads.txt
cat $IN37 | echo $((`wc -l`/2)) > $SAMP13-number_reads.txt
cat $IN38 | echo $((`wc -l`/2)) > $SAMP14-number_reads.txt
cat $IN39 | echo $((`wc -l`/2)) > $SAMP15-number_reads.txt
cat $IN40 | echo $((`wc -l`/2)) > $SAMP16-number_reads.txt
cat $IN41 | echo $((`wc -l`/2)) > $SAMP17-number_reads.txt
cat $IN42 | echo $((`wc -l`/2)) > $SAMP18-number_reads.txt
cat $IN43 | echo $((`wc -l`/2)) > $SAMP19-number_reads.txt
cat $IN44 | echo $((`wc -l`/2)) > $SAMP20-number_reads.txt
cat $IN45 | echo $((`wc -l`/2)) > $SAMP21-number_reads.txt
cat $IN46 | echo $((`wc -l`/2)) > $SAMP22-number_reads.txt
cat $IN47 | echo $((`wc -l`/2)) > $SAMP23-number_reads.txt
cat $IN48 | echo $((`wc -l`/2)) > $SAMP24-number_reads.txt

cat RC-consensus.fasta | echo $((`wc -l`/2)) > RC-consensus-number_reads.txt
cat RG-consensus.fasta | echo $((`wc -l`/2)) > RG-consensus-number_reads.txt
cat RH-consensus.fasta | echo $((`wc -l`/2)) > RH-consensus-number_reads.txt
cat UC-consensus.fasta | echo $((`wc -l`/2)) > UC-consensus-number_reads.txt
cat UG-consensus.fasta | echo $((`wc -l`/2)) > UG-consensus-number_reads.txt
cat UH-consensus.fasta | echo $((`wc -l`/2)) > UH-consensus-number_reads.txt

#Count base pairs in fasta files
cat $IN25 | grep -v ">" | wc | awk '{print $3-$1}' > $SAMP1-number_base_pairs.txt
cat $IN26 | grep -v ">" | wc | awk '{print $3-$1}' > $SAMP2-number_base_pairs.txt
cat $IN27 | grep -v ">" | wc | awk '{print $3-$1}' > $SAMP3-number_base_pairs.txt
cat $IN28 | grep -v ">" | wc | awk '{print $3-$1}' > $SAMP4-number_base_pairs.txt
cat $IN29 | grep -v ">" | wc | awk '{print $3-$1}' > $SAMP5-number_base_pairs.txt
cat $IN30 | grep -v ">" | wc | awk '{print $3-$1}' > $SAMP6-number_base_pairs.txt
cat $IN31 | grep -v ">" | wc | awk '{print $3-$1}' > $SAMP7-number_base_pairs.txt
cat $IN32 | grep -v ">" | wc | awk '{print $3-$1}' > $SAMP8-number_base_pairs.txt
cat $IN33 | grep -v ">" | wc | awk '{print $3-$1}' > $SAMP9-number_base_pairs.txt
cat $IN34 | grep -v ">" | wc | awk '{print $3-$1}' > $SAMP10-number_base_pairs.txt
cat $IN35 | grep -v ">" | wc | awk '{print $3-$1}' > $SAMP11-number_base_pairs.txt
cat $IN36 | grep -v ">" | wc | awk '{print $3-$1}' > $SAMP12-number_base_pairs.txt
cat $IN37 | grep -v ">" | wc | awk '{print $3-$1}' > $SAMP13-number_base_pairs.txt
cat $IN38 | grep -v ">" | wc | awk '{print $3-$1}' > $SAMP14-number_base_pairs.txt
cat $IN39 | grep -v ">" | wc | awk '{print $3-$1}' > $SAMP15-number_base_pairs.txt
cat $IN40 | grep -v ">" | wc | awk '{print $3-$1}' > $SAMP16-number_base_pairs.txt
cat $IN41 | grep -v ">" | wc | awk '{print $3-$1}' > $SAMP17-number_base_pairs.txt
cat $IN42 | grep -v ">" | wc | awk '{print $3-$1}' > $SAMP18-number_base_pairs.txt
cat $IN43 | grep -v ">" | wc | awk '{print $3-$1}' > $SAMP19-number_base_pairs.txt
cat $IN44 | grep -v ">" | wc | awk '{print $3-$1}' > $SAMP20-number_base_pairs.txt
cat $IN45 | grep -v ">" | wc | awk '{print $3-$1}' > $SAMP21-number_base_pairs.txt
cat $IN46 | grep -v ">" | wc | awk '{print $3-$1}' > $SAMP22-number_base_pairs.txt
cat $IN47 | grep -v ">" | wc | awk '{print $3-$1}' > $SAMP23-number_base_pairs.txt
cat $IN48 | grep -v ">" | wc | awk '{print $3-$1}' > $SAMP24-number_base_pairs.txt

cat RC-consensus.fasta | grep -v ">" | wc | awk '{print $3-$1}' > RC-consensus-number_base_pairs.txt
cat RG-consensus.fasta | grep -v ">" | wc | awk '{print $3-$1}' > RG-consensus-number_base_pairs.txt
cat RH-consensus.fasta | grep -v ">" | wc | awk '{print $3-$1}' > RH-consensus-number_base_pairs.txt
cat UC-consensus.fasta | grep -v ">" | wc | awk '{print $3-$1}' > UC-consensus-number_base_pairs.txt
cat UG-consensus.fasta | grep -v ">" | wc | awk '{print $3-$1}' > UG-consensus-number_base_pairs.txt
cat UH-consensus.fasta | grep -v ">" | wc | awk '{print $3-$1}' > UH-consensus-number_base_pairs.txt

#Get fasta read length distribution
cat $IN25 | awk '$0 ~ ">" {if (NR>1) {print c;} c=0} $0 !~ ">" {c+=length($0);} END { print c; }' | sed '/^$/d' | sort | uniq -c | awk '{print $1,$2}' > $SAMP1-read_lengths.txt
cat $IN26 | awk '$0 ~ ">" {if (NR>1) {print c;} c=0} $0 !~ ">" {c+=length($0);} END { print c; }' | sed '/^$/d' | sort | uniq -c | awk '{print $1,$2}' > $SAMP2-read_lengths.txt
cat $IN27 | awk '$0 ~ ">" {if (NR>1) {print c;} c=0} $0 !~ ">" {c+=length($0);} END { print c; }' | sed '/^$/d' | sort | uniq -c | awk '{print $1,$2}' > $SAMP3-read_lengths.txt
cat $IN28 | awk '$0 ~ ">" {if (NR>1) {print c;} c=0} $0 !~ ">" {c+=length($0);} END { print c; }' | sed '/^$/d' | sort | uniq -c | awk '{print $1,$2}' > $SAMP4-read_lengths.txt
cat $IN29 | awk '$0 ~ ">" {if (NR>1) {print c;} c=0} $0 !~ ">" {c+=length($0);} END { print c; }' | sed '/^$/d' | sort | uniq -c | awk '{print $1,$2}' > $SAMP5-read_lengths.txt
cat $IN30 | awk '$0 ~ ">" {if (NR>1) {print c;} c=0} $0 !~ ">" {c+=length($0);} END { print c; }' | sed '/^$/d' | sort | uniq -c | awk '{print $1,$2}' > $SAMP6-read_lengths.txt
cat $IN31 | awk '$0 ~ ">" {if (NR>1) {print c;} c=0} $0 !~ ">" {c+=length($0);} END { print c; }' | sed '/^$/d' | sort | uniq -c | awk '{print $1,$2}' > $SAMP7-read_lengths.txt
cat $IN32 | awk '$0 ~ ">" {if (NR>1) {print c;} c=0} $0 !~ ">" {c+=length($0);} END { print c; }' | sed '/^$/d' | sort | uniq -c | awk '{print $1,$2}' > $SAMP8-read_lengths.txt
cat $IN33 | awk '$0 ~ ">" {if (NR>1) {print c;} c=0} $0 !~ ">" {c+=length($0);} END { print c; }' | sed '/^$/d' | sort | uniq -c | awk '{print $1,$2}' > $SAMP9-read_lengths.txt
cat $IN34 | awk '$0 ~ ">" {if (NR>1) {print c;} c=0} $0 !~ ">" {c+=length($0);} END { print c; }' | sed '/^$/d' | sort | uniq -c | awk '{print $1,$2}' > $SAMP10-read_lengths.txt
cat $IN35 | awk '$0 ~ ">" {if (NR>1) {print c;} c=0} $0 !~ ">" {c+=length($0);} END { print c; }' | sed '/^$/d' | sort | uniq -c | awk '{print $1,$2}' > $SAMP11-read_lengths.txt
cat $IN36 | awk '$0 ~ ">" {if (NR>1) {print c;} c=0} $0 !~ ">" {c+=length($0);} END { print c; }' | sed '/^$/d' | sort | uniq -c | awk '{print $1,$2}' > $SAMP12-read_lengths.txt
cat $IN37 | awk '$0 ~ ">" {if (NR>1) {print c;} c=0} $0 !~ ">" {c+=length($0);} END { print c; }' | sed '/^$/d' | sort | uniq -c | awk '{print $1,$2}' > $SAMP13-read_lengths.txt
cat $IN38 | awk '$0 ~ ">" {if (NR>1) {print c;} c=0} $0 !~ ">" {c+=length($0);} END { print c; }' | sed '/^$/d' | sort | uniq -c | awk '{print $1,$2}' > $SAMP14-read_lengths.txt
cat $IN39 | awk '$0 ~ ">" {if (NR>1) {print c;} c=0} $0 !~ ">" {c+=length($0);} END { print c; }' | sed '/^$/d' | sort | uniq -c | awk '{print $1,$2}' > $SAMP15-read_lengths.txt
cat $IN40 | awk '$0 ~ ">" {if (NR>1) {print c;} c=0} $0 !~ ">" {c+=length($0);} END { print c; }' | sed '/^$/d' | sort | uniq -c | awk '{print $1,$2}' > $SAMP16-read_lengths.txt
cat $IN41 | awk '$0 ~ ">" {if (NR>1) {print c;} c=0} $0 !~ ">" {c+=length($0);} END { print c; }' | sed '/^$/d' | sort | uniq -c | awk '{print $1,$2}' > $SAMP17-read_lengths.txt
cat $IN42 | awk '$0 ~ ">" {if (NR>1) {print c;} c=0} $0 !~ ">" {c+=length($0);} END { print c; }' | sed '/^$/d' | sort | uniq -c | awk '{print $1,$2}' > $SAMP18-read_lengths.txt
cat $IN43 | awk '$0 ~ ">" {if (NR>1) {print c;} c=0} $0 !~ ">" {c+=length($0);} END { print c; }' | sed '/^$/d' | sort | uniq -c | awk '{print $1,$2}' > $SAMP19-read_lengths.txt
cat $IN44 | awk '$0 ~ ">" {if (NR>1) {print c;} c=0} $0 !~ ">" {c+=length($0);} END { print c; }' | sed '/^$/d' | sort | uniq -c | awk '{print $1,$2}' > $SAMP20-read_lengths.txt
cat $IN45 | awk '$0 ~ ">" {if (NR>1) {print c;} c=0} $0 !~ ">" {c+=length($0);} END { print c; }' | sed '/^$/d' | sort | uniq -c | awk '{print $1,$2}' > $SAMP21-read_lengths.txt
cat $IN46 | awk '$0 ~ ">" {if (NR>1) {print c;} c=0} $0 !~ ">" {c+=length($0);} END { print c; }' | sed '/^$/d' | sort | uniq -c | awk '{print $1,$2}' > $SAMP22-read_lengths.txt
cat $IN47 | awk '$0 ~ ">" {if (NR>1) {print c;} c=0} $0 !~ ">" {c+=length($0);} END { print c; }' | sed '/^$/d' | sort | uniq -c | awk '{print $1,$2}' > $SAMP23-read_lengths.txt
cat $IN48 | awk '$0 ~ ">" {if (NR>1) {print c;} c=0} $0 !~ ">" {c+=length($0);} END { print c; }' | sed '/^$/d' | sort | uniq -c | awk '{print $1,$2}' > $SAMP24-read_lengths.txt

cat RC-consensus.fasta | awk '$0 ~ ">" {if (NR>1) {print c;} c=0} $0 !~ ">" {c+=length($0);} END { print c; }' | sed '/^$/d' | sort | uniq -c | awk '{print $1,$2}' > RC-consensus-read_lengths.txt
cat RG-consensus.fasta | awk '$0 ~ ">" {if (NR>1) {print c;} c=0} $0 !~ ">" {c+=length($0);} END { print c; }' | sed '/^$/d' | sort | uniq -c | awk '{print $1,$2}' > RG-consensus-read_lengths.txt
cat RH-consensus.fasta | awk '$0 ~ ">" {if (NR>1) {print c;} c=0} $0 !~ ">" {c+=length($0);} END { print c; }' | sed '/^$/d' | sort | uniq -c | awk '{print $1,$2}' > RH-consensus-read_lengths.txt
cat UC-consensus.fasta | awk '$0 ~ ">" {if (NR>1) {print c;} c=0} $0 !~ ">" {c+=length($0);} END { print c; }' | sed '/^$/d' | sort | uniq -c | awk '{print $1,$2}' > UC-consensus-read_lengths.txt
cat UG-consensus.fasta | awk '$0 ~ ">" {if (NR>1) {print c;} c=0} $0 !~ ">" {c+=length($0);} END { print c; }' | sed '/^$/d' | sort | uniq -c | awk '{print $1,$2}' > UG-consensus-read_lengths.txt
cat UH-consensus.fasta | awk '$0 ~ ">" {if (NR>1) {print c;} c=0} $0 !~ ">" {c+=length($0);} END { print c; }' | sed '/^$/d' | sort | uniq -c | awk '{print $1,$2}' > UH-consensus-read_lengths.txt
