library(httr)
library(jsonlite)
library(tibble)

#' Get data from the POLIS API
#'
#' @param endpoint Character string, e.g. "EnvSample", "Case"
#' @param n Number of rows to return (default 100)
#' @param token Your POLIS API token as a character string
#'
#' @return A tibble with the requested rows from the endpoint
#'
get_polis_data <- function(endpoint, n = 100, token) {
  
  if (missing(endpoint)) stop("Please provide an endpoint, e.g. 'EnvSample'")
  if (missing(token)) stop("Please provide your POLIS API token")
  
  # Correct POLIS base URL (as in API1–3)
  base_url <- "https://extranet.who.int/polis/api/v2"
  
  # IMPORTANT: use the OData-style parameter $top=
  # This builds e.g.: https://.../EnvSample?$top=10
  url <- paste0(base_url, "/", endpoint, "?$top=", n)
  
  # Call the API
  response <- GET(
    url,
    add_headers("authorization-token" = token)
  )
  
  status <- status_code(response)
  
  if (status != 200) {
    stop("API request failed. Status code: ", status)
  }
  
  # Parse JSON response
  content_json <- content(response, "text", encoding = "UTF-8")
  content_list <- fromJSON(content_json)
  
  # POLIS returns data under $value
  tibble::as_tibble(content_list$value)
}
