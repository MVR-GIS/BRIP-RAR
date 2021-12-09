#' @title Add markdown link using id_field
#'
#' @description Adds a markdown hyperlink target based on the id_field.
#'
#' @param df
#' @param id_field
#'
#' @return The input data frame with a new field formatted according to
#' markdown link requirements.
#'
id_link <- function(df, id_field) {
  # Extract and construct strings
  id_lower      <- tolower(id_field)
  id_type       <- str_extract(id_lower, "risk|action|decision")
  id_target     <- paste0("#", id_type, "-item-")
  id_field_name <- paste0(id_field, "_link")

  # enquote the id_fields
  in_col        <- enquo(id_field)
  id_field_link <- enquo(id_field_name)

  df <- df %>%
    mutate(id_field_lower = tolower(!!sym(quo_name(in_col))),
           id_link = str_c("[",
                           !!sym(quo_name(in_col)),
                           "](",
                           id_target,
                           id_field_lower,
                           ")")) %>%
    rename(!!id_field_link := id_link) %>%
    select(!c(id_field_lower)) %>%
    relocate(!!id_field_link, .after = !!in_col)

  return(df)
}
