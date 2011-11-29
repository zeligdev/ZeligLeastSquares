#' Get Dependent Variables from a Zelig-style Formula
#'
#' This method...
#' @S3method getDependentVariables formula
#' @S3method getDependentVariables list
#' @param a list or formula
#' @return a character-vector
getDependentVariables <- function (x, ...) {
  UseMethod("getDependentVariables")
}


getDependentVariables.formula <- function (x, ...) {
  if (length(x) == 2)
    ""

  else if (length(x) != 3)
    stop("not a valid formula")

  else {
    lhs <- x[[2]]

    if (length(lhs) != 1)
      stop("invalid specification")

    as.character(lhs)
  }
}


getDependentVariables.list <- function (x, ...) {
  res <- Map(getDependentVariables, x)
  
  Filter(function (x) nchar(x), res)
}
