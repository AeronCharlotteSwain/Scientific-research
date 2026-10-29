*==============================================================================
* 04_tables.do — export results straight to Word. Never retype a coefficient.
* Requires the estimates stored by 03_estimate.do in the same Stata session.
*==============================================================================

esttab m1 m2 using "$TABLES/table1_baseline.rtf", replace ///
    b(3) se(3) star(* 0.10 ** 0.05 *** 0.01) ///
    label nogaps compress ///
    mtitles("Exp-yr + Imp-yr FE" "+ Pair FE") ///
    stats(N r2_p, labels("Observations" "Pseudo R-sq.") fmt(%12.0fc %9.3f)) ///
    addnotes("PPML. Standard errors clustered by country pair in parentheses.")
