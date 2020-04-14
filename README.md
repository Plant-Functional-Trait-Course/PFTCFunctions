
<!-- README.md is generated from README.Rmd. Please edit that file -->

# PFTCFunctions

<!-- badges: start -->

<!-- badges: end -->

The goal of PFTCFunctions is to create unique hashcodes for each
individual leaf (envelope) from the Plant Functional Trait Course.

| Country  | seed | Campaign |
| :------- | ---: | :------- |
| Peru     |    1 | PFTC3    |
| Peru     |    1 | Puna     |
| Svalbard |   32 | PFTC4    |
| Peru     |    6 | PFTC5    |

## Installation

You can install PFTCFunctions from [GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("Plant-Functional-Trait-Course//PFTCFunctions")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(PFTCFunctions)
## create list with all envelope codes. And show the first five values
all_codes <- get_PFTC_envelope_codes(seed = 1)
all_codes$hashcode[1:5]
#> [1] "AAA4667" "AAB6541" "AAC0068" "AAD5960" "AAE3544"
```

## Location of PFTC data

| Country  | DataType      | Remark                                        |
| :------- | :------------ | :-------------------------------------------- |
| China    | community     | NA                                            |
| China    | trait         | Full leaf trait data set from PFTC1 and 2     |
| China    | trait         | Full chemical trait data set from PFTC1 and 2 |
| China    | trait\_Henn   | Trait data set used for Henn et al. 2018      |
| China    | biomass       | NA                                            |
| China    | flux          | NA                                            |
| China    | meta          | NA                                            |
| China    | climate       | Climate data from iButtons                    |
| China    | climate       | Monthly climate data from iButtons            |
| China    | climate       | Climate data from Tomst Logger                |
| China    | climate       | Climate data from weather station             |
| China    | climate       | Climate data for Yan et al. 2018              |
| Peru     | community     | NA                                            |
| Peru     | metaCommunity | NA                                            |
| Peru     | trait         | NA                                            |
| Peru     | flux          | NA                                            |
| Peru     | meta          | NA                                            |
| Svalbard | community     | NA                                            |
| Svalbard | community     | NA                                            |
| Svalbard | trait         | NA                                            |
| Svalbard | flux          | NA                                            |
| Svalbard | meta          | NA                                            |
| Norway   | community     | NA                                            |
| Norway   | metaCommunity | NA                                            |
| Norway   | trait         | NA                                            |
| Norway   | flux          | NA                                            |
| Norway   | meta          | NA                                            |
| Colorado | community     | NA                                            |
| Colorado | metaCommunity | NA                                            |
| Colorado | trait         | NA                                            |
| Colorado | flux          | NA                                            |
| Colorado | meta          | NA                                            |
