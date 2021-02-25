
	/*	Import AMR data
		ARGs in Bangladesh
	*/

/*------------------------------------------------------------------------------
Primary alignments - raw reads
------------------------------------------------------------------------------*/

**NOTE-no barcodes detected for RG5, so not included in individual sample analysis
foreach var in RC2 RC3 RC4 RC5 RG2 RG3 RG4 RH1 RH2 RH3 RH4 UC1 UC2 UC4 UC5 UG1 UG2 UG3 UG4 UH1 UH2 UH3 UH4 RC RG RH UC UG UH {

clear
import delimited `var'-prim-amrresults.paf, encoding(ISO-8859-1)

gen amr_sample_id = "`var'"
rename v1 amr_read_id
rename v2 amr_read_length
rename v3 amr_read_start
rename v4 amr_read_end
rename v5 amr_relative_strand
rename v6 amr_target_name
rename v7 amr_target_length
rename v8 amr_start_on_strand
rename v9 amr_end_on_strand
rename v10 amr_number_residue_matches
rename v11 amr_alignment_length
rename v12 amr_mapping_quality
rename v13 amr_mismatches_gaps
rename v14 amr_DPscore
rename v15 amr_DPalign_score
rename v16 amr_num_ambiguous_bases
rename v17 amr_align_type
rename v18 amr_num_minimizers
rename v19 amr_chaining_score

generate amr_alignment_identity = .
replace amr_alignment_identity = (amr_number_residue_matches/amr_alignment_length) * 100

generate amr_alignment_coverage = .
replace amr_alignment_coverage = (amr_alignment_length/amr_target_length) * 100

generate amr_accept = .
replace amr_accept = 1 if (amr_alignment_identity >=90 & amr_alignment_length >= 100)

save amr_`var', replace

}

*import and merge AMR gene class identification
*phenotypes.txt was obtained from bitbucket.org/genomicepidemiology/resfinder_db/src/master/phenotypes.txt and
*edited to include amr_gene and amr_allle varaibles
clear
import phenotypes_dedup.csv

rename (v1 v2 v3 v4 v5 v6 v7 v8) (amr_target_name amr_drug_class amr_gene amr_allele amr_phenotype amr_pmid amr_mechanism amr_pheno_notes)

save amr_gene_classes, replace


foreach var in RC2 RC3 RC4b RC5b RG2 RG3 RG4 RH1 RH2 RH3 RH4 UC1 UC2 UC4b UC5 UG1 UG2 UG3 UG4 UH1 UH2 UH3 UH4 RC RG RH UC UG UH {

use amr_`var', clear

merge m:1 amr_target_name using amr_gene_classes, nogen

replace amr_drug_class = "Other" if missing(amr_drug_class)


*clean drug class data
	gen aminoglycoside=0
		replace aminoglycoside=1 if amr_drug_class=="Aminoglycoside"
	gen beta_lactam=0
		replace beta_lactam=1 if amr_drug_class=="Beta-lactam"
	gen folate=0
		replace folate=1 if amr_drug_class=="Folate pathway antagonist"
	gen fosfomycin=0
		replace fosfomycin=1 if amr_drug_class=="Fosfomycin"
	gen glycopeptide=0
		replace glycopeptide=1 if amr_drug_class=="Glycopeptide"
	gen mls=0
		replace mls=1 if amr_drug_class=="Lincosamide"|amr_drug_class=="Lincosamide, Streptogramin A"|amr_drug_class=="Lincosamides"|amr_drug_class=="Macrolide"|amr_drug_class=="Macrolide, Lincosamide, Streptogramin B"|amr_drug_class=="Macrolide, Streptogramin B"|amr_drug_class=="Streptogramin A"
	gen multidrug=0
		replace multidrug=1 if amr_drug_class=="Lincosamide, Streptogramin A, Pleuromutilin"|amr_drug_class=="Macrolide, Aminoglycoside, Tetracycline, Fluoroquinolone, Phenicol, Rifampicin"|amr_drug_class=="Macrolide, Lincosamide, Streptogramin A, Streptogramin B, Tetracycline"|amr_drug_class=="Macrolide, Tetracycline"|amr_drug_class=="Oxazolidinone, Phenicol, Lincosamide, Streptogramin A, Pleuromutilin"
	gen nitroimidazole=0
		replace nitroimidazole=1 if amr_drug_class=="Nitroimidazole"
	gen phenicol=0
		replace phenicol=1 if amr_drug_class=="Phenicol"
	gen pleuromutilin=0
		replace pleuromutilin=1 if amr_drug_class=="Pleuromutilin"
	gen quinolone=0
		replace quinolone=1 if amr_drug_class=="Quinolone"
	gen steroid=0
		replace steroid=1 if amr_drug_class=="Steroid antibacterial"
	gen tetracycline=0
		replace tetracycline=1 if amr_drug_class=="Tetracycline"

	gen amr_drug_class_edited=""
		replace amr_drug_class_edited="Aminoglycoside" if amr_drug_class=="Aminoglycoside"
		replace amr_drug_class_edited="Beta-lactam" if amr_drug_class=="Beta-lactam"
		replace amr_drug_class_edited="Folate pathway antagonist" if amr_drug_class=="Folate pathway antagonist"
		replace amr_drug_class_edited="Fosfomycin" if amr_drug_class=="Fosfomycin"
		replace amr_drug_class_edited="Glycopeptide" if amr_drug_class=="Glycopeptide"
		replace amr_drug_class_edited="MLS" if amr_drug_class=="Lincosamide"|amr_drug_class=="Lincosamide, Streptogramin A"|amr_drug_class=="Lincosamides"|amr_drug_class=="Macrolide"|amr_drug_class=="Macrolide, Lincosamide, Streptogramin B"|amr_drug_class=="Macrolide, Streptogramin B"|amr_drug_class=="Streptogramin A"
		replace amr_drug_class_edited="Multidrug" if amr_drug_class=="Lincosamide, Streptogramin A, Pleuromutilin"|amr_drug_class=="Macrolide, Aminoglycoside, Tetracycline, Fluoroquinolone, Phenicol, Rifampicin"|amr_drug_class=="Macrolide, Lincosamide, Streptogramin A, Streptogramin B, Tetracycline"|amr_drug_class=="Macrolide, Tetracycline"|amr_drug_class=="Oxazolidinone, Phenicol, Lincosamide, Streptogramin A, Pleuromutilin"
		replace amr_drug_class_edited="Nitroimidazole" if amr_drug_class=="Nitroimidazole"
		replace amr_drug_class_edited="Phenicol" if amr_drug_class=="Phenicol"
		replace amr_drug_class_edited="Pleuromutilin" if amr_drug_class=="Pleuromutilin"
		replace amr_drug_class_edited="Quinolone" if amr_drug_class=="Quinolone"
		replace amr_drug_class_edited="Steroid antibacterial" if amr_drug_class=="Steroid antibacterial"
		replace amr_drug_class_edited="Tetracycline" if amr_drug_class=="Tetracycline"

*create dataset of positive hits
keep if amr_accept == 1

save amr_positive_`var', replace

}

*append files
use amr_positive_RC, clear

foreach var in RG RH UC UG UH {

append using amr_positive_`var'.dta

}

save amr_positive_all, replace

use amr_positive_RC2, clear

foreach var in RC3 RC4 RC5 RG2 RG3 RG4 RH1 RH2 RH3 RH4 UC1 UC2 UC4 UC5 UG1 UG2 UG3 UG4 UH1 UH2 UH3 UH4 {

append using amr_positive_`var'.dta

}

save amr_positive_all_samples, replace

*export data for relative abundance figure in R
use amr_positive_all, clear

log using amr_abundance.txt, text replace

bysort amr_sample_id: tab amr_drug_class_edited
bysort amr_sample_id: tab amr_gene
bysort amr_sample_id: tab amr_allele
tab amr_sample_id

log close

use amr_positive_all_samples, clear

log using amr_abundance_samples.txt, text replace
bysort amr_sample_id: tab amr_drug_class_edited
bysort amr_sample_id: tab amr_gene
bysort amr_sample_id: tab amr_allele
tab amr_sample_id

log close

ssc install xtable
xtable amr_allele amr_sample_id, filename("otu_table-alleles.xlsx") sheet("alleles") replace
xtable amr_gene amr_sample_id, filename("otu_table-genes.xlsx") sheet("ARGs") replace
xtable amr_drug_class_edited amr_sample_id, filename("otu_table-drug_class.xlsx") sheet("classes") replace

/*------------------------------------------------------------------------------
Primary alignments - assembled contigs
------------------------------------------------------------------------------*/

**NOTE-no barcodes detected for RG5, so not included in individual sample analysis
**NOTE-no ARGs detected for RC2 contigs, so not included in individual sample analysis
foreach var in RC3 RC4 RC5 RG2 RG3 RG4 RH1 RH2 RH3 RH4 UC1 UC2 UC4 UC5 UG1 UG2 UG3 UG4 UH1 UH2 UH3 UH4 {

clear
import delimited `var'-assembly-prim-amrresults.paf, encoding(ISO-8859-1)

gen amr_sample_id = "`var'"
rename v1 amr_read_id
rename v2 amr_read_length
rename v3 amr_read_start
rename v4 amr_read_end
rename v5 amr_relative_strand
rename v6 amr_target_name
rename v7 amr_target_length
rename v8 amr_start_on_strand
rename v9 amr_end_on_strand
rename v10 amr_number_residue_matches
rename v11 amr_alignment_length
rename v12 amr_mapping_quality
rename v13 amr_mismatches_gaps
rename v14 amr_DPscore
rename v15 amr_DPalign_score
rename v16 amr_num_ambiguous_bases
rename v17 amr_align_type
rename v18 amr_num_minimizers
rename v19 amr_chaining_score

generate amr_alignment_identity = .
replace amr_alignment_identity = (amr_number_residue_matches/amr_alignment_length) * 100

generate amr_alignment_coverage = .
replace amr_alignment_coverage = (amr_alignment_length/amr_target_length) * 100

generate amr_accept = .
replace amr_accept = 1 if (amr_alignment_identity >=90 & amr_alignment_length >= 100)

save amr_`var'_assembly, replace

}

*merge AMR gene class identification
foreach var in RC2 RC3 RC4b RC5b RG2 RG3 RG4 RH1 RH2 RH3 RH4 UC1 UC2 UC4b UC5 UG1 UG2 UG3 UG4 UH1 UH2 UH3 UH4 {

use amr_`var'_assembly, clear

merge m:1 amr_target_name using amr_gene_classes, nogen

replace amr_drug_class = "Other" if missing(amr_drug_class)


*clean drug class data
	gen aminoglycoside=0
		replace aminoglycoside=1 if amr_drug_class=="Aminoglycoside"
	gen beta_lactam=0
		replace beta_lactam=1 if amr_drug_class=="Beta-lactam"
	gen folate=0
		replace folate=1 if amr_drug_class=="Folate pathway antagonist"
	gen fosfomycin=0
		replace fosfomycin=1 if amr_drug_class=="Fosfomycin"
	gen glycopeptide=0
		replace glycopeptide=1 if amr_drug_class=="Glycopeptide"
	gen mls=0
		replace mls=1 if amr_drug_class=="Lincosamide"|amr_drug_class=="Lincosamide, Streptogramin A"|amr_drug_class=="Lincosamides"|amr_drug_class=="Macrolide"|amr_drug_class=="Macrolide, Lincosamide, Streptogramin B"|amr_drug_class=="Macrolide, Streptogramin B"|amr_drug_class=="Streptogramin A"
	gen multidrug=0
		replace multidrug=1 if amr_drug_class=="Lincosamide, Streptogramin A, Pleuromutilin"|amr_drug_class=="Macrolide, Aminoglycoside, Tetracycline, Fluoroquinolone, Phenicol, Rifampicin"|amr_drug_class=="Macrolide, Lincosamide, Streptogramin A, Streptogramin B, Tetracycline"|amr_drug_class=="Macrolide, Tetracycline"|amr_drug_class=="Oxazolidinone, Phenicol, Lincosamide, Streptogramin A, Pleuromutilin"
	gen nitroimidazole=0
		replace nitroimidazole=1 if amr_drug_class=="Nitroimidazole"
	gen phenicol=0
		replace phenicol=1 if amr_drug_class=="Phenicol"
	gen pleuromutilin=0
		replace pleuromutilin=1 if amr_drug_class=="Pleuromutilin"
	gen quinolone=0
		replace quinolone=1 if amr_drug_class=="Quinolone"
	gen steroid=0
		replace steroid=1 if amr_drug_class=="Steroid antibacterial"
	gen tetracycline=0
		replace tetracycline=1 if amr_drug_class=="Tetracycline"

	gen amr_drug_class_edited=""
		replace amr_drug_class_edited="Aminoglycoside" if amr_drug_class=="Aminoglycoside"
		replace amr_drug_class_edited="Beta-lactam" if amr_drug_class=="Beta-lactam"
		replace amr_drug_class_edited="Folate pathway antagonist" if amr_drug_class=="Folate pathway antagonist"
		replace amr_drug_class_edited="Fosfomycin" if amr_drug_class=="Fosfomycin"
		replace amr_drug_class_edited="Glycopeptide" if amr_drug_class=="Glycopeptide"
		replace amr_drug_class_edited="MLS" if amr_drug_class=="Lincosamide"|amr_drug_class=="Lincosamide, Streptogramin A"|amr_drug_class=="Lincosamides"|amr_drug_class=="Macrolide"|amr_drug_class=="Macrolide, Lincosamide, Streptogramin B"|amr_drug_class=="Macrolide, Streptogramin B"|amr_drug_class=="Streptogramin A"
		replace amr_drug_class_edited="Multidrug" if amr_drug_class=="Lincosamide, Streptogramin A, Pleuromutilin"|amr_drug_class=="Macrolide, Aminoglycoside, Tetracycline, Fluoroquinolone, Phenicol, Rifampicin"|amr_drug_class=="Macrolide, Lincosamide, Streptogramin A, Streptogramin B, Tetracycline"|amr_drug_class=="Macrolide, Tetracycline"|amr_drug_class=="Oxazolidinone, Phenicol, Lincosamide, Streptogramin A, Pleuromutilin"
		replace amr_drug_class_edited="Nitroimidazole" if amr_drug_class=="Nitroimidazole"
		replace amr_drug_class_edited="Phenicol" if amr_drug_class=="Phenicol"
		replace amr_drug_class_edited="Pleuromutilin" if amr_drug_class=="Pleuromutilin"
		replace amr_drug_class_edited="Quinolone" if amr_drug_class=="Quinolone"
		replace amr_drug_class_edited="Steroid antibacterial" if amr_drug_class=="Steroid antibacterial"
		replace amr_drug_class_edited="Tetracycline" if amr_drug_class=="Tetracycline"

*create dataset of positive hits
keep if amr_accept == 1

save amr_positive_`var'_assembly, replace

}

*append files
use amr_positive_RC3_assembly, clear

foreach var in RC4 RC5 RG2 RG3 RG4 RH1 RH2 RH3 RH4 UC1 UC2 UC4 UC5 UG1 UG2 UG3 UG4 UH1 UH2 UH3 UH4 {

append using amr_positive_`var'_assembly.dta

}

save amr_positive_all_samples_assembly, replace
