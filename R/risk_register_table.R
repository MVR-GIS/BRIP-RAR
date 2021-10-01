#' Risk Register Table
#'
#' @param risk     data.frame; A data frame of risks.
#'
#' @return `knitr::kable` table
#'
risk_register_table <- function(risk) {
  risk_df <- risk %>%
    select(risk_no_link, CONCERNS, RISKCATEGORY, RISK_STRATEGY,
           COST_RISK, cost_risk_color,
           SCHEDULE_RISK, schedule_risk_color)

  risk_register <- kbl(
    select(risk_df,
             risk_no_link, CONCERNS, RISK_STRATEGY, COST_RISK, SCHEDULE_RISK),
      col.names = c("Risk No.", "Description", "Risk Strategy", "Cost Risk",
                    "Schedule Risk")) %>%
    kable_styling(bootstrap_options = c("striped", "hover", "condensed",
                                        "responsive"),
                  font_size = 12) %>%
    pack_rows(index = table(risk_df$RISKCATEGORY),
              label_row_css = "background-color: #dad8d8; color: #000000;") %>%
    column_spec(4, color = "black",
                background = risk_df$cost_risk_color) %>%
    column_spec(5, color = "black",
                background = risk_df$schedule_risk_color)

  return(risk_register)
}