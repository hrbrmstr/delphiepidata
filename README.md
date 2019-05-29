
[![Travis-CI Build
Status](https://travis-ci.org/hrbrmstr/delphiepidata.svg?branch=master)](https://travis-ci.org/hrbrmstr/delphiepidata)
[![Coverage
Status](https://codecov.io/gh/hrbrmstr/delphiepidata/branch/master/graph/badge.svg)](https://codecov.io/gh/hrbrmstr/delphiepidata)
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/delphiepidata)](https://cran.r-project.org/package=delphiepidata)

# delphiepidata

Query the ‘CMU’ ‘DELPHI’ Epidemiological Data ‘API’

## Description

The ‘CMU’ ‘DELPHI’ (<https://delphi.midas.cs.cmu.edu/>) service provides
an aggregated, central point of access to influenza-like illness (‘ILI’)
related data sources. Methods are provided to query all supported
endpoints.

  - DELPHI API docs: <https://github.com/cmu-delphi/delphi-epidata>
  - DELPHI: <https://delphi.midas.cs.cmu.edu/>
  - URL: <https://gitlab.com/hrbrmstr/delphiepidata>
  - BugReports: <https://gitlab.com/hrbrmstr/delphiepidata/issues>

## What’s Inside The Tin

The following functions are implemented:

  - `cdc`: Fetch CDC page hits
  - `delphi`: Fetch Delphi’s forecast
  - `dengue_nowcast`: Fetch Delphi’s PAHO Dengue nowcast
  - `dengue_sensors`: Fetch Delphi’s digital surveillance sensors
  - `flusurv`: Fetch FluSurv data
  - `fluview`: Fetch FluView data
  - `fluview_clinical`: Fetch FluView virological data
  - `gft`: Fetch Google Flu Trends data
  - `ght`: Fetch Google Health Trends data
  - `meta`: Fetch API metadata
  - `meta_norostat`: Fetch NoroSTAT metadata
  - `nidss_dengue`: Fetch NIDSS dengue data
  - `nidss_flu`: Fetch NIDSS flu data
  - `norostat`: Fetch NoroSTAT data (point data, no min/max)
  - `nowcast`: Fetch Delphi’s wILI nowcast
  - `quidel`: Fetch Quidel data
  - `sensors`: Fetch Delphi’s digital surveillance sensors
  - `twitter`: Fetch HealthTweets data
  - `wiki`: Fetch Wikipedia access data

## Installation

``` r
devtools::install_git("https://sr.ht.com/~hrbrmstr/delphiepidata.git")
# or
devtools::install_gitlab("hrbrmstr/delphiepidata")
# or (if you must)
devtools::install_github("hrbrmstr/delphiepidata")
```

## Usage

``` r
library(delphiepidata)

# current version
packageVersion("delphiepidata")
## [1] '0.1.0'
```

## delphiepidata Metrics

| Lang | \# Files | (%) | LoC |  (%) | Blank lines | (%) | \# Lines |  (%) |
| :--- | -------: | --: | --: | ---: | ----------: | --: | -------: | ---: |
| R    |        9 | 0.9 | 374 | 0.98 |          45 | 0.7 |      206 | 0.79 |
| Rmd  |        1 | 0.1 |   8 | 0.02 |          19 | 0.3 |       54 | 0.21 |

## Code of Conduct

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.
