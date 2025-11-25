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
