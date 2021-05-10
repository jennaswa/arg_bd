
	/*	Identifying overlapping ARGs
		ARGs in Bangladesh	
	*/

	local indata1 = "data/amr_alignment/amr_positive_all.dta"
	
	/* ------------------------------------------------------------------------
	Primary alignments - gene variants/alleles
	-------------------------------------------------------------------------*/
	use `indata1', clear
	
		keep amr_sample_id amr_drug_class_edited amr_allele
	
		duplicates drop amr_sample_id amr_drug_class_edited amr_allele, force
		
		egen allele_in_ = group(amr_allele)
		
		reshape wide allele_in_, i(amr_allele) j(amr_sample_id) string
		
		foreach var in RC RG RH UC UG UH {
			replace allele_in_`var'=1 if !missing(allele_in_`var')
			replace allele_in_`var'=0 if missing(allele_in_`var')
			}
			
			local ref="RC"
			foreach sample in RC RG RH UC UG UH {
			gen byte `ref'_`sample'=0
			replace `ref'_`sample'=`ref'_`sample'+1 if allele_in_`ref'==1 & allele_in_`sample'==1 
				}
			local ref="RG"
			foreach sample in RC RG RH UC UG UH {
			gen byte `ref'_`sample'=0
			replace `ref'_`sample'=`ref'_`sample'+1 if allele_in_`ref'==1 & allele_in_`sample'==1 
				}			
			local ref="RH"
			foreach sample in RC RG RH UC UG UH {
			gen byte `ref'_`sample'=0
			replace `ref'_`sample'=`ref'_`sample'+1 if allele_in_`ref'==1 & allele_in_`sample'==1 
				}			
			local ref="UC"
			foreach sample in RC RG RH UC UG UH {
			gen byte `ref'_`sample'=0
			replace `ref'_`sample'=`ref'_`sample'+1 if allele_in_`ref'==1 & allele_in_`sample'==1 
				}			
			local ref="UG"
			foreach sample in RC RG RH UC UG UH {
			gen byte `ref'_`sample'=0
			replace `ref'_`sample'=`ref'_`sample'+1 if allele_in_`ref'==1 & allele_in_`sample'==1 
				}			
			local ref="UH"
			foreach sample in RC RG RH UC UG UH {
			gen byte `ref'_`sample'=0
			replace `ref'_`sample'=`ref'_`sample'+1 if allele_in_`ref'==1 & allele_in_`sample'==1 
				}		
				
		export delimited using "argoverlap_matrix.csv", replace
	
	* use argoverlap_matrix.csv to generate argoverlap_matrix.xlsx and subsequently, argoverlap_histogram.csv
	
