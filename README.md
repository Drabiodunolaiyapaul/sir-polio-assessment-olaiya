
# 📘 SIR Polio Skills Assessment – POLIS API Tools


This repository contains a complete modular toolkit for accessing WHO’s **POLIS API**, created for the **2025 TEPHINET SIR Polio Skills Assessment**.
It demonstrates competency in:

* Modular R programming
* API integration
* GitHub Flow
* Reproducible analytics
* EnvSample data download
* Visualization and summary tables



# Table of Contents

1. [Overview](#overview)
2. [Repository Structure](#repository-structure)
3. [Security Measures – API Tokens](#security-measures--api-tokens)
4. [Quick Start Instructions](#quick-start-instructions)
5. [Core Functions](#core-functions)
6. [Test Scripts](#test-scripts)
7. [Environmental Surveillance Summary Table (Task 4)](#environmental-surveillance-summary-table-task-4)
8. [ES Sites Plot – Trend by Year (Task 5)](#es-sites-plot--trend-by-year-task-5)
9. [GitHub Flow Implementation](#github-flow-implementation)
10. [Task Completion Status](#task-completion-status)
11. [Appendix A – Example R Code](#appendix-a--example-r-code)
12. [Author](#author)

---

# Overview

This documentation provides a detailed overview of the POLIS API tools created for the 2025 TEPHINET SIR Polio Skills Assessment.
The project demonstrates:

* Modular software development
* API communication
* GitHub Flow (branches → PRs → merge)
* Data processing and cleaning
* Surveillance visualization
* Reproducible workflows and testing

---

# Repository Structure

```
R/
 ├── get_polis_data.R              # General API helper
 ├── polis_api_general.R           # Generalized API request function
 ├── download_envsample_all.R      # Paginated EnvSample downloader
 ├── ensample_sites_flextable.R    # ES summary table generator
 └── es_sites_plot.R               # ES plotting function

scripts/
 ├── test_get_polis_data.R         # Tests API connection
 ├── test_es_flextable.R           # Tests ES table generation
 └── test_es_sites_plot.R          # Tests ES visualization

data/     # local storage (excluded via .gitignore)
outputs/  # optional figures or tables
```

---

# Security Measures – API Tokens

🚨 **Never upload your real POLIS API token.**

* All scripts use placeholders:

```r
token <- "REPLACE_WITH_YOUR_TOKEN"
```

* `.gitignore` prevents committing:

  * `data/`
  * `outputs/`
  * tokens
  * temporary files

This fully aligns with CDC/WHO security expectations.

---

# Quick Start Instructions

### 1. Clone the repository:

```bash
git clone https://github.com/Drabiodunolaiyapaul/sir-polio-assessment-olaiya.git
```

### 2. Install dependencies:

```r
install.packages(c("httr", "jsonlite", "dplyr", "tibble", "ggplot2", "flextable"))
```

### 3. Run a basic API test:

```r
source("R/get_polis_data.R")

token <- "REPLACE_WITH_YOUR_TOKEN"
df <- get_polis_data("EnvSample", n = 5, token = token)

print(df)
```

---

# Core Functions

## 1. General POLIS API Function

A reusable helper for **any** POLIS endpoint:

```r
source("R/polis_api_general.R")

df <- get_polis_data(
  endpoint = "Case",
  n = 100,
  token = token
)
```

---

## 2. Full EnvSample Download (Pagination)

Downloads the **complete** `EnvSample` table:

```r
source("R/download_envsample_all.R")

df <- download_envsample_all(token = token)
write.csv(df, "data/EnvSample_full.csv", row.names = FALSE)
```

---

## 3. ES Summary Flextable

Generates a **publication-ready summary** of unique ES sites:

```r
source("R/ensample_sites_flextable.R")

ft <- make_es_sites_flextable(env_df)
ft
```

---

## 4. ES Sites Plotting Function

Plots **active ES sites by country and year**:

```r
source("R/es_sites_plot.R")

p <- plot_es_sites_by_country_year(env_df)
p
```

---

# Test Scripts

| Script                  | Purpose                   |
| ----------------------- | ------------------------- |
| `test_get_polis_data.R` | Tests API helper          |
| `test_es_flextable.R`   | Displays ES summary table |
| `test_es_sites_plot.R`  | Produces ES visualization |

These ensure **function correctness** and **reproducibility**.

---

# Environmental Surveillance Summary Table (Task 4)

The flextable summarizes:

* WHO Region
* Country
* Number of unique ES sites

Ideal for:

* Reports
* Presentations
* Country profiles
* Surveillance dashboards

---

# ES Sites Plot – Trend by Year (Task 5)

A ggplot visualization showing **temporal patterns** in ES site activity:

* Tracks changes in the number of active sites
* Comparison across multiple countries
* Useful for program planning & trend analysis

---

# GitHub Flow Implementation

This project follows **modern software development workflow**:

* Issues → Feature branches
* Commit locally
* Publish branch
* Create Pull Request
* Peer-review
* Merge to main
* Add collaborators (Mervin & JP)

This workflow is **required by CDC’s internal Dev team**.

---

# Task Completion Status

| Task                       | Status     | Notes                        |
| -------------------------- | ---------- | ---------------------------- |
| 1. GitHub repository setup | ✔ Complete | Feature branches + PRs       |
| 2. General API function    | ✔ Complete | get_polis_data()             |
| 3. Full EnvSample download | ✔ Complete | Pagination implemented       |
| 4. ES summary flextable    | ✔ Complete | Flextable tested             |
| 5. ES sites plot           | ✔ Complete | Visualization tested         |
| 6. Add collaborators       | ✔ Complete | @mcuadera & @bigouetjp added |

---

# Appendix A – Example R Code

```r
token <- "REPLACE_WITH_YOUR_TOKEN"

# Case table sample
df_case <- get_polis_data("Case", n = 100, token = token)
head(df_case)

# Full ES dataset
env_df <- download_envsample_all(token)

# Summary table
ft <- make_es_sites_flextable(env_df)

# Plot
plot_es_sites_by_country_year(env_df)
```



Author

**Dr. Abiodun Olaiya Paul**
TEPHINET SIR Polio Skills Assessment (2025)
📧 Email: drabiodunop@yahoo.com; drabiodunop@gmail.com


