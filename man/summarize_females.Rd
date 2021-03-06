% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/auxiliary-plot.R
\name{summarize_females}
\alias{summarize_females}
\title{Summarize Adult Females (One Node or Metapopulation Network, Lifecycle Model)}
\usage{
summarize_females(out, spn_P)
}
\arguments{
\item{out}{the output of \code{\link[MGDrivE2]{sim_trajectory_R}}}

\item{spn_P}{the places of the SPN, see details}
}
\value{
a 3 to 5 column dataframe for plotting with ggplot2
}
\description{
For \code{MGDrivE2} simulations of mosquito lifecycle dynamics in a single node
or metapopulation network, this function sums over the male mate genotype to
get population trajectories of adult female mosquitoes by their genotype.
}
\details{
The places (\code{spn_P}) object is generated from one of the following:
\code{\link{spn_P_lifecycle_node}} or \code{\link{spn_P_lifecycle_network}}.

The return object depends on the data provided. If the simulation was only 1 node,
then no \code{node} designation is returned. If only one repetition was performed,
no \code{rep} designation is returned. Columns always returned include: \code{time},
\code{genotype}, and \code{value}.

For examples of using this function, this or any vignette which visualizes output:
\code{vignette("lifecycle-node", package = "MGDrivE2")}
}
