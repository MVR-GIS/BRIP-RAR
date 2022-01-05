#' @title Remove Test Records
#'
#' @description Removes test records from the input data frame.
#'
#' @param df        data frame; The data frame containing test records to
#'                  be removed.
#' @param id_field  character; id field to be checked for removal
#'
#' @return A data frame with the test records removed.
#'
remove_test_records <- function(df, id_field) {
  df <- df %>%
    mutate(id := str_to_lower(!!sym(id_field))) %>%
    mutate(id_test = str_extract(id, "test")) %>%
    filter(!id_test %in% "test") %>%
    select(!c(id, id_test))

  return(df)
}
