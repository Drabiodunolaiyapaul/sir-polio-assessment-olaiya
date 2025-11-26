# SIR Polio Skills Assessment – API Data Retrieval

This repository contains the code for downloading and managing POLIS API data for the 2025 TEPHINET SIR Polio Skills Assessment.

## 📁 Repository Structure

- **scripts/**
  - `get_polis_data.R` – General API function for single-page retrieval
  - `download_envsample_all.R` – Pagination function for full dataset download
  - `test_get_polis_data.R` – Basic test script

- **data/** (ignored by Git)
  - Contains *local* CSV output generated during testing (e.g., `EnvSample_full.csv`)

## ⚠️ Security Notice — API Tokens

- ❗ **Never commit real tokens**
- Use `"REPLACE_WITH_YOUR_TOKEN"` inside scripts
- `.gitignore` protects your data folder and output files

## 🚀 How to Download EnvSample Data

1. Run the pagination script:
   ```r
   source("scripts/download_envsample_all.R")
   envsample_all <- download_envsample_all(token = "YOUR_TOKEN_HERE", page_size = 1000)

   Environmental Surveillance (ES) Summary Table (Task 4)

This repository includes a function to generate a summary table of unique Environmental Surveillance (ES) sites by Region and Country.
The function returns a formatted flextable for reporting.

Function:
make_es_sites_flextable(df)

Output:
A flextable showing each Region + Country and the total number of ES sites.

ES Sites Plotting Function (Task 5)

A plotting function was added to visualize the number of active ES sites by country and year using EnvSample data.

Function:
plot_es_sites_by_country_year(df)

Output:
A ggplot line chart showing active ES site counts across time for all countries that appear in the dataset.

Test Scripts

Two test scripts were created to demonstrate usage:

scripts/test_es_flextable.R

scripts/test_es_sites_plot.R

These scripts show how to load functions, download sample data via the API, and produce ES summary tables and plots.

⚠️ Note on Tokens

Your POLIS API token must never be committed to GitHub.
All test scripts use placeholders like:
token <- "REPLACE_WITH_YOUR_TOKEN"

Added Files

Located in:
R/
  |-- ensample_sites_flextable.R
  |-- es_sites_plot.R

scripts/
  |-- test_es_flextable.R
  |-- test_es_sites_plot.R


