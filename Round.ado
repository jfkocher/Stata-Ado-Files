*! version 1.0 \ JFK 2018-12-20
set type double

capture program drop pct_round

program define pct_round
	version 14
	syntax varlist
	
foreach varname in `varlist' {	
quietly tostring `varname', gen(score1) force


quietly foreach n in 5 6 7 8 9 {
replace `varname'=`varname' + 0.01 if substr(score1,4,1)=="`n'" & substr(score1,1,1)=="." & score1!="."
replace `varname'=`varname' + 0.01 if substr(score1,5,1)=="`n'" & substr(score1,2,1)=="." & score1!="."
replace `varname'=`varname' + 0.01 if substr(score1,6,1)=="`n'" & substr(score1,3,1)=="." & score1!="."
}

quietly gen score2=`varname'
quietly tostring score2, replace force

quietly replace score2=substr(score2,1,5) if substr(score2,3,1)=="."  & score2!="."
quietly replace score2=substr(score2,1,4) if substr(score2,2,1)=="."  & score2!="."
quietly replace score2=substr(score2,1,3) if substr(score2,1,1)=="."  & score2!="."

quietly replace score2=score2 + ".00" if strlen(score2)==1 & substr(score1,1,1)!="."   & score1!="."
quietly replace score2="0" + score2 if substr(score2,1,1)=="."   & score1!="."
quietly replace score2=score2 + "0" if strlen(score2)==3 & substr(score2,2,1)=="."   & score1!="."
quietly replace score2=score2 + ".00" if strlen(score2)==3 & score2=="100"   & score1!="."
quietly replace score2=score2 + ".00" if strlen(score2)==2 & (substr(score1,1,1)!="." | substr(score1,2,1)!=".")   & score1!="."
quietly replace score2=score2 + "0" if strlen(score2)==3 & substr(score1,2,1)=="."   & score1!="."
quietly replace score2=score2 + "0" if strlen(score2)==4 & substr(score1,3,1)=="."   & score1!="."

quietly drop `varname' score1
quietly rename score2 `varname'

}
end
