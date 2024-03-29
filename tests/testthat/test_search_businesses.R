library(testthat)
library(httr)
library(jsonlite)
library(dplyr)
library(RColorBrewer)
library(wordcloud2)
library(htmlwidgets)
# source("../R/search_businesses.R")

context("search_businesses Functionality")

test_that("search_businesses returns a list on success", {
  api_key <- 'TpL2Xxv5ezpTSAxUUpuUIMLXM1fv0nFu9g3VyTUD_FhbkHG9OD322THyJSW_b30QMqRbvIdfqmLIDqTFNf7hxl-aXOcXzgii6H7_Wirdj5BOVniojDjRFpPEiyewZXYx'
  location <- "San Francisco"
  business_type <- "restaurant"
  keyword <- "pizza"

  result <- search_businesses(api_key, location, business_type, keyword)

  # Check if the result is not NULL
  expect_false(is.null(result))

  # Check if the result is a list (indicative of successful API response parsing)
  expect_true(is.list(result))

  # Check if the list contains elements (businesses)
  expect_gt(length(result), 0)
})

test_that("search_businesses handles API errors gracefully", {
  api_key <- '2XXX' # Dummy API key to simulate failure
  location <- "Nowhere"
  business_type <- "none"
  keyword <- "nothing"

  result <- search_businesses(api_key, location, business_type, keyword)

  # Check if the function returns NULL on error as expected
  expect_null(result)
})
