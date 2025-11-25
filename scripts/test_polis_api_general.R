# test_polis_api_general.R
# Script to test the general POLIS API function

# Load the general function
source("R/polis_api_general.R")

# Insert your token HERE when running locally (NEVER commit it)
token <- "REPLACE_WITH_YOUR_TOKEN"

# Test 1: get 5 rows from EnvSample
cat("---- Test 1: EnvSample (5 rows) ----\n")
envsample_test <- get_polis_data(
  endpoint = "EnvSample",
  n = 5,
  token = token
)
print(envsample_test)

# Test 2: get 5 rows from Case table (if available)
cat("---- Test 2: Case (5 rows) ----\n")
case_test <- get_polis_data(
  endpoint = "Case",
  n = 5,
  token = token
)
print(case_test)
