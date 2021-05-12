/* 	Import Taxonomy Results
	ARGs in Bangladesh
*/

/*------------------------------------------------------------------------------
Import assembly results
------------------------------------------------------------------------------*/

* import taxon ranks data
foreach var in RC2 RC3 RC4b RC5b RG2 RG3 RG4 RH1 RH2 RH3 RH4 UC1 UC2 UC4b UC5 UG1 UG2 UG3 UG4 UH1 UH2 UH3 UH4 {
	clear
	import delimited `var'-assembly-report.txt, encoding (ISO-8859-1)
	
	keep taxid taxrank name
	
	save taxon_rank_`var'-assembly, replace
}

* import classification data
foreach var in RC2 RC3 RC4b RC5b RG2 RG3 RG4 RH1 RH2 RH3 RH4 UC1 UC2 UC4b UC5 UG1 UG2 UG3 UG4 UH1 UH2 UH3 UH4 {
	clear
	import delimited `var'-assembly-results.txt, encoding (ISO-8859-1)
		
	merge m:1 taxid using taxon_rank_`var'-np-assembly, nogen
	
	gen tax_sample_id = "`var'"
	
	save centrifuge_`var'-assembly, replace
	
	}

* append taxon results
use centrifuge_RC2-assembly.dta, clear

foreach var in RC3 RC4b RC5b RG2 RG3 RG4 RH1 RH2 RH3 RH4 UC1 UC2 UC4b UC5 UG1 UG2 UG3 UG4 UH1 UH2 UH3 UH4 {
	append using centrifuge_`var'-assembly.dta
}

save tax_all-assembly, replace

* rename and prep to merge with AMR 
rename (name seqid score ndbestscore hitlength querylength nummatches)(tax_name tax_seqid tax_score tax_ndbestscore tax_hitlength tax_querylength tax_nummatches)

save tax_all-assembly, replace
