*==============================================================================
* 01_import.do — read raw files, save as .dta. No cleaning here.
* Record every source (URL, download date, version) in data/README.md.
*==============================================================================

* Trade flows (e.g. UN Comtrade / BACI)
* import delimited "$RAW/trade_flows.csv", clear varnames(1)
* save "$CLEAN/trade_raw.dta", replace

* Gravity covariates (e.g. CEPII Gravity: distance, contiguity, language, colony, RTA)
* use "$RAW/cepii_gravity.dta", clear      // rename to the version you download
* save "$CLEAN/gravity_raw.dta", replace

* Macro controls (e.g. World Bank WDI: GDP, population)
* import delimited "$RAW/wdi.csv", clear varnames(1)
* save "$CLEAN/wdi_raw.dta", replace
