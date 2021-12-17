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
  # Determine df type (risk|action|decision, event|discussion)
  id_lower      <- tolower(id_field)

  # Is risk|action|decision register? (risk_no|action_no|decision_no)
  if(str_extract(id_lower, "risk|action|decision") %in% c("risk", "action",
                                                          "decision")) {
    df$id_type <- str_extract(id_lower, "risk|action|decision")
  }
  # Is event|discussion table? (fk_table_id)
  if(str_extract(id_lower, "table") %in% c("table")) {
    df$table_lower <- tolower(df$TABLE_NAME)
    df$id_type <- str_extract(df$table_lower, "risk|action|decision")
  }

  df$id_target  <- paste0("#", df$id_type, "-item-")
  id_field_name <- paste0(id_field, "_link")

  # enquote the id_fields
  in_col        <- enquo(id_field)
  id_field_link <- enquo(id_field_name)

  df <- df %>%
    mutate(id_field_lower = tolower(!!sym(quo_name(in_col))),
           id_link = str_c("[",
                           !!sym(quo_name(in_col)),
                           "](",
                           df$id_target,
                           id_field_lower,
                           ")")) %>%
    rename(!!id_field_link := id_link) %>%
    select(!c(id_target, id_field_lower)) %>%
    relocate(!!id_field_link, .after = !!in_col)

  return(df)
}
