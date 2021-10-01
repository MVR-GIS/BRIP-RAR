pandoc_header <- function (x, level = 1, style = c("atx", "setext")) {
  if (missing(style)) {
    style <- panderOptions("header.style")
  }
  else {
    style <- match.arg(style)
  }
  if (!is.numeric(level)) {
    stop("Wrong level provided!")
  }
  if (any((style == "atx" & level > 6), (style == "setext" &
                                         level > 2))) {
    stop("Too high level provided!")
  }
  if (level < 1) {
    stop("Too low level provided!")
  }
  res <- switch(style,
                atx = paste(repChar("#", level), x),
                setext = paste(x, repChar(ifelse(level == 1, "=", "-"),
                                          nchar(x, type = "width")), sep = "\n"))
  add.blank.lines(res)
}
