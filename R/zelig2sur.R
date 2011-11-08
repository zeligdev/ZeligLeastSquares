#' Interface between the Zelig Model sur and 
#' the Pre-existing Model-fitting Method
#' @param formula a formula
#' @param ... additonal parameters
#' @param data a data.frame 
#' @return a list specifying '.function'
#' @export
zelig2sur <- function (formula, ..., data) {
  list(
       .function = "",
       formula = formula,
       data = data
       )
}
