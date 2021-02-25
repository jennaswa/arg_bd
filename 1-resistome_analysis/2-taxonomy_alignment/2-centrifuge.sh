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

SUMMARY1=$OUT1-report.txt
RESULTS1=$OUT1-results.txt
SUMMARY2=$OUT2-report.txt
RESULTS2=$OUT2-results.txt
SUMMARY3=$OUT3-report.txt
RESULTS3=$OUT3-results.txt
SUMMARY4=$OUT4-report.txt
RESULTS4=$OUT4-results.txt
SUMMARY5=$OUT5-report.txt
RESULTS5=$OUT5-results.txt
SUMMARY6=$OUT6-report.txt
RESULTS6=$OUT6-results.txt
SUMMARY7=$OUT7-report.txt
RESULTS7=$OUT7-results.txt
SUMMARY8=$OUT8-report.txt
RESULTS8=$OUT8-results.txt
SUMMARY9=$OUT9-report.txt
RESULTS9=$OUT9-results.txt
SUMMARY10=$OUT10-report.txt
RESULTS10=$OUT10-results.txt
SUMMARY11=$OUT11-report.txt
RESULTS11=$OUT11-results.txt
SUMMARY12=$OUT12-report.txt
RESULTS12=$OUT12-results.txt
SUMMARY13=$OUT13-report.txt
RESULTS13=$OUT13-results.txt
SUMMARY14=$OUT14-report.txt
RESULTS14=$OUT14-results.txt
SUMMARY15=$OUT15-report.txt
RESULTS15=$OUT15-results.txt
SUMMARY16=$OUT16-report.txt
RESULTS16=$OUT16-results.txt
SUMMARY17=$OUT17-report.txt
RESULTS17=$OUT17-results.txt
SUMMARY18=$OUT18-report.txt
RESULTS18=$OUT18-results.txt
SUMMARY19=$OUT19-report.txt
RESULTS19=$OUT19-results.txt
SUMMARY20=$OUT20-report.txt
RESULTS20=$OUT20-results.txt
SUMMARY21=$OUT21-report.txt
RESULTS21=$OUT21-results.txt
SUMMARY22=$OUT22-report.txt
RESULTS22=$OUT22-results.txt
SUMMARY23=$OUT23-report.txt
RESULTS23=$OUT23-results.txt
SUMMARY24=$OUT24-report.txt
RESULTS24=$OUT24-results.txt
SUMMARY25=$OUT25-report.txt
RESULTS25=$OUT25-results.txt
SUMMARY26=$OUT26-report.txt
RESULTS26=$OUT26-results.txt
SUMMARY27=$OUT27-report.txt
RESULTS27=$OUT27-results.txt
SUMMARY28=$OUT28-report.txt
RESULTS28=$OUT28-results.txt
SUMMARY29=$OUT29-report.txt
RESULTS29=$OUT29-results.txt
SUMMARY30=$OUT30-report.txt
RESULTS30=$OUT30-results.txt
SUMMARY31=$OUT1-assembly-report.txt
RESULTS31=$OUT1-assembly-results.txt
SUMMARY32=$OUT2-assembly-report.txt
RESULTS32=$OUT2-assembly-results.txt
SUMMARY33=$OUT3-assembly-report.txt
RESULTS33=$OUT3-assembly-results.txt
SUMMARY34=$OUT4-assembly-report.txt
RESULTS34=$OUT4-assembly-results.txt
SUMMARY35=$OUT5-assembly-report.txt
RESULTS35=$OUT5-assembly-results.txt
SUMMARY36=$OUT6-assembly-report.txt
RESULTS36=$OUT6-assembly-results.txt
SUMMARY37=$OUT7-assembly-report.txt
RESULTS37=$OUT7-assembly-results.txt
SUMMARY38=$OUT8-assembly-report.txt
RESULTS38=$OUT8-assembly-results.txt
SUMMARY39=$OUT9-assembly-report.txt
RESULTS39=$OUT9-assembly-results.txt
SUMMARY40=$OUT10-assembly-report.txt
RESULTS40=$OUT10-assembly-results.txt
SUMMARY41=$OUT11-assembly-report.txt
RESULTS41=$OUT11-assembly-results.txt
SUMMARY42=$OUT12-assembly-report.txt
RESULTS42=$OUT12-assembly-results.txt
SUMMARY43=$OUT13-assembly-report.txt
RESULTS43=$OUT13-assembly-results.txt
SUMMARY44=$OUT14-assembly-report.txt
RESULTS44=$OUT14-assembly-results.txt
SUMMARY45=$OUT15-assembly-report.txt
RESULTS45=$OUT15-assembly-results.txt
SUMMARY46=$OUT16-assembly-report.txt
RESULTS46=$OUT16-assembly-results.txt
SUMMARY47=$OUT17-assembly-report.txt
RESULTS47=$OUT17-assembly-results.txt
SUMMARY48=$OUT18-assembly-report.txt
RESULTS48=$OUT18-assembly-results.txt
SUMMARY49=$OUT19-assembly-report.txt
RESULTS49=$OUT19-assembly-results.txt
SUMMARY50=$OUT20-assembly-report.txt
RESULTS50=$OUT20-assembly-results.txt
SUMMARY51=$OUT21-assembly-report.txt
RESULTS51=$OUT21-assembly-results.txt
SUMMARY52=$OUT22-assembly-report.txt
RESULTS52=$OUT22-assembly-results.txt
SUMMARY53=$OUT23-assembly-report.txt
RESULTS53=$OUT23-assembly-results.txt
SUMMARY54=$OUT24-assembly-report.txt
RESULTS54=$OUT24-assembly-results.txt

#Run centrifuge
centrifuge -p 8 -k 1 -x abvnp -U $IN1 --report-file $SUMMARY1 -S $RESULTS1
centrifuge -p 8 -k 1 -x abvnp -U $IN2 --report-file $SUMMARY2 -S $RESULTS2
centrifuge -p 8 -k 1 -x abvnp -U $IN3 --report-file $SUMMARY3 -S $RESULTS3
centrifuge -p 8 -k 1 -x abvnp -U $IN4 --report-file $SUMMARY4 -S $RESULTS4
centrifuge -p 8 -k 1 -x abvnp -U $IN5 --report-file $SUMMARY5 -S $RESULTS5
centrifuge -p 8 -k 1 -x abvnp -U $IN6 --report-file $SUMMARY6 -S $RESULTS6
centrifuge -p 8 -k 1 -x abvnp -U $IN7 --report-file $SUMMARY7 -S $RESULTS7
centrifuge -p 8 -k 1 -x abvnp -U $IN8 --report-file $SUMMARY8 -S $RESULTS8
centrifuge -p 8 -k 1 -x abvnp -U $IN9 --report-file $SUMMARY9 -S $RESULTS9
centrifuge -p 8 -k 1 -x abvnp -U $IN10 --report-file $SUMMARY10 -S $RESULTS10
centrifuge -p 8 -k 1 -x abvnp -U $IN11 --report-file $SUMMARY11 -S $RESULTS11
centrifuge -p 8 -k 1 -x abvnp -U $IN12 --report-file $SUMMARY12 -S $RESULTS12
centrifuge -p 8 -k 1 -x abvnp -U $IN13 --report-file $SUMMARY13 -S $RESULTS13
centrifuge -p 8 -k 1 -x abvnp -U $IN14 --report-file $SUMMARY14 -S $RESULTS14
centrifuge -p 8 -k 1 -x abvnp -U $IN15 --report-file $SUMMARY15 -S $RESULTS15
centrifuge -p 8 -k 1 -x abvnp -U $IN16 --report-file $SUMMARY16 -S $RESULTS16
centrifuge -p 8 -k 1 -x abvnp -U $IN17 --report-file $SUMMARY17 -S $RESULTS17
centrifuge -p 8 -k 1 -x abvnp -U $IN18 --report-file $SUMMARY18 -S $RESULTS18
centrifuge -p 8 -k 1 -x abvnp -U $IN19 --report-file $SUMMARY19 -S $RESULTS19
centrifuge -p 8 -k 1 -x abvnp -U $IN20 --report-file $SUMMARY20 -S $RESULTS20
centrifuge -p 8 -k 1 -x abvnp -U $IN21 --report-file $SUMMARY21 -S $RESULTS21
centrifuge -p 8 -k 1 -x abvnp -U $IN22 --report-file $SUMMARY22 -S $RESULTS22
centrifuge -p 8 -k 1 -x abvnp -U $IN23 --report-file $SUMMARY23 -S $RESULTS23
centrifuge -p 8 -k 1 -x abvnp -U $IN24 --report-file $SUMMARY24 -S $RESULTS24
centrifuge -p 8 -k 1 -x abvnp -U $IN25 --report-file $SUMMARY25 -S $RESULTS25
centrifuge -p 8 -k 1 -x abvnp -U $IN26 --report-file $SUMMARY26 -S $RESULTS26
centrifuge -p 8 -k 1 -x abvnp -U $IN27 --report-file $SUMMARY27 -S $RESULTS27
centrifuge -p 8 -k 1 -x abvnp -U $IN28 --report-file $SUMMARY28 -S $RESULTS28
centrifuge -p 8 -k 1 -x abvnp -U $IN29 --report-file $SUMMARY29 -S $RESULTS29
centrifuge -p 8 -k 1 -x abvnp -U $IN30 --report-file $SUMMARY30 -S $RESULTS30
centrifuge -p 8 -k 1 -x abvnp -U $IN31 --report-file $SUMMARY31 -S $RESULTS31
centrifuge -p 8 -k 1 -x abvnp -U $IN32 --report-file $SUMMARY32 -S $RESULTS32
centrifuge -p 8 -k 1 -x abvnp -U $IN33 --report-file $SUMMARY33 -S $RESULTS33
centrifuge -p 8 -k 1 -x abvnp -U $IN34 --report-file $SUMMARY34 -S $RESULTS34
centrifuge -p 8 -k 1 -x abvnp -U $IN35 --report-file $SUMMARY35 -S $RESULTS35
centrifuge -p 8 -k 1 -x abvnp -U $IN36 --report-file $SUMMARY36 -S $RESULTS36
centrifuge -p 8 -k 1 -x abvnp -U $IN37 --report-file $SUMMARY37 -S $RESULTS37
centrifuge -p 8 -k 1 -x abvnp -U $IN38 --report-file $SUMMARY38 -S $RESULTS38
centrifuge -p 8 -k 1 -x abvnp -U $IN39 --report-file $SUMMARY39 -S $RESULTS39
centrifuge -p 8 -k 1 -x abvnp -U $IN40 --report-file $SUMMARY40 -S $RESULTS40
centrifuge -p 8 -k 1 -x abvnp -U $IN41 --report-file $SUMMARY41 -S $RESULTS41
centrifuge -p 8 -k 1 -x abvnp -U $IN42 --report-file $SUMMARY42 -S $RESULTS42
centrifuge -p 8 -k 1 -x abvnp -U $IN43 --report-file $SUMMARY43 -S $RESULTS43
centrifuge -p 8 -k 1 -x abvnp -U $IN44 --report-file $SUMMARY44 -S $RESULTS44
centrifuge -p 8 -k 1 -x abvnp -U $IN45 --report-file $SUMMARY45 -S $RESULTS45
centrifuge -p 8 -k 1 -x abvnp -U $IN46 --report-file $SUMMARY46 -S $RESULTS46
centrifuge -p 8 -k 1 -x abvnp -U $IN47 --report-file $SUMMARY47 -S $RESULTS47
centrifuge -p 8 -k 1 -x abvnp -U $IN48 --report-file $SUMMARY48 -S $RESULTS48
centrifuge -p 8 -k 1 -x abvnp -U $IN49 --report-file $SUMMARY49 -S $RESULTS49
centrifuge -p 8 -k 1 -x abvnp -U $IN50 --report-file $SUMMARY50 -S $RESULTS50
centrifuge -p 8 -k 1 -x abvnp -U $IN51 --report-file $SUMMARY51 -S $RESULTS51
centrifuge -p 8 -k 1 -x abvnp -U $IN52 --report-file $SUMMARY52 -S $RESULTS52
centrifuge -p 8 -k 1 -x abvnp -U $IN53 --report-file $SUMMARY53 -S $RESULTS53
centrifuge -p 8 -k 1 -x abvnp -U $IN54 --report-file $SUMMARY54 -S $RESULTS54
