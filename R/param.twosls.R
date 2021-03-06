#' Extract Samples from a Distribution in Order to Pass Them to the \code{qi}
#' Function
#' (this is primarily a helper function for the twosls model)
#' @param obj a zelig object
#' @param num an integer specifying the number of simulations to compute
#' @param ... additional parameters
#' @return a list specifying link, link-inverse, random samples, and ancillary
#' parameters
#' @export
param.twosls <- function(obj, num=1000, ...) {

  # Produce a vector of all terms
  big.coef <- coef(obj)

  # Produce a pretty sparse matrix containing 3 vcov matrices.
  #
  # Note that this matrix will give a value of zero to any invalid row-column
  # combination.
  # In particular, any terms that do not belong to the same equation will have
  # a zero value.
  big.vcov <- vcov(obj)

  # This is a complete list of the terms. This is largely ignored, aside from
  # the fact that we need a list of the formulae. In general, terms.multiple
  # produced a pretty unwieldy list of items.
  all.terms <- terms(obj)

  # This list stores the results
  simulations.list <- list()

  # Iterate through the set of terms, and simulate each list separately.
  for (key in names(all.terms)) {

    # Extract the terms for an individual model.
    eq.terms <- terms(all.terms[[key]])

    # Extract the labels for the terms
    eq.term.labels <- attr(eq.terms, "term.labels")

    # Add the labeled for the intercept column, if it should exist
    if (attr(eq.terms, "intercept"))
      eq.term.labels <- c("(Intercept)", eq.term.labels)

    # Format the title, this should look like:
    #   <list-item-name>_<term-label>
    #
    # So for the list: list(mu1 = y ~ x + sin(x))
    # We get:
    #   "mu1_(Intercept)" "mu1_x" "mu1_sin(x)"
    entries <- paste(key, eq.term.labels, sep = "_")

    # Extract the mean-value of this term (from the lumped-toegether vector)
    eq.coef <- big.coef[entries]

    # Extract the vcov matrix of this term (from the lumped-together matrix)
    eq.vcov <- big.vcov[entries, entries]

    # Simulate the parameters
    eq.simulations <- mvrnorm(num, eq.coef, eq.vcov)

    # Name the columns
    colnames(eq.simulations) <- eq.term.labels

    # Add to the list
    simulations.list[[key]] <- eq.simulations

  }


  # Return.
  list(
       coef = simulations.list,
       linkinv = NULL
       )
}
