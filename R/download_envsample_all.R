library(httr)
library(jsonlite)
library(tibble)

#' Download all EnvSample records from POLIS using pagination
#'
#' @param token Your POLIS API token as a character string
#' @param page_size Number of rows to request per page (default 1000)
#'
#' @return A tibble with all EnvSample records
#'
download_envsample_all <- function(token, page_size = 1000) {
  
  if (missing(token)) stop("Please provide your POLIS API token")
  
  base_url  <- "https://extranet.who.int/polis/api/v2"
  endpoint  <- "EnvSample"
  
  all_pages <- list()
  skip      <- 0
  page      <- 1
  
  repeat {
    
    url <- paste0(
      base_url, "/", endpoint,
      "?$top=", page_size,
      "&$skip=", skip
    )
    
    response <- GET(
      url,
      add_headers("authorization-token" = token)
    )
    
    status <- status_code(response)
    
    if (status != 200) {
      message("Stopping download: API returned status ", status,
              " at page ", page, " (skip = ", skip, ").")
      break  # exits the pagination loop safely
    }
    
    content_json <- content(response, "text", encoding = "UTF-8")
    content_list <- fromJSON(content_json)
    
    this_page <- content_list$value
    
    if (length(this_page) == 0) {
      message("No more data. Stopping at page ", page, ".")
      break
    }
    
    all_pages[[page]] <- as_tibble(this_page)
    
    message("Downloaded page ", page,
            " (rows so far: ",
            sum(vapply(all_pages, nrow, integer(1))), ")")
    
    skip <- skip + page_size
    page <- page + 1
  }
  
  result <- do.call(rbind, all_pages)
  as_tibble(result)
}
