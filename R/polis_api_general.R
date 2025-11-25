# polis_api_general.R
# General helper to get data from the POLIS API

# Load required packages ----
library(httr)
library(jsonlite)
library(tibble)

#' Get data from the POLIS API (general function)
#'
#' @param endpoint Character. POLIS endpoint name, e.g. "EnvSample", "Case", "Activity".
#' @param n Integer. Number of rows to return (default = 100).
#' @param token Character. Your POLIS API token (DO NOT hard-code it in this file).
#'
#' @return A tibble with up to n rows from the requested endpoint.
#' @examples
#' \dontrun{
#'   # Example (do NOT run with real token in shared code)
#'   df <- get_polis_data("EnvSample", n = 10, token = "YOUR_TOKEN_HERE")
#' }
#'
get_polis_data <- function(endpoint, n = 100, token) {
  
  # Basic checks ----
  if (missing(endpoint) || !nzchar(endpoint)) {
    stop("Please provide an endpoint, e.g. 'EnvSample'.")
  }
  
  if (missing(token) || !nzchar(token)) {
    stop("Please provide your POLIS API token.")
  }
  
  if (!is.numeric(n) || n <= 0) {
    stop("Argument 'n' must be a positive number.")
  }
  
  # Base URL for POLIS API (from API help pages) ----
  base_url <- "https://extranet.who.int/polis/api/v2"
  
  # Build URL using OData-style $top parameter ----
  # Example result: https://extranet.who.int/polis/api/v2/EnvSample?$top=10
  url <- paste0(base_url, "/", endpoint, "?$top=", n)
  
  # Perform API request ----
  response <- GET(
    url,
    add_headers("authorization-token" = token)
  )
  
  status <- status_code(response)
  
  if (status != 200) {
    stop("API request failed. Status code: ", status)
  }
  
  # Parse JSON content ----
  content_json  <- content(response, "text", encoding = "UTF-8")
  content_list  <- fromJSON(content_json)
  
  # POLIS returns rows under the 'value' element ----
  if (!"value" %in% names(content_list)) {
    stop("Unexpected API response structure: 'value' field not found.")
  }
  
  tibble::as_tibble(content_list$value)
}
