#' @title Discussion Table
#'
#' @description Creates a table of discussion items from the input discussion
#'   data frame.
#'
#' @param discussion_df     data.frame; A data frame of discussion items.
#' @param items             character; A vector of item ids to display
#'                          in the table.
#'
#' @return A kable table styled for reporting.
#'
discussion_table <- function(discussion_df, items) {
  # pre-process the data
  discussion_items <- discussion_df %>%
    select(DISCUSSION, RESPONSIBLE_POC, poc_review_date) %>%
    arrange(desc(poc_review_date)) %>%
    mutate(poc_review_date = as_date(poc_review_date))

  col_names <- c("Discussion Topic", "POC", "Date")

  # Build the table
  discussion_table <- kbl(discussion_items,
                          col.names = col_names) %>%
    kable_styling(bootstrap_options = c("striped", "hover", "condensed",
                                        "responsive"),
                  full_width = TRUE,
                  position = "left",
                  font_size = 12) %>%
    column_spec(3, width = "6em")

  return(discussion_table)
}
