*! version 1.0 \ JFK 2018-04-25
capture program drop trim_top_table

program define trim_top_table
	version 14
	syntax anything
	
foreach rename_var of varlist _all {	
		capture noisily replace `rename_var' = subinstr(`rename_var'," ","",.) in `anything'
		capture noisily replace `rename_var' = subinstr(`rename_var',"(","",.) in `anything'
		capture noisily replace `rename_var' = subinstr(`rename_var',")","",.) in `anything'
		capture noisily replace `rename_var' = subinstr(`rename_var',"-","",.) in `anything'
		capture noisily replace `rename_var' = subinstr(`rename_var',"[","",.) in `anything'
		capture noisily replace `rename_var' = subinstr(`rename_var',"]","",.) in `anything'
		capture noisily replace `rename_var' = subinstr(`rename_var',"*","",.) in `anything'
		
		foreach var_begin_number of numlist 0/9 {
			capture noisily replace `rename_var' = "proxy_" + `rename_var' if substr(`rename_var',1,1) == "`var_begin_number'" in `anything'
			}
				
		capture noisily replace `rename_var' = subinstr(`rename_var',"#","number",.) in `anything'
		capture noisily replace `rename_var' = lower(`rename_var') in `anything'
		capture noisily local newname = `rename_var' in `anything'
		capture noisily rename `rename_var' `newname'
		}
		drop in 1/`anything'


end
