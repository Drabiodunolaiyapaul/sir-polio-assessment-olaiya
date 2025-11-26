library(dplyr)
library(flextable)

# 1. Load the general API function
source("R/polis_api_general.R")

# 2. Load the flextable function
source("R/ensample_sites_flextable.R")

# 3. Insert your POLIS token
token <- "YOUR_TOKEN_HERE"

# 4. Download sample EnvSample data
cat("Downloading EnvSample test data...\n")
env_df <- get_polis_data(
  endpoint = "EnvSample",
  n        = 200,
  token    = token
)

# 5. Fix column names for YOUR dataset
env_df <- env_df |>
  rename(
    CountryName = Admin0Name   # This is critical
  )

# 6. Build flextable
cat("Building flextable...\n")
ft <- make_es_sites_flextable(env_df)

# 7. Print flextable
ft
