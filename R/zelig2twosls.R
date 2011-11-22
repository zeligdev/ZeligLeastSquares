#' Interface between the Zelig Model twosls and 
#' the Pre-existing Model-fitting Method
#' @param formula a formula
#' @param ... additonal parameters
#' @param data a data.frame 
#' @return a list specifying '.function'
#' @export
zelig2twosls <- function (formula, ..., data) {

  # Helper function to perform set-difference
  "%w/o%" <- function(x, y)
    x[!x %in% y]

  formula.eqs <- names(getDependentVariables(formula))
  instrument.eqs <- names(formula) %w/o% formula.eqs

  # 
  inst <- if (length(instrument.eqs) == 1)
    formula[[instrument.eqs]]

  else if (length(instrument.eqs) > 1)
    formula[instrument.eqs]

  else
    stop("...")

  class(formula) <- c("multiple", "list")

  # Return
  list(
       .function = "callsystemfit",
       formula = formula[formula.eqs],
       method  = "2SLS",
       inst    = inst,
       data = data,
       ...
       )
}
