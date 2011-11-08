#' Interface between the Zelig Model aov and 
#' the Pre-existing Model-fitting Method
#' @param formula a formula
#' @param ... additonal parameters
#' @param data a data.frame 
#' @return a list specifying '.function'
#' @export
zelig2aov <- function (formula, ..., data) {
  list(
       .function = "",
       formula = formula,
       data = data
       )
}
