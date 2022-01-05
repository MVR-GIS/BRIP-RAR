#' @title Convert Date Field
#'
#' @description Converts character date fields to POSIXct format. Converts
#'   any field name ending in "_DATE" to POSIXct.
#'
#' @param df           data frame; A data frame with characrer date fields
#'                       to be converted from character to POSIXct.
#'
#' @return A data frame containing POSIXct date fields.
#'
convert_date <- function(df) {
  df <- df %>%
    mutate(across(ends_with("_DATE"), lubridate::dmy_hms))

  return(df)
}
