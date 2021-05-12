/* 	Merge ARGs with taxonomy and plasmids
	ARGs in Bangladesh
*/

*AMR data
use "amr_positive_all_samples.dta", clear
rename amr_read_id readid
replace readid=readid+amr_sample_id
sort readid
keep readid amr_target_name amr_allele amr_gene amr_drug_class amr_drug_class_edited
save "amr_positive_2merge-assembly.dta", replace

*Taxonomy data
use "tax_all-assembly.dta", clear
replace readid=readid+tax_sample_id
merge 1:m readid using "amr_positive_2merge-assembly.dta", keep(3) nogen

save "merged_amr_tax_all-assembly.dta", replace

*Plasmid data
use "plasmids_all-assembly.dta", clear
merge 1:m readid using "amr_positive_2merge-assembly.dta", keep(3) nogen

save "merged_amr_plasmids_all-assembly.dta", replace
