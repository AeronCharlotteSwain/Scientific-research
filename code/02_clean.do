*==============================================================================
* 02_clean.do — merge sources into one exporter-importer-year panel
* Output: $CLEAN/gravity_panel.dta
*==============================================================================

* use "$CLEAN/trade_raw.dta", clear
* merge 1:1 exporter importer year using "$CLEAN/gravity_raw.dta", keep(match master) nogen

*--- Checks: the script should STOP if any of these fail -----------------------
* isid exporter importer year                // one row per pair-year
* assert trade >= 0 if !missing(trade)       // no negative flows
* count if trade == 0                        // report zeros; KEEP them (the point of PPML)
* misstable summarize                        // know where the gaps are before estimating

* Square the panel if missing pairs mean zero trade (justify this in the paper):
* fillin exporter importer year
* replace trade = 0 if _fillin == 1
* drop _fillin

* label variable trade   "Bilateral trade flow (USD)"
* label variable ln_dist "Log distance"
* label variable rta     "Regional trade agreement (0/1)"

* compress
* save "$CLEAN/gravity_panel.dta", replace
