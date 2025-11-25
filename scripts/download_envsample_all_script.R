# download_envsample_all_script.R
# Script to download all EnvSample data and save as CSV locally

# 1. Load the pagination function
source("R/download_envsample_all.R")

# 2. Insert your POLIS token here WHEN running locally
# IMPORTANT: Do NOT commit your real token to GitHub
token <- "REPLACE_WITH_YOUR_TOKEN"
# 3. Download all EnvSample data
# You can adjust page_size if needed (1000 is a good default)
envsample_all <- download_envsample_all(token = token, page_size = 1000)

# 4. Print basic information
print(envsample_all)
cat("Total rows downloaded: ", nrow(envsample_all), "\n")

# 5. Ensure data folder exists
if (!dir.exists("data")) dir.create("data")

# 6. Save locally (this file is ignored by .gitignore)
write.csv(
  envsample_all,
  file = "data/EnvSample_full.csv",
  row.names = FALSE
)
