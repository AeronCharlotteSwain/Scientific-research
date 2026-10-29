# Scientific-research

Empirical trade research: structural gravity models estimated with PPML in Stata.

## Structure

```
code/            Stata do-files, run in order by master.do
  master.do      the only file you run
  01_import.do   raw files -> .dta, no cleaning
  02_clean.do    merge, checks, build the panel
  03_estimate.do PPML estimation
  04_tables.do   export tables to Word
data/raw/        original downloads (not in Git; sources in data/README.md)
data/clean/      generated datasets (not in Git; rebuilt by code)
output/tables/   regression tables (tracked)
output/figures/  charts (tracked)
output/logs/     Stata logs (not in Git)
draft/           paper drafts
literature/      notes on papers (PDFs stay in Zotero)
```

## How to run

1. Put the raw files in `data/raw/`, as listed in `data/README.md`.
2. In `code/master.do`, set `global ROOT` to this folder's path on your machine.
3. Run `master.do`. Packages install automatically the first time.

## Rules

- Never edit files in `data/raw/`. All changes happen in code.
- Every number in the paper comes from `output/`, never typed by hand.
- Commit after each meaningful change, with a message saying what changed and why.
