% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hazard-main-decoupled.R
\name{spn_hazards_decoupled}
\alias{spn_hazards_decoupled}
\title{Make Hazards (Lambda) For a MGDrivE2: Node and Network Simulations}
\usage{
spn_hazards_decoupled(
  spn_P,
  spn_T,
  cube,
  params,
  type = "SIS",
  log_dd = TRUE,
  exact = TRUE,
  tol = 1e-12,
  verbose = TRUE
)
}
\arguments{
\item{spn_P}{the set of places (P) (see details)}

\item{spn_T}{the set of transitions (T) (see details)}

\item{cube}{an inheritance cube from the \code{MGDrivE} package (e.g. \code{\link[MGDrivE]{cubeMendelian}})}

\item{params}{a named list of parameters (see details)}

\item{type}{string indicating type of hazards, one of; "life", "SIS", "Imperial" or "SEIR"}

\item{log_dd}{if \code{TRUE}, use logistic (carrying capacity) density dependent hazards, if \code{FALSE} use Lotka-Volterra density dependent hazards for larval mortality}

\item{exact}{boolean, make exact (integer input) hazards? Default is TRUE}

\item{tol}{if \code{exact=FALSE}, the value of hazard below which it is clipped to 0}

\item{verbose}{display a progress bar when making hazards?}
}
\value{
list of length 2: \code{hazards} is a list of named closures for every
state transition in the model, \code{flag} is a boolean indicating exact or approximate
}
\description{
Using the structural (topological) SPN model as well as parameters in the
\code{cube} and \code{params} objects, generate a list (of length |v|) of
hazards, each implemented as a function closure.
}
\details{
If these hazards will be used in a continuous approximation algorithm, such as
an ODE method (\code{\link{step_ODE}}) or Gillespie's Direct Method
(\code{\link{step_DM}}), it is recommended to use \code{exact=FALSE}. If the
hazards will be used in an integer state space method, such as tau-leaping
(\code{\link{step_PTS}}) or Chemical Langevin (\code{\link{step_CLE}}) methods,
it is recommended to use \code{exact=TRUE}.

The places (\code{spn_P}) object is generated from one of the following:
\code{\link{spn_P_lifecycle_node}}, \code{\link{spn_P_lifecycle_network}},
\code{\link{spn_P_epiSIS_node}}, \code{\link{spn_P_epiSIS_network}},
\code{\link{spn_P_epiSEIR_node}}, or \code{\link{spn_P_epiSEIR_network}}.

The set of transitions (\code{spn_T}) is generated from one of the following:
\code{\link{spn_T_lifecycle_node}}, \code{\link{spn_T_lifecycle_network}},
\code{\link{spn_T_epiSIS_node}}, \code{\link{spn_T_epiSIS_network}},
\code{\link{spn_T_epiSEIR_node}}, \code{\link{spn_T_epiSEIR_network}}.

The \code{params} objected is generated from either \code{\link{equilibrium_lifeycle}}
or \code{\link{equilibrium_SEI_SIS}}; it is the "params" object in the return
list. The equilibrium function used must match the \code{type} parameter.

The \code{type} parameter indicates what type of simulation is being run. It
is one of: "life", "SIS", or "SEIR". This must match the \code{params} object
supplied.

Use of this function is demonstrated in many vignettes, \code{browseVignettes(package = "MGDrivE2")}
}
