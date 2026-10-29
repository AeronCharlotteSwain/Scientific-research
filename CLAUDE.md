# Instructions for Claude in this repo

## Project
Empirical international trade research by Andy (Lê Nhật Anh), Van Lang University.
Method: structural gravity, PPML via `ppmlhdfe` in Stata.

## Conventions
- Pipeline lives in `code/`, numbered 01–04, run only through `master.do`.
- Paths use globals from `master.do` ($RAW, $CLEAN, $TABLES, ...). Never hard-code paths.
- Trade enters in levels for PPML; keep zero flows.
- Default fixed effects: exporter-year + importer-year; add pair FE for policy variables.
- Cluster standard errors by country pair unless there is a stated reason not to.
- Tables are exported with `esttab`; never write coefficients into text by hand.

## Working rules
- Andy runs Stata himself. Write and debug do-files; do not claim results that come from no log.
- Never fabricate citations. Every reference must be a real paper that can be checked.
- Do not commit data files; record sources in `data/README.md` instead.
- Commit messages: what changed and why, one line plus detail if needed.
