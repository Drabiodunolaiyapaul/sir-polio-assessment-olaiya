# test_get_polis_data.R
# Script to test the get_polis_data() function

# 1. Load the function
source("R/get_polis_data.R")

# 2. Replace with your actual token when testing
token <-"REPLACE_WITH_YOUR_TOKEN"


# 3. Download 10 rows from EnvSample
test_df <- get_polis_data("EnvSample", n = 10, token = token)

# 4. Print the result
print(test_df)
