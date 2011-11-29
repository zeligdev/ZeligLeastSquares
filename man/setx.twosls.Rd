\name{setx.twosls}
\alias{setx.twosls}
\title{Set explanatory variables for Multi-stage LS...}
\usage{setx.twosls(obj, fn, data, cond=FALSE, ...)}
\description{Set explanatory variables for Multi-stage LS}
\value{a 'setx' object}
\author{Matt Owen \email{mowen@iq.harvard.edu}, Kosuke Imai, and Olivia Lau}
\arguments{\item{obj}{a 'zelig' object}
\item{fn}{a list of key-value pairs specifying which function apply to
columns of the keys data-types}
\item{data}{a data.frame}
\item{cond}{ignored}
\item{...}{parameters specifying what to explicitly set each column as. This
is used to produce counterfactuals}}
