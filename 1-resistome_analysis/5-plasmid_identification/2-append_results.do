
/*	Append Mobsuite Results
	ARGs in Bangladesh
*/

/*------------------------------------------------------------------------------
Import mobsuite results
------------------------------------------------------------------------------*/
***NOTE: No plasmids in UG1 or UG2
foreach var in RC2 RC3 RC4 RC5 RG2 RG3 RG4 RH1 RH2 RH3 RH4 UC1 UC2 UC4 UC5 UG3 UG4 UH1 UH2 UH3 UH4 {
	import delimited "`var'contig_report.txt", delimiter("\t") clear
	
	*keep plasmids only
	keep if cluster_id!="chromosome"
	
	*extract contig ids
	split contig_id, parse(|)
	split contig_id2, parse(_)
	gen readid = contig_id21 + "_" + contig_id22 + "_" + contig_id23 + "`var'"
	
	*save relevant vars
	keep readid cluster_id circularity_status rep_type rep_type_accession
	save "temp-`var'-plasmids.dta", replace
}

/*------------------------------------------------------------------------------
Append mobsuite results
------------------------------------------------------------------------------*/
use "temp-RC2-plasmids.dta", clear
	foreach var in RC3 RC4 RC5 RG2 RG3 RG4 RH1 RH2 RH3 RH4 UC1 UC2 UC4 UC5 UG3 UG4 UH1 UH2 UH3 UH4 {
		append using "temp-`var'-plasmids.dta"
	}
	
save "plasmids_all-assembly.dta", replace

/*--------------------------------------------------------------------------
Remove temp files
--------------------------------------------------------------------------*/	
	local datafiles: dir . files "temp*.dta"
	foreach datafile of local datafiles {
		rm `datafile'
	}
