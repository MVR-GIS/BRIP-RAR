#' @title Engagement Level History Table
#'
#' @param events_df  data frame; An events data frame
#' @param items      character; A character vector of item identifiers
#'
#' @return A kable table styled for reporting.
#'
eng_level_history <- function(events_df, items) {
  events_level <- events_df %>%
    mutate(id_type = str_to_title(id_type)) %>%
    filter(fk_table_id %in% items)

  kbl(select(events_level, fk_table_id_link, ENG_LEVEL, level_date,
             DESCRIPTION, duration_days),
      col.names = c("Item", "Level", "Date", "Reason for level change",
                    "Duration (days)")) %>%
    kable_styling(bootstrap_options = c("striped", "hover", "condensed",
                                        "responsive"),
                  full_width = TRUE,
                  position = "left",
                  font_size = 12) %>%
    pack_rows(index = table(events_level$id_type),
              indent = FALSE,
              label_row_css = "background-color: #dad8d8; color: #000000;") %>%
    column_spec(1, width = "6em") %>%
    column_spec(2, width = "4em") %>%
    column_spec(3, width = "6em")
}
