% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/PN-matrix.R
\name{spn_Pre}
\alias{spn_Pre}
\title{Make Pre Matrix For a Petri Net}
\usage{
spn_Pre(spn_P, spn_T)
}
\arguments{
\item{spn_P}{set of places (P) (see details)}

\item{spn_T}{set of transitions (T) (see details)}
}
\value{
a matrix of type \code{\link[Matrix]{dgCMatrix-class}}
}
\description{
Generate the Pre (|v| by |u|) matrix for the SPN. This gives the edges from P
to T (input arcs) in the bipartite network.
}
\details{
The places (\code{spn_P}) object is generated from one of the following:
\code{\link{spn_P_lifecycle_node}}, \code{\link{spn_P_lifecycle_network}},
\code{\link{spn_P_epiSIS_node}}, \code{\link{spn_P_epiSIS_network}},
\code{\link{spn_P_epiSEIR_node}}, or \code{\link{spn_P_epiSEIR_network}}.

The set of transitions (\code{spn_T}) is generated from one of the following:
\code{\link{spn_T_lifecycle_node}}, \code{\link{spn_T_lifecycle_network}},
\code{\link{spn_T_epiSIS_node}}, \code{\link{spn_T_epiSIS_network}},
\code{\link{spn_T_epiSEIR_node}}, \code{\link{spn_T_epiSEIR_network}}.
}
