# Data sources

Raw files are not stored in Git. Anyone (including future you) must be able to rebuild `data/raw/` from this table.

| File in `data/raw/` | Source | URL | Version / vintage | Downloaded | Notes |
|---|---|---|---|---|---|
| trade_flows.csv | UN Comtrade | https://comtradeplus.un.org | HS 2017, annual | YYYY-MM-DD | Reporter or mirror flows? |
| cepii_gravity.dta | CEPII Gravity | https://www.cepii.fr | | YYYY-MM-DD | |
| wdi.csv | World Bank WDI | https://databank.worldbank.org | | YYYY-MM-DD | |

## Known quirks
- (record reporter vs. mirror discrepancies, HS revision breaks, missing years here)
