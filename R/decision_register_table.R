#' @title Decision Register Table
#'
#' @description Produces a decision register table of the input decision
#'   data frame.
#'
#' @param decision   data frame; A data frame of decisions.
#'
#' @return A kable table styled for reporting.
#'
decision_register_table <- function(decision) {
  dec_df <- decision %>%
    select(decision_no_link, DECISION, APPROVAL_STATUS, decision_date) %>%
    mutate(decision_date = as_date(decision_date))

  # Create the unstyled kable
  decision_register <- kbl(dec_df,
                           col.names = c("Number", "Decision", "Approval",
                                         "Date")) %>%
    kable_styling(bootstrap_options = c("striped", "hover",
                                        "condensed", "responsive"),
                  font_size = 12)

  # Group rows if records exist
  if(length(dec_df$decision_no) >= 1) {
    decision_register <- decision_register %>%
    column_spec(1, width = "7em") %>%
    column_spec(4, width = "6em")
  }

  return(decision_register)
}
