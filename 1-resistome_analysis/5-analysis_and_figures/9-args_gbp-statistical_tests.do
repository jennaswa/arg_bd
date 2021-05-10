
	/*	Compare ARG abundance in urban vs rural
		ARGs in Bangladesh	
	*/

	import delimited using args_gbp.csv, varnames(1)
	rename ïsample sample
	
	/*--------------------------------------------------------------------------
	Wilcoxon rank sum tests
	--------------------------------------------------------------------------*/
	
	log using args_gbp-wilcoxon.txt, text replace
	
	bysort host: ranksum arg_gbp, by(location)
	
	preserve
		drop if host=="chicken"
		bysort location: ranksum arg_gbp, by(host)
	restore
	preserve
		drop if host=="goat"
		bysort location: ranksum arg_gbp, by(host)
	restore
	preserve
		drop if host=="human"
		bysort location: ranksum arg_gbp, by(host)
	restore

	ranksum arg_gbp, by(location)
	
	log close
	
	/*--------------------------------------------------------------------------
	Wilcoxon signed-rank tests
	--------------------------------------------------------------------------*/	
	
	clear
	import delimited using args_gbp-drug_class.csv, varnames(1)
	rename ïhost host
	
	log using args_gbp-signed_rank.txt, text replace
	
	bysort host: signrank rural_arg_gbp = urban_arg_gbp
	
	log close
	
