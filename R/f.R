#' Fetch FluView data
#'
#' @param regions a `list` of [delphi_regions]
#' @param epiweeks a `list` of epiweeks (format for an epiweek is `YYYYWW`)
#' @param issues a `list` of epiweeks (format for an epiweek is `YYYYWW`)
#' @param lag a number of weeks
#' @param auth password for private imputed data
#' @export
fluview <- function(regions, epiweeks, issues, lag, auth) {

  # Check parameters
  if(missing(regions) || missing(epiweeks)) {
    stop('`regions` and `epiweeks` are both required')
  }

  if(!missing(issues) && !missing(lag)) {
    stop('`issues` and `lag` are mutually exclusive')
  }

  # Set up request
  params <- list(
    source = 'fluview',
    regions = .list(regions),
    epiweeks = .list(epiweeks)
  )

  if (!missing(issues)) params$issues <- .list(issues)

  if (!missing(lag)) params$lag <- lag

  if (!missing(auth)) params$auth <- auth

  # Make the API call
  return(.request(params))

}

#' Fetch FluView virological data
#'
#' @param regions a `list` of [delphi_regions]
#' @param epiweeks a `list` of epiweeks (format for an epiweek is `YYYYWW`)
#' @param issues a `list` of epiweeks (format for an epiweek is `YYYYWW`)
#' @param lag a number of weeks
#' @export
fluview_clinical <- function(regions, epiweeks, issues, lag) {
  # Check parameters
  if(missing(regions) || missing(epiweeks)) {
    stop('`regions` and `epiweeks` are both required')
  }
  if(!missing(issues) && !missing(lag)) {
    stop('`issues` and `lag` are mutually exclusive')
  }
  # Set up request
  params <- list(
    source = 'fluview_clinical',
    regions = .list(regions),
    epiweeks = .list(epiweeks)
  )
  if(!missing(issues)) {
    params$issues <- .list(issues)
  }
  if(!missing(lag)) {
    params$lag <- lag
  }
  # Make the API call
  return(.request(params))
}

#' Fetch FluSurv data
#'
#' @param locations a `list` of [delphi_regions] and/or [dephi_states]
#' @param epiweeks a `list` of epiweeks (format for an epiweek is `YYYYWW`)
#' @param issues a `list` of epiweeks (format for an epiweek is `YYYYWW`)
#' @param lag a number of weeks
#' @export
flusurv <- function(locations, epiweeks, issues, lag) {
  # Check parameters
  if(missing(locations) || missing(epiweeks)) {
    stop('`locations` and `epiweeks` are both required')
  }
  if(!missing(issues) && !missing(lag)) {
    stop('`issues` and `lag` are mutually exclusive')
  }
  # Set up request
  params <- list(
    source = 'flusurv',
    locations = .list(locations),
    epiweeks = .list(epiweeks)
  )
  if(!missing(issues)) {
    params$issues <- .list(issues)
  }
  if(!missing(lag)) {
    params$lag <- lag
  }
  # Make the API call
  return(.request(params))
}

#' Fetch Google Flu Trends data
#'
#' @param locations a `list` of [delphi_regions], [dephi_states], and/or [delphi_cities]
#' @param epiweeks a `list` of epiweeks (format for an epiweek is `YYYYWW`)
#' @export
gft <- function(locations, epiweeks) {
  # Check parameters
  if(missing(locations) || missing(epiweeks)) {
    stop('`locations` and `epiweeks` are both required')
  }
  # Set up request
  params <- list(
    source = 'gft',
    locations = .list(locations),
    epiweeks = .list(epiweeks)
  )
  # Make the API call
  return(.request(params))
}

#' Fetch Google Health Trends data
#'
#' @param auth authentication token
#' @param locations a `list` of [delphi_regions] and/or [delphi_cities]
#' @param epiweeks a `list` of epiweeks (format for an epiweek is `YYYYWW`)
#' @param query google query
#' @export
ght <- function(auth, locations, epiweeks, query) {
  # Check parameters
  if(missing(auth) || missing(locations) || missing(epiweeks) || missing(query)) {
    stop('`auth`, `locations`, `epiweeks`, and `query` are all required')
  }
  # Set up request
  params <- list(
    source = 'ght',
    auth = auth,
    locations = .list(locations),
    epiweeks = .list(epiweeks),
    query = query
  )
  # Make the API call
  return(.request(params))
}

#' Fetch HealthTweets data
#'
#' @param auth twitter auth token
#' @param locations a `list` of [delphi_regions] and/or [delphi_cities]
#' @param dates a `list` of dates (`YYYYMMDD` format)
#' @param epiweeks a `list` of epiweeks (format for an epiweek is `YYYYWW`)
#' @export
twitter <- function(auth, locations, dates, epiweeks) {
  # Check parameters
  if(missing(auth) || missing(locations)) {
    stop('`auth` and `locations` are both required')
  }
  if(!xor(missing(dates), missing(epiweeks))) {
    stop('exactly one of `dates` and `epiweeks` is required')
  }
  # Set up request
  params <- list(
    source = 'twitter',
    auth = auth,
    locations = .list(locations)
  )
  if(!missing(dates)) {
    params$dates <- .list(dates)
  }
  if(!missing(epiweeks)) {
    params$epiweeks <- .list(epiweeks)
  }
  # Make the API call
  return(.request(params))
}

#' Fetch Wikipedia access data
#'
#' @param articles a `list` of [delphi_articles]
#' @param dates a `list` of dates (`YYYYMMDD` format)
#' @param epiweeks a `list` of epiweeks (format for an epiweek is `YYYYWW`)
#' @param hours a `list` of hours
#' @export
wiki <- function(articles, dates, epiweeks, hours) {
  # Check parameters
  if(missing(articles)) {
    stop('`articles` is required')
  }
  if(!xor(missing(dates), missing(epiweeks))) {
    stop('exactly one of `dates` and `epiweeks` is required')
  }
  # Set up request
  params <- list(
    source = 'wiki',
    articles = .list(articles)
  )
  if(!missing(dates)) {
    params$dates <- .list(dates)
  }
  if(!missing(epiweeks)) {
    params$epiweeks <- .list(epiweeks)
  }
  if(!missing(hours)) {
    params$hours <- .list(hours)
  }
  # Make the API call
  return(.request(params))
}

#' Fetch CDC page hits
#'
#' @param auth auth token
#' @param epiweeks a `list` of epiweeks (format for an epiweek is `YYYYWW`)
#' @param locations a `list` of [delphi_regions] and/or [dephi_states]
#' @export
cdc <- function(auth, epiweeks, locations) {
  # Check parameters
  if(missing(auth) || missing(epiweeks) || missing(locations)) {
    stop('`auth`, `epiweeks`, and `locations` are all required')
  }
  # Set up request
  params <- list(
    source = 'cdc',
    auth = auth,
    epiweeks = .list(epiweeks),
    locations = .list(locations)
  )
  # Make the API call
  return(.request(params))
}

#' Fetch Quidel data
#'
#' @param auth auth token
#' @param epiweeks a `list` of epiweeks (format for an epiweek is `YYYYWW`)
#' @param locations a `list` of [delphi_regions] and/or [dephi_states]
#' @export
quidel <- function(auth, epiweeks, locations) {
  # Check parameters
  if(missing(auth) || missing(epiweeks) || missing(locations)) {
    stop('`auth`, `epiweeks`, and `locations` are all required')
  }
  # Set up request
  params <- list(
    source = 'quidel',
    auth = auth,
    epiweeks = .list(epiweeks),
    locations = .list(locations)
  )
  # Make the API call
  return(.request(params))
}

#' Fetch NoroSTAT data (point data, no min/max)
#'
#' @param auth auth token
#' @param location a single [delphi_regions] and/or [dephi_states]
#' @param epiweeks a `list` of epiweeks (format for an epiweek is `YYYYWW`)
#' @export
norostat <- function(auth, location, epiweeks) {
  # Check parameters
  if(missing(auth) || missing(location) || missing(epiweeks)) {
    stop('`auth`, `location`, and `epiweeks` are all required')
  }
  # Set up request
  params <- list(
    source = 'norostat',
    auth = auth,
    location = location,
    epiweeks = .list(epiweeks)
  )
  # Make the API call
  return(.request(params))
}

#' Fetch NoroSTAT metadata
#'
#' @param auth auth token
#' @export
meta_norostat <- function(auth) {
  # Check parameters
  if(missing(auth)) {
    stop('`auth` is required')
  }
  # Set up request
  params <- list(
    source = 'meta_norostat',
    auth = auth
  )
  # Make the API call
  return(.request(params))
}

#' Fetch NIDSS flu data
#'
#' @param regions a `list` of [delphi_regions]
#' @param epiweeks a `list` of epiweeks (format for an epiweek is `YYYYWW`)
#' @param issues a `list` of issues
#' @param lag a number of weeks
#' @export
nidss_flu <- function(regions, epiweeks, issues, lag) {
  # Check parameters
  if(missing(regions) || missing(epiweeks)) {
    stop('`regions` and `epiweeks` are both required')
  }
  if(!missing(issues) && !missing(lag)) {
    stop('`issues` and `lag` are mutually exclusive')
  }
  # Set up request
  params <- list(
    source = 'nidss_flu',
    regions = .list(regions),
    epiweeks = .list(epiweeks)
  )
  if(!missing(issues)) {
    params$issues <- .list(issues)
  }
  if(!missing(lag)) {
    params$lag <- lag
  }
  # Make the API call
  return(.request(params))
}

#' Fetch NIDSS dengue data
#'
#' @param locations a `list` of [delphi_regions] and/or [dephi_states]
#' @param epiweeks a `list` of epiweeks (format for an epiweek is `YYYYWW`)
#' @export
nidss_dengue <- function(locations, epiweeks) {
  # Check parameters
  if(missing(locations) || missing(epiweeks)) {
    stop('`locations` and `epiweeks` are both required')
  }
  # Set up request
  params <- list(
    source = 'nidss_dengue',
    locations = .list(locations),
    epiweeks = .list(epiweeks)
  )
  # Make the API call
  return(.request(params))
}

#' Fetch Delphi's forecast
#'
#' @param system (not sure)
#' @param epiweek an epiweek (fomat `YYYYWW`)
#' @export
delphi <- function(system, epiweek) {
  # Check parameters
  if(missing(system) || missing(epiweek)) {
    stop('`system` and `epiweek` are both required')
  }
  # Set up request
  params <- list(
    source = 'delphi',
    system = system,
    epiweek = epiweek
  )
  # Make the API call
  return(.request(params))
}

#' Fetch Delphi's digital surveillance sensors
#'
#' @param auth auth token
#' @param names sensor name?
#' @param locations a `list` of [delphi_regions] and/or [dephi_states]
#' @param epiweeks a `list` of epiweeks (format for an epiweek is `YYYYWW`)
#' @export
sensors <- function(auth, names, locations, epiweeks) {
  # Check parameters
  if(missing(auth) || missing(names) || missing(locations) || missing(epiweeks)) {
    stop('`auth`, `names`, `locations`, and `epiweeks` are all required')
  }
  # Set up request
  params <- list(
    source = 'sensors',
    auth = auth,
    names = .list(names),
    locations = .list(locations),
    epiweeks = .list(epiweeks)
  )
  # Make the API call
  return(.request(params))
}

#' Fetch Delphi's digital surveillance sensors
#'
#' @param auth auth token
#' @param names sensor names?
#' @param locations a `list` of [delphi_regions] and/or [dephi_states]
#' @param epiweeks a `list` of epiweeks (format for an epiweek is `YYYYWW`)
#' @export
dengue_sensors <- function(auth, names, locations, epiweeks) {
  # Check parameters
  if(missing(auth) || missing(names) || missing(locations) || missing(epiweeks)) {
    stop('`auth`, `names`, `locations`, and `epiweeks` are all required')
  }
  # Set up request
  params <- list(
    source = 'dengue_sensors',
    auth = auth,
    names = .list(names),
    locations = .list(locations),
    epiweeks = .list(epiweeks)
  )
  # Make the API call
  return(.request(params))
}

#' Fetch Delphi's wILI nowcast
#'
#' @param locations a `list` of [delphi_regions] and/or [dephi_states]
#' @param epiweeks a `list` of epiweeks (format for an epiweek is `YYYYWW`)
#' @export
nowcast <- function(locations, epiweeks) {
  # Check parameters
  if(missing(locations) || missing(epiweeks)) {
    stop('`locations` and `epiweeks` are both required')
  }
  # Set up request
  params <- list(
    source = 'nowcast',
    locations = .list(locations),
    epiweeks = .list(epiweeks)
  )
  # Make the API call
  return(.request(params))
}

#' Fetch Delphi's PAHO Dengue nowcast
#'
#' @param locations a `list` of [delphi_regions] and/or [dephi_states]
#' @param epiweeks a `list` of epiweeks (format for an epiweek is `YYYYWW`)
#' @export
dengue_nowcast <- function(locations, epiweeks) {
  # Check parameters
  if(missing(locations) || missing(epiweeks)) {
    stop('`locations` and `epiweeks` are both required')
  }
  # Set up request
  params <- list(
    source = 'dengue_nowcast',
    locations = .list(locations),
    epiweeks = .list(epiweeks)
  )
  # Make the API call
  return(.request(params))
}

#' Fetch API metadata
#'
#' @export
meta <- function() {
  return(.request(list(source='meta')))
}

