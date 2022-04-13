
/*	Calculate normalized abundance of ARGs
	ARGs in Bangladesh
*/

/*------------------------------------------------------------------------------
Merge Gbp bacteria
------------------------------------------------------------------------------*/

import delimited "gbps_np-bacteria.txt", delimiter(" ") clear
	rename (v1 v3) (amr_sample_id gbp_bacteria)
	keep amr_sample_id gbp_bacteria
save "temp-gbp_bacteria.dta", replace

use "amr_positive_all.dta", clear
	merge m:1 amr_sample_id using "temp-gbp_bacteria.dta", keep(3) nogen

/*------------------------------------------------------------------------------
Output table of abundance
------------------------------------------------------------------------------*/
*** Generate normalized abundance (gene copies per Gbp bacteria)
	egen group = group(amr_allele)
	su group, meanonly
	bysort group amr_sample_id: egen sum_alignment_length = total(amr_alignment_length/amr_target_length)
	bysort group amr_sample_id: gen norm_abund = (sum_alignment_length/(gbp_bacteria/1000000000))
	
	duplicates drop amr_sample_id group norm_abund, force
	
*** Generate abundance by drug class
	bysort amr_sample_id: egen amino_abund = total(norm_abund) if amr_drug_class_edited=="Aminoglycoside" 
	bysort amr_sample_id: egen beta_abund = total(norm_abund) if amr_drug_class_edited=="Beta-lactam"
	bysort amr_sample_id: egen folate_abund = total(norm_abund) if amr_drug_class_edited=="Folate pathway antagonist" 
	bysort amr_sample_id: egen fosfo_abund = total(norm_abund) if amr_drug_class_edited=="Fosfomycin" 
	bysort amr_sample_id: egen glyco_abund = total(norm_abund) if amr_drug_class_edited=="Glycopeptide" 
	bysort amr_sample_id: egen mls_abund = total(norm_abund) if amr_drug_class_edited=="MLS" 
	bysort amr_sample_id: egen nitro_abund = total(norm_abund) if amr_drug_class_edited=="Nitroimidazole" 
	bysort amr_sample_id: egen pheni_abund = total(norm_abund) if amr_drug_class_edited=="Phenicol" 
	bysort amr_sample_id: egen quino_abund = total(norm_abund) if amr_drug_class_edited=="Quinolone" 
	bysort amr_sample_id: egen tetra_abund = total(norm_abund) if amr_drug_class_edited=="Tetracycline" 
	bysort amr_sample_id: egen multi_abund = total(norm_abund) if amr_drug_class_edited=="Multidrug" 
	bysort amr_sample_id: egen other_abund = total(norm_abund) if amr_drug_class_edited=="Pleuromutilin"|amr_drug_class_edited=="Steroid antibacterial" 
	bysort amr_sample_id: egen total_abund = total(norm_abund)
	bysort amr_sample_id: egen pleur_abund = total(norm_abund) if amr_drug_class_edited=="Pleuromutilin"
	bysort amr_sample_id: egen stero_abund = total(norm_abund) if amr_drug_class_edited=="Steroid antibacterial"
	
	foreach var in amino beta folate fosfo glyco mls nitro pheni quino tetra multi other total pleur stero {
		sort amr_sample_id `var'_abund
		replace `var'_abund = `var'_abund[_n-1] if missing(`var'_abund) & amr_sample_id==amr_sample_id[_n-1]
		replace `var'_abund = 0 if missing(`var'_abund)
	}

*** Output abundance data
	log using "amr_abundance.txt", text replace
		foreach var in amino beta folate fosfo glyco mls nitro pheni quino tetra multi other total {
			bysort amr_sample_id: tab `var'_abund
		}
	log close
	
	duplicates drop amr_sample_id amino_abund beta_abund folate_abund fosfo_abund glyco_abund mls_abund multi_abund nitro_abund pheni_abund quino_abund tetra_abund other_abund total_abund, force
	outsheet amr_sample_id amino_abund beta_abund folate_abund fosfo_abund glyco_abund mls_abund multi_abund nitro_abund pheni_abund quino_abund tetra_abund other_abund using "amr_abundance.csv", comma
	
	preserve
		keep amr_sample_id amino_abund beta_abund folate_abund fosfo_abund glyco_abund mls_abund multi_abund nitro_abund pheni_abund quino_abund tetra_abund pleur_abund stero_abund 
		reshape long @_abund, i(amr_sample_id) j(drug_class) string
		gen host = "chicken" if strpos(amr_sample_id, "C") > 0
			replace host = "goat" if strpos(amr_sample_id, "G") > 0
			replace host = "human" if strpos(amr_sample_id, "H") > 0
		gen urbanicity = "rural" if strpos(amr_sample_id, "R") > 0
			replace urbanicity = "urban" if strpos(amr_sample_id, "U") > 0
		gen unique_id = amr_sample_id + "_" + drug_class
		reshape wide _abund, i(unique_id) j(urbanicity) string
		sort host drug_class unique_id
		replace _abundurban = _abundurban[_n+1] if missing(_abundurban)
		drop if missing(_abundrural)
		drop unique_id amr_sample_id
		rename (_abundrural _abundurban)(rural_arg_gbp urban_arg_gbp)
		outsheet host drug_class rural_arg_gbp urban_arg_gbp using "args_gbp-drug_class.csv", comma
	restore
	
/*------------------------------------------------------------------------------
Output table of abundance by individual (not pooled) sample
------------------------------------------------------------------------------*/

use "amr_positive_all_samples.dta", clear
	merge m:1 amr_sample_id using "temp-gbp_bacteria.dta", keep(3) nogen

*** Generate normalized abundance (gene copies per Gbp bacteria)
	egen group = group(amr_allele)
	su group, meanonly
	bysort group amr_sample_id: egen sum_alignment_length = total(amr_alignment_length/amr_target_length)
	bysort group amr_sample_id: gen norm_abund = (sum_alignment_length/(gbp_bacteria/1000000000))
	
	duplicates drop amr_sample_id group norm_abund, force
	
*** Generate abundance by drug class
	bysort amr_sample_id: egen amino_abund = total(norm_abund) if amr_drug_class_edited=="Aminoglycoside" 
	bysort amr_sample_id: egen beta_abund = total(norm_abund) if amr_drug_class_edited=="Beta-lactam"
	bysort amr_sample_id: egen folate_abund = total(norm_abund) if amr_drug_class_edited=="Folate pathway antagonist" 
	bysort amr_sample_id: egen fosfo_abund = total(norm_abund) if amr_drug_class_edited=="Fosfomycin" 
	bysort amr_sample_id: egen glyco_abund = total(norm_abund) if amr_drug_class_edited=="Glycopeptide" 
	bysort amr_sample_id: egen mls_abund = total(norm_abund) if amr_drug_class_edited=="MLS" 
	bysort amr_sample_id: egen nitro_abund = total(norm_abund) if amr_drug_class_edited=="Nitroimidazole" 
	bysort amr_sample_id: egen pheni_abund = total(norm_abund) if amr_drug_class_edited=="Phenicol" 
	bysort amr_sample_id: egen quino_abund = total(norm_abund) if amr_drug_class_edited=="Quinolone" 
	bysort amr_sample_id: egen tetra_abund = total(norm_abund) if amr_drug_class_edited=="Tetracycline" 
	bysort amr_sample_id: egen multi_abund = total(norm_abund) if amr_drug_class_edited=="Multidrug" 
	bysort amr_sample_id: egen other_abund = total(norm_abund) if amr_drug_class_edited=="Pleuromutilin"|amr_drug_class_edited=="Steroid antibacterial" 
	bysort amr_sample_id: egen total_abund = total(norm_abund)

	foreach var in amino beta folate fosfo glyco mls nitro pheni quino tetra multi other total {
		sort amr_sample_id `var'_abund
		replace `var'_abund = `var'_abund[_n-1] if missing(`var'_abund) & amr_sample_id==amr_sample_id[_n-1]
		replace `var'_abund = 0 if missing(`var'_abund)
	}

*** Output abundance data
	log using "amr_abundance-samples.txt", text replace
		foreach var in amino beta folate fosfo glyco mls nitro pheni quino tetra multi other total {
			bysort amr_sample_id: tab `var'_abund
		}
	log close
	
	duplicates drop amr_sample_id amino_abund beta_abund folate_abund fosfo_abund glyco_abund mls_abund multi_abund nitro_abund pheni_abund quino_abund tetra_abund other_abund total_abund, force
	outsheet amr_sample_id amino_abund beta_abund folate_abund fosfo_abund glyco_abund mls_abund multi_abund nitro_abund pheni_abund quino_abund tetra_abund other_abund using "amr_abundance-samples.csv", comma
	
/*--------------------------------------------------------------------------
Remove temp files
--------------------------------------------------------------------------*/	
	
	local datafiles: dir . files "temp*.dta"
	foreach datafile of local datafiles {
		rm `datafile'
	}
