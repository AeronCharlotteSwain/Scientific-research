*==============================================================================
* master.do — runs the whole pipeline: raw data -> clean panel -> estimates -> tables
* Run this file only. Every number in the paper must be reproducible from here.
*==============================================================================
version 17
clear all
set more off
set varabbrev off          // stop Stata silently guessing variable names

*--- 1. Project root: the ONLY line to change on a new machine -----------------
global ROOT "C:/Users/YOURNAME/Documents/scientific-research"

*--- 2. Paths ------------------------------------------------------------------
global CODE    "$ROOT/code"
global RAW     "$ROOT/data/raw"
global CLEAN   "$ROOT/data/clean"
global TABLES  "$ROOT/output/tables"
global FIGS    "$ROOT/output/figures"
global LOGS    "$ROOT/output/logs"

*--- 3. Packages (installed once, skipped afterwards) --------------------------
foreach pkg in ftools reghdfe ppmlhdfe estout {
    capture which `pkg'
    if _rc ssc install `pkg', replace
}

*--- 4. Log --------------------------------------------------------------------
capture log close _all
local stamp = subinstr("`c(current_date)'", " ", "", .)
log using "$LOGS/master_`stamp'.log", replace text name(master)

*--- 5. Switches: 1 = run, 0 = skip --------------------------------------------
local run_import   1
local run_clean    1
local run_estimate 1
local run_tables   1      // needs run_estimate = 1 in the same session

if `run_import'   do "$CODE/01_import.do"
if `run_clean'    do "$CODE/02_clean.do"
if `run_estimate' do "$CODE/03_estimate.do"
if `run_tables'   do "$CODE/04_tables.do"

log close master
