% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sampling-trajectory-decoupled-CSV.R
\name{sim_trajectory_base_CSV_decoupled}
\alias{sim_trajectory_base_CSV_decoupled}
\title{Simulate Trajectory From one  SPN Model}
\usage{
sim_trajectory_base_CSV_decoupled(
  x0,
  h0,
  SPN_P,
  theta,
  times,
  stepFun,
  events0 = NULL,
  batch = NULL,
  Sout = NULL,
  verbose = TRUE,
  human_ode = "Imperial",
  cube = NULL,
  folders = folders
)
}
\arguments{
\item{x0}{the initial marking of the SPN (initial state)}

\item{h0}{initial human state distribution}

\item{SPN_P}{stochastic petri net, places}

\item{theta}{parameters}

\item{times}{sequence of sampling times}

\item{stepFun}{a sampling function}

\item{events0}{a \code{data.frame} of events (uses the same format as required
in package \code{deSolve} for consistency, see \code{\link[deSolve]{events}}
for more information)}

\item{batch}{a \code{list} of batch migration events, created from \code{\link[MGDrivE2]{batch_migration}}, may be set to \code{NULL} if not used}

\item{Sout}{an optional matrix to track event firings}

\item{verbose}{print a progress bar?}

\item{human_ode}{ode function used for human states}

\item{cube}{inheritance cube}

\item{folders}{vector of folders to write output}
}
\value{
no return, prints .csv files into provided folders
}
\description{
This is an internal function to \code{\link{sim_trajectory_CSV}}. It does the
actual sampling once all of the functions have been checked and setup.
}
