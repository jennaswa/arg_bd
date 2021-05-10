
/*	Calculate normalized abundance of ARGs
	ARGs in Bangladesh
*/

/*------------------------------------------------------------------------------
Merge Gbp bacteria
------------------------------------------------------------------------------*/

import delimited "gbps-bacteria.txt", delimiter(" ") clear
	rename (v1 v3) (amr_sample_id gbp_bacteria)
	keep amr_sample_id gbp_bacteria
save "temp-gbp_bacteria.dta", replace

use "amr_positive_all.dta", clear
	merge m:1 amr_sample_id using "temp-gbp_bacteria.dta", keep(3) nogen

/*------------------------------------------------------------------------------
Output table of abundance
------------------------------------------------------------------------------*/

	egen amino_abund = total(amr_drug_class_edited=="Aminoglycoside"), by(amr_sample_id)
	egen beta_abund = total(amr_drug_class_edited=="Beta-lactam"), by(amr_sample_id)
	egen folate_abund = total(amr_drug_class_edited=="Folate pathway antagonist"), by(amr_sample_id)
	egen fosfo_abund = total(amr_drug_class_edited=="Fosfomycin"), by(amr_sample_id)
	egen glyco_abund = total(amr_drug_class_edited=="Glycopeptide"), by(amr_sample_id)
	egen mls_abund = total(amr_drug_class_edited=="MLS"), by(amr_sample_id)
	egen multi_abund = total(amr_drug_class_edited=="Multidrug"), by(amr_sample_id)
	egen nitro_abund = total(amr_drug_class_edited=="Nitroimidazole"), by(amr_sample_id)
	egen pheni_abund = total(amr_drug_class_edited=="Phenicol"), by(amr_sample_id)
	egen pleur_abund = total(amr_drug_class_edited=="Pleuromutilin"), by(amr_sample_id)
	egen quino_abund = total(amr_drug_class_edited=="Quinolone"), by(amr_sample_id)
	egen stero_abund = total(amr_drug_class_edited=="Steroid antibacterial"), by(amr_sample_id)
	egen tetra_abund = total(amr_drug_class_edited=="Tetracycline"), by(amr_sample_id)
	
	egen total_abund = count(amr_target_name), by(amr_sample_id)
	
	log using "amr_abundance.txt", text replace
		foreach var in amino beta folate fosfo glyco mls multi nitro pheni pleur quino stero tetra total {
			replace `var'_abund=`var'_abund/gbp_bacteria*1000000000
			bysort amr_sample_id: tab `var'_abund
		}
	log close
			
/*------------------------------------------------------------------------------
Output table of abundance by individual (not pooled) sample
------------------------------------------------------------------------------*/

use "amr_positive_all_samples.dta", clear
	merge m:1 amr_sample_id using "temp-gbp_bacteria.dta", keep(3) nogen

	egen amino_abund = total(amr_drug_class_edited=="Aminoglycoside"), by(amr_sample_id)
	egen beta_abund = total(amr_drug_class_edited=="Beta-lactam"), by(amr_sample_id)
	egen folate_abund = total(amr_drug_class_edited=="Folate pathway antagonist"), by(amr_sample_id)
	egen fosfo_abund = total(amr_drug_class_edited=="Fosfomycin"), by(amr_sample_id)
	egen glyco_abund = total(amr_drug_class_edited=="Glycopeptide"), by(amr_sample_id)
	egen mls_abund = total(amr_drug_class_edited=="MLS"), by(amr_sample_id)
	egen multi_abund = total(amr_drug_class_edited=="Multidrug"), by(amr_sample_id)
	egen nitro_abund = total(amr_drug_class_edited=="Nitroimidazole"), by(amr_sample_id)
	egen pheni_abund = total(amr_drug_class_edited=="Phenicol"), by(amr_sample_id)
	egen pleur_abund = total(amr_drug_class_edited=="Pleuromutilin"), by(amr_sample_id)
	egen quino_abund = total(amr_drug_class_edited=="Quinolone"), by(amr_sample_id)
	egen stero_abund = total(amr_drug_class_edited=="Steroid antibacterial"), by(amr_sample_id)
	egen tetra_abund = total(amr_drug_class_edited=="Tetracycline"), by(amr_sample_id)
	
	egen total_abund = count(amr_target_name), by(amr_sample_id)
	
	log using "amr_abundance-samples.txt", text replace
		foreach var in amino beta folate fosfo glyco mls multi nitro pheni pleur quino stero tetra total {
			replace `var'_abund=`var'_abund/gbp_bacteria*1000000000
			bysort amr_sample_id: tab `var'_abund
		}
	log close		
	
* use amr_abundance.txt and amr_abundance-samples.txt to generate amr_abundance.csv, args_gbp.csv, and args_gbp-drug_class.csv
			
/*--------------------------------------------------------------------------
Remove temp files
--------------------------------------------------------------------------*/	
	
	local datafiles: dir . files "temp*.dta"
	foreach datafile of local datafiles {
		rm `datafile'
	}
