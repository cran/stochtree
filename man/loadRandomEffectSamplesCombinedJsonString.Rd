% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/serialization.R
\name{loadRandomEffectSamplesCombinedJsonString}
\alias{loadRandomEffectSamplesCombinedJsonString}
\title{Combine multiple JSON strings representing model objects containing random effects (with the same hierarchy / schema) into a single container}
\usage{
loadRandomEffectSamplesCombinedJsonString(json_string_list, json_rfx_num)
}
\arguments{
\item{json_string_list}{List of objects of class \code{CppJson}}

\item{json_rfx_num}{Integer index indicating the position of the random effects term to be unpacked}
}
\value{
\code{RandomEffectSamples} object
}
\description{
Combine multiple JSON strings representing model objects containing random effects (with the same hierarchy / schema) into a single container
}
\examples{
n <- 100
p <- 10
X <- matrix(runif(n*p), ncol = p)
rfx_group_ids <- sample(1:2, size = n, replace = TRUE)
rfx_basis <- rep(1.0, n)
y <- (-5 + 10*(X[,1] > 0.5)) + (-2*(rfx_group_ids==1)+2*(rfx_group_ids==2)) + rnorm(n)
bart_model <- bart(X_train=X, y_train=y, rfx_group_ids_train=rfx_group_ids,
                   rfx_basis_train = rfx_basis, num_gfr=0, num_mcmc=10)
bart_json_string <- list(saveBARTModelToJsonString(bart_model))
rfx_samples <- loadRandomEffectSamplesCombinedJsonString(bart_json_string, 0)
}
