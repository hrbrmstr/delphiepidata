httr::user_agent(
  sprintf(
    "delphiepidata package v%s: (<%s>)",
    utils::packageVersion("delphiepidata"),
    utils::packageDescription("delphiepidata")$URL
  )
) -> .DELPHI_UA

# A module for DELPHI's Epidata API.
#
# https://github.com/cmu-delphi/delphi-epidata

# API base url
BASE_URL <- 'https://delphi.midas.cs.cmu.edu/epidata/api.php'

# Helper function to cast values and/or ranges to strings
.listitem <- function(value) {

  if(is.list(value) && 'from' %in% names(value) && 'to' %in% names(value)) {
    return(paste0(toString(value$from), '-', toString(value$to)))
  } else {
    return(toString(value))
  }

}

# Helper function to build a list of values and/or ranges
.list <- function(values) {

  if(!is.list(values) || ('from' %in% names(values) && 'to' %in% names(values))) {
    values <- list(values)
  }

  return(

    paste(
      vapply(values, .listitem, character(1)),
      # sapply(values, .listitem),
      collapse = ','
    )

  )

}

# Helper function to request and parse epidata
.request <- function(params) {
  # API call
  return(
    httr::content(
      httr::GET(
        url = BASE_URL,
        query = params,
        .DELPHI_UA
      ),
      as = 'parsed'
    )
  )
}

# Build a `range` object (ex: dates/epiweeks)
range <- function(from, to) {

  if(to <= from) {
    temp <- to
    to <- from
    from <- temp
  }

  return(
    list(
      from = from,
      to = to
    )
  )

}
