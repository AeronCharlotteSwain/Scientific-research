*==============================================================================
* 03_estimate.do — structural gravity, PPML (Santos Silva & Tenreyro 2006)
* Trade enters in LEVELS, not logs: zeros are kept, heteroskedasticity handled.
*==============================================================================

use "$CLEAN/gravity_panel.dta", clear

egen exp_year = group(exporter year)     // outward multilateral resistance
egen imp_year = group(importer year)     // inward multilateral resistance
egen pair     = group(exporter importer)

eststo clear

* (1) Baseline: time-invariant gravity variables identified
eststo m1: ppmlhdfe trade ln_dist contig comlang_off colony rta, ///
    absorb(exp_year imp_year) vce(cluster pair)

* (2) Pair FE: absorbs distance etc., identifies only time-varying policy (rta)
*     Preferred for policy effects (Baier & Bergstrand 2007 logic)
eststo m2: ppmlhdfe trade rta, ///
    absorb(exp_year imp_year pair) vce(cluster pair)

* Robustness ideas: lagged rta, sub-periods, drop zeros, OLS on ln(trade) for comparison.
* Watch the log for "observations dropped (singletons / separation)" and report it.
