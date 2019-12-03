*! version 1.0 \ JFK 2018-10-17
capture program drop rename_var_pssa_keystone

program define rename_var_pssa_keystone
	version 14
	syntax anything
	
	generate file_check = `anything'
	
		
	if file_check == "District"	{
		label	var	testname	"Test Name"
		label	var	subject	"Subject"
		label	var	grade	"Grade"
		label	var	category	"Category"
		label	var	group	"Group"
		label	var	denom	"Number Tested"
		label	var	num_bel	"Count Below Basic"
		label	var	score_bel	"Percent Below Basic"
		label	var	num_bas	"Count Basic"
		label	var	score_bas	"Percent Basic"
		label	var	num_prof	"Count Proficient"
		label	var	score_prof	"Percent Proficient"
		label	var	num_adv	"Count Advanced"
		label	var	score_adv	"Percent Advanced"
		label	var	num_profadv	"Count Prof/Adv"
		label	var	score_profadv	"Percent Prof/Adv"
	}
	
	else if file_check == "School" {
		label	var	testname	"Test Name"
		label	var	subject	"Subject"
		label	var	srcschoolid	"SRC School ID"
		label	var	publicationname_alphalist	"School Name"
		label	var	learningnetwork	"Learning Network"
		label	var	grade	"Grade"
		label	var	category	"Category"
		label	var	group	"Group"
		label	var	denom	"Number Tested"
		label	var	num_bel	"Count Below Basic"
		label	var	score_bel	"Percent Below Basic"
		label	var	num_bas	"Count Basic"
		label	var	score_bas	"Percent Basic"
		label	var	num_prof	"Count Proficient"
		label	var	score_prof	"Percent Proficient"
		label	var	num_adv	"Count Advanced"
		label	var	score_adv	"Percent Advanced"
		label	var	num_profadv	"Count Prof/Adv"
		label	var	score_profadv	"Percent Prof/Adv"
	}
	
	drop file_check
	
end
