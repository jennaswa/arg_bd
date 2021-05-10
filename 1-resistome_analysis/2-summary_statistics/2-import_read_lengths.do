
	/*	Import read length data
		ARGs in Bangladesh
	*/

/*--------------------------------------------------------------------------
Raw reads
--------------------------------------------------------------------------*/

foreach var in RH RC RG UH UC UG {

clear
import delimited "`var'-read_lengths.txt", delimiter(space, collapse) encoding(ISO-8859-1)

tostring v1, replace
replace v1 = "`var'"

rename (v1 v2 v3) (sample_id freq length)

save "temp-`var'-read_lengths.dta", replace

expand freq

log using "`var'-read_stats.txt", text replace

sum length, detail

log close

}

* append read length data

use "temp-RH-read_lengths.dta", clear

foreach var in RC RG UH UC UG {

append using "temp-`var'-read_lengths.dta"

}

save "temp-all-read_lengths.dta", replace

expand freq

log using "all-read_stats.txt", text replace

sum length, detail

log close

/*--------------------------------------------------------------------------
Assembled reads
--------------------------------------------------------------------------*/
foreach var in RH RC RG UH UC UG {

clear
import delimited "`var'-consensus-read_lengths.txt", delimiter(space, collapse) encoding(ISO-8859-1)

tostring v1, replace
replace v1 = "`var'"

rename (v1 v2) (sample_id length)
gen freq=1
count

save "temp-`var'-consensus-read_lengths.dta", replace

expand freq

log using "`var'-consensus-read_stats.txt", text replace

sum length, detail

log close

}

* append read length data

use "temp-RH-consensus-read_lengths.dta", clear

foreach var in RC RG UH UC UG {

append using "temp-`var'-consensus-read_lengths.dta"

}

save "temp-all-assembly-read_lengths.dta", replace
export delimited "all_assembly-read_lengths.csv", replace

expand freq

log using "all-assembly-read_stats.txt", text replace

sum length, detail

log close

/*--------------------------------------------------------------------------
Remove temp files
--------------------------------------------------------------------------*/	
local datafiles: dir . files "temp*.dta"
foreach datafile of local datafiles {
	rm `datafile'
}
