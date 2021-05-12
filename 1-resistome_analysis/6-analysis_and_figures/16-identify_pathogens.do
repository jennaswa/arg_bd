
	/*	Identify Pathogens
		ARGs in Bangladesh
	*/
	
	clear
	set more off

	use "merged_amr_tax_all-assembly.dta", clear
	
	/*------------------------------------------------------------------------------
	Percentage ARG reads classified as bacteria
	------------------------------------------------------------------------------*/

	preserve
		drop if taxrank=="" | taxrank=="no rank" | tax_name=="unidentified plasmid"
		
		log using "percent_ARGs_classified-pathogens-assembly.txt", text replace
		
			tab tax_sample_id
			
			keep if taxrank=="species"|taxrank=="subspecies"|taxrank=="leaf"
			
			tab tax_sample_id
			
		log close
	restore
	
	/*------------------------------------------------------------------------------
	Gather read ids for potential pathogens
	------------------------------------------------------------------------------*/
	foreach var in RH2 UG4 UH1 {
	preserve
	
		keep if taxrank=="subspecies"|taxrank=="leaf"
		
		keep if strpos(tax_name, "Acinetobacter baumannii")|strpos(tax_name, "Campylobacter coli")|strpos(tax_name, "Campylobacter jejuni")|strpos(tax_name, "Clostridioides difficile")|strpos(tax_name, "Enterococcus faecium")|strpos(tax_name, "Escherichia coli")|strpos(tax_name, "Klebsiella pneumoniae")|strpos(tax_name, "Neisseria gonorrhoeae")|strpos(tax_name, "Salmonella enterica")|strpos(tax_name, "Shigella dysenteriae")|strpos(tax_name, "Staphylococcus aureus")|strpos(tax_name, "Streptococcus pneumoniae")
		
		*output read ids to identify pathogens in fastq/fasta
		replace readid=substr(readid,1,20)

			keep if tax_sample_id=="`var'"
			export delimited readid using "`var'pathogens_readids-assembly.txt", novarnames replace

	restore
	}
	/*------------------------------------------------------------------------------
	Output data for ARGs on chromosomes
	------------------------------------------------------------------------------*/

		keep if taxrank=="species"|taxrank=="subspecies"|taxrank=="leaf"
			
		keep if strpos(tax_name, "Acinetobacter baumannii")|strpos(tax_name, "Campylobacter coli")|strpos(tax_name, "Campylobacter jejuni")|strpos(tax_name, "Clostridioides difficile")|strpos(tax_name, "Enterococcus faecium")|strpos(tax_name, "Escherichia coli")|strpos(tax_name, "Klebsiella pneumoniae")|strpos(tax_name, "Neisseria gonorrhoeae")|strpos(tax_name, "Salmonella enterica")|strpos(tax_name, "Shigella dysenteriae")|strpos(tax_name, "Staphylococcus aureus")|strpos(tax_name, "Streptococcus pneumoniae")

		*collapse to species level
		gen tax_name_collapsed=""
			replace tax_name_collapsed="Acinetobacter baumannii" if strpos(tax_name, "Acinetobacter baumannii")
			replace tax_name_collapsed="Campylobacter coli" if strpos(tax_name, "Campylobacter coli")
			replace tax_name_collapsed="Campylobacter jejuni" if strpos(tax_name, "Campylobacter jejuni")
			replace tax_name_collapsed="Clostridioides difficile" if strpos(tax_name, "Clostridioides difficile")
			replace tax_name_collapsed="Enterococcus faecium" if strpos(tax_name, "Enterococcus faecium")
			replace tax_name_collapsed="Escherichia coli" if strpos(tax_name, "Escherichia coli")
			replace tax_name_collapsed="Klebsiella pneumoniae" if strpos(tax_name, "Klebsiella pneumoniae")
			replace tax_name_collapsed="Neisseria gonorrhoeae" if strpos(tax_name, "Neisseria gonorrhoeae")
			replace tax_name_collapsed="Salmonella enterica" if strpos(tax_name, "Salmonella enterica")
			replace tax_name_collapsed="Shigella dysenteriae" if strpos(tax_name, "Shigella dysenteriae")
			replace tax_name_collapsed="Staphylococcus aureus" if strpos(tax_name, "Staphylococcus aureus")
			replace tax_name_collapsed="Streptococcus pneumoniae" if strpos(tax_name, "Streptococcus pneumoniae")

		save "temp-pathogens.dta", replace
	
		*merge with gbp data
		import delimited "gbps-bacteria-assembly.txt", delimiter(" ") clear
			rename (v1 v3) (tax_sample_id gbp_bacteria)
			keep tax_sample_id gbp_bacteria
			destring gbp_bacteria, replace
									
			*concatenate sample types and sum gbp data	
			gen tax_sample_id_collapsed=""
			foreach var in RC RG RH UC UG UH {
				replace tax_sample_id_collapsed="`var'" if strpos(tax_sample_id, "`var'")
			}
			egen gbp_bacteria_total = total(gbp_bacteria), by(tax_sample_id_collapsed)
		
		save "temp-gbp_bacteria.dta", replace

		use "temp-pathogens.dta", clear
			merge m:1 tax_sample_id using "temp-gbp_bacteria.dta", keep(3) nogen
			
		*calculate args/gbp
		egen abaum_abund = total(tax_name_collapsed=="Acinetobacter baumannii"), by(tax_sample_id_collapsed)
		egen ccoli_abund = total(tax_name_collapsed=="Campylobacter coli"), by(tax_sample_id_collapsed)
		egen cjeju_abund = total(tax_name_collapsed=="Campylobacter jejuni"), by(tax_sample_id_collapsed)
		egen cdiff_abund = total(tax_name_collapsed=="Clostridioides difficile"), by(tax_sample_id_collapsed)
		egen efaec_abund = total(tax_name_collapsed=="Enterococcus faecium"), by(tax_sample_id_collapsed)
		egen ecoli_abund = total(tax_name_collapsed=="Escherichia coli"), by(tax_sample_id_collapsed)
		egen kpneu_abund = total(tax_name_collapsed=="Klebsiella pneumoniae"), by(tax_sample_id_collapsed)
		egen ngono_abund = total(tax_name_collapsed=="Neisseria gonorrhoeae"), by(tax_sample_id_collapsed)
		egen sente_abund = total(tax_name_collapsed=="Salmonella enterica"), by(tax_sample_id_collapsed)
		egen sdyse_abund = total(tax_name_collapsed=="Shigella dysenteriae"), by(tax_sample_id_collapsed)
		egen saure_abund = total(tax_name_collapsed=="Staphylococcus aureus"), by(tax_sample_id_collapsed)
		egen spneu_abund = total(tax_name_collapsed=="Streptococcus pneumoniae"), by(tax_sample_id_collapsed)
		
		*output
		log using "arg_hosts_pathogens-assembly.txt", text replace
			foreach var in abaum ccoli cjeju cdiff efaec ecoli kpneu ngono sente sdyse saure spneu {
				replace `var'_abund=`var'_abund/gbp_bacteria_total*1000000000
				bysort tax_sample_id_collapsed: tab `var'_abund
			}
		log close
		
		*output pathogen/ARG combos for presence/absence figure
		export delimited tax_sample_id_collapsed tax_name_collapsed amr_gene amr_drug_class_edited using "pathogens_args_combos-assembly.csv", replace
		
		save "temp-merged.dta", replace
		
	/*------------------------------------------------------------------------------
	All contigs
	------------------------------------------------------------------------------*/
	use "tax_all-assembly.dta", clear	
		
	*gather read ids for potential pathogens	
	foreach var in RC3 RG4 RH1 RH2 RH3 RH4 UC1 UC2 UC4b UC5 UG1 UG2 UG3 UG4 UH1 UH2 UH3 UH4 {
	preserve
	
		keep if taxrank=="subspecies"|taxrank=="leaf"
		
		keep if strpos(tax_name, "Acinetobacter baumannii")|strpos(tax_name, "Campylobacter coli")|strpos(tax_name, "Campylobacter jejuni")|strpos(tax_name, "Clostridioides difficile")|strpos(tax_name, "Enterococcus faecium")|strpos(tax_name, "Escherichia coli")|strpos(tax_name, "Klebsiella pneumoniae")|strpos(tax_name, "Neisseria gonorrhoeae")|strpos(tax_name, "Salmonella enterica")|strpos(tax_name, "Shigella dysenteriae")|strpos(tax_name, "Staphylococcus aureus")|strpos(tax_name, "Streptococcus pneumoniae")
		
		*output read ids to identify pathogens in fastq/fasta
			keep if tax_sample_id=="`var'"
			export delimited readid using "`var'ALLpathogens_woutARGs_readids-assembly.txt", novarnames replace
			
	restore
	}										
	*concatenate sample types
	gen tax_sample_id_collapsed=""
	foreach var in RC RG RH UC UG UH {
		replace tax_sample_id_collapsed="`var'" if strpos(tax_sample_id, "`var'")
	}
	
	*** Percentage contigs classified as bacteria ***	
	preserve
		drop if taxrank=="" | taxrank=="no rank" | tax_name=="unidentified plasmid"
		
		log using "percent_contigs_classified-pathogens-assembly.txt", text replace
		
			tab tax_sample_id_collapsed
			
			keep if taxrank=="species"|taxrank=="subspecies"|taxrank=="leaf"
			
			tab tax_sample_id_collapsed
				
			keep if strpos(tax_name, "Acinetobacter baumannii")|strpos(tax_name, "Campylobacter coli")|strpos(tax_name, "Campylobacter jejuni")|strpos(tax_name, "Clostridioides difficile")|strpos(tax_name, "Enterococcus faecium")|strpos(tax_name, "Escherichia coli")|strpos(tax_name, "Klebsiella pneumoniae")|strpos(tax_name, "Neisseria gonorrhoeae")|strpos(tax_name, "Salmonella enterica")|strpos(tax_name, "Shigella dysenteriae")|strpos(tax_name, "Staphylococcus aureus")|strpos(tax_name, "Streptococcus pneumoniae")

			tab tax_sample_id_collapsed
			
		log close
	restore

	*** Output data for CDC pathogens plot ***
	preserve
		keep if taxrank=="species"|taxrank=="subspecies"|taxrank=="leaf"
			
		keep if strpos(tax_name, "Acinetobacter baumannii")|strpos(tax_name, "Campylobacter coli")|strpos(tax_name, "Campylobacter jejuni")|strpos(tax_name, "Clostridioides difficile")|strpos(tax_name, "Enterococcus faecium")|strpos(tax_name, "Escherichia coli")|strpos(tax_name, "Klebsiella pneumoniae")|strpos(tax_name, "Neisseria gonorrhoeae")|strpos(tax_name, "Salmonella enterica")|strpos(tax_name, "Shigella dysenteriae")|strpos(tax_name, "Staphylococcus aureus")|strpos(tax_name, "Streptococcus pneumoniae")

		*collapse to species level
		gen tax_name_collapsed=""
			replace tax_name_collapsed="Acinetobacter baumannii" if strpos(tax_name, "Acinetobacter baumannii")
			replace tax_name_collapsed="Campylobacter coli" if strpos(tax_name, "Campylobacter coli")
			replace tax_name_collapsed="Campylobacter jejuni" if strpos(tax_name, "Campylobacter jejuni")
			replace tax_name_collapsed="Clostridioides difficile" if strpos(tax_name, "Clostridioides difficile")
			replace tax_name_collapsed="Enterococcus faecium" if strpos(tax_name, "Enterococcus faecium")
			replace tax_name_collapsed="Escherichia coli" if strpos(tax_name, "Escherichia coli")
			replace tax_name_collapsed="Klebsiella pneumoniae" if strpos(tax_name, "Klebsiella pneumoniae")
			replace tax_name_collapsed="Neisseria gonorrhoeae" if strpos(tax_name, "Neisseria gonorrhoeae")
			replace tax_name_collapsed="Salmonella enterica" if strpos(tax_name, "Salmonella enterica")
			replace tax_name_collapsed="Shigella dysenteriae" if strpos(tax_name, "Shigella dysenteriae")
			replace tax_name_collapsed="Staphylococcus aureus" if strpos(tax_name, "Staphylococcus aureus")
			replace tax_name_collapsed="Streptococcus pneumoniae" if strpos(tax_name, "Streptococcus pneumoniae")

		save "temp-pathogens-contigs.dta", replace
	
		*merge with number contigs
		foreach var in RC RG RH UC UG UH {
			import delimited "`var'-assembly-number_reads.txt", delimiter(" ") clear
			rename v1 total_contigs
			gen tax_sample_id_collapsed="`var'"
			save "temp-`var'-total_contigs.dta", replace
		}
		
		use "temp-RC-total_contigs.dta", clear
			foreach var in RG RH UC UG UH {
				append using "temp-`var'-total_contigs.dta"
			}
		save "temp-appended-contigs.dta", replace
		
		use "temp-pathogens-contigs.dta", clear
			merge m:1 tax_sample_id_collapsed using "temp-appended-contigs.dta", keep(3) nogen
			
		*calculate contigs/total contigs
		egen abaum_abund = total(tax_name_collapsed=="Acinetobacter baumannii"), by(tax_sample_id_collapsed)
		egen ccoli_abund = total(tax_name_collapsed=="Campylobacter coli"), by(tax_sample_id_collapsed)
		egen cjeju_abund = total(tax_name_collapsed=="Campylobacter jejuni"), by(tax_sample_id_collapsed)
		egen cdiff_abund = total(tax_name_collapsed=="Clostridioides difficile"), by(tax_sample_id_collapsed)
		egen efaec_abund = total(tax_name_collapsed=="Enterococcus faecium"), by(tax_sample_id_collapsed)
		egen ecoli_abund = total(tax_name_collapsed=="Escherichia coli"), by(tax_sample_id_collapsed)
		egen kpneu_abund = total(tax_name_collapsed=="Klebsiella pneumoniae"), by(tax_sample_id_collapsed)
		egen ngono_abund = total(tax_name_collapsed=="Neisseria gonorrhoeae"), by(tax_sample_id_collapsed)
		egen sente_abund = total(tax_name_collapsed=="Salmonella enterica"), by(tax_sample_id_collapsed)
		egen sdyse_abund = total(tax_name_collapsed=="Shigella dysenteriae"), by(tax_sample_id_collapsed)
		egen saure_abund = total(tax_name_collapsed=="Staphylococcus aureus"), by(tax_sample_id_collapsed)
		egen spneu_abund = total(tax_name_collapsed=="Streptococcus pneumoniae"), by(tax_sample_id_collapsed)
		
		*output
		log using "pathogens-assembly.txt", text replace
			foreach var in abaum ccoli cjeju cdiff efaec ecoli kpneu ngono sente sdyse saure spneu {
				replace `var'_abund=`var'_abund/total_contigs*100000
				bysort tax_sample_id_collapsed: tab `var'_abund
			}
		log close
		
		*output pathogens for presence/absence figure
		export delimited tax_sample_id_collapsed tax_name_collapsed using "pathogens-assembly.csv", replace
		
		save "pathogens-all_contigs.dta", replace
				
	/*--------------------------------------------------------------------------
	Remove temp files
	--------------------------------------------------------------------------*/	
		local datafiles: dir . files "temp*.dta"
		foreach datafile of local datafiles {
			rm `datafile'
		}
		
		
		
