#' @title Add markdown link using id_field
#'
#' @description Adds a markdown hyperlink target based on the id_field.
#'
#' @param df         data frame; data frame containing the field to be created
#' @param id_field   character; id field
#'
#' @return The input data frame with a new field formatted according to
#' markdown link requirements.
#'
id_link <- function(df, id_field) {
  # Add id_type field
  df <- df %>%
    mutate(id_type = as.character(NA))

  # Determine df type (risk|action|decision, event|discussion), if records exist
  if(length(df[,1] > 0)) {
    id_lower <- tolower(id_field)

    ## Is risk|action|decision register? (risk_no|action_no|decision_no)
    if(str_extract(id_lower, "risk|action|decision") %in% c("risk", "action",
                                                            "decision")) {
      df$id_type <- str_extract(id_lower, "risk|action|decision")
    }
    ## Is event|discussion table? (fk_table_id)
    if(str_extract(id_lower, "table") %in% c("table")) {
      table_lower <- tolower(df$TABLE_NAME)
      df$id_type <- str_extract(table_lower, "risk|action|decision")
    }
  }

  # Create link string
  id_target  <- paste0("#", df$id_type, "-item-")
  id_field_name <- paste0(id_field, "_link")

  # enquote the id_fields
  in_col        <- enquo(id_field)
  id_field_link <- enquo(id_field_name)

  # Add new link field
  df <- df %>%
    mutate(!!id_field_link := as.character(NA)) %>%
    relocate(!!id_field_link, .after = !!in_col)

  # Create the links (if records in table)
  if(length(df[,1] > 0)) {
    df <- df %>%
      mutate(id_field_lower = tolower(!!sym(quo_name(in_col))),
             id_link = str_c("[",
                             !!sym(quo_name(in_col)),
                             "](",
                             df$id_target,
                             id_field_lower,
                             ")")) %>%
      mutate(!!id_field_link := id_link) %>%
      select(!c(id_field_lower, id_link))
  }

  return(df)
}
