################################################################################
#
#   MGDrivE2: SPN structure for a single node (SEI-SIS epi decoupled)
#   Marshall Lab
#   Agastya Mondal (agastya_mondal@berkeley.edu)
#   Feburary 2021
#
################################################################################


################################################################################
# make the places (P) of the SPN
################################################################################

#' Make Places (P) For a Node (SEI Mosquitoes). Note in the v2 epi module, we only
#' use the SPN framework for the mosquito component of the model. The human compoenent
#' will be handled separately in the sampler, and will be formulated as an ODE.
#' This function makes the set of places (P) for a SPN. It is used alone if our model
#' is a single-node metapopulation for mosquito SEI and dynamics; This is used by both
#' SIS and Imperial transmission models.
#'
#' The \code{params} argument supplies all of the ecological parameters necessary
#' to calculate equilibrium values. This function requires the \code{nE},
#' \code{nL}, \code{nP}, and \code{nEIP} parameters to be specified. For more details, see
#' \code{\link{equilibrium_SEI_SIS}}
#'
#' For examples of using this function, see:
#' \code{vignette("epi-node", package = "MGDrivE2")}
#'
#' @param params a named list of parameters (see details)
#' @param cube an inheritance cube from the \code{MGDrivE} package (e.g. \code{\link[MGDrivE]{cubeMendelian}})
#'
#' @return a list with two elements: \code{ix} contains labeled indices of the places
#' by life stage, \code{u} is the character vector of places (P)
#'
#' @export
spn_P_epi_decoupled_node <- function(params,cube){

  # checks
  nE <- params$nE
  nL <- params$nL
  nP <- params$nP
  nEIP <- params$nEIP
  if(nE < 2 || nL < 2 || nP < 2 || nEIP < 2){
    warning(paste0("A shape parameter ('nE', 'nL', 'nP', 'nEIP') of 1 implies ",
                   "exponentially distributed dwell times in that compartment."))
  }

  # genetic information
  nG <- cube$genotypesN
  g <- cube$genotypesID

  # setup places
  eggs <- file.path("E",1:nE,"_",rep(g, each = nE), fsep = "")

  larvae <- file.path("L",1:nL,"_",rep(g, each = nL), fsep = "")

  pupae <- file.path("P",1:nP,"_",rep(g, each = nP), fsep = "")

  females_unmated <- file.path("U",g, fsep = "_")

  # create female/male geno combinations, then replicate that for each EIP
  # tack on infection status, replicated for the number of genotypes.
  stages <- c("S",paste0("E",as.character(1:nEIP)),"I")
  females <- file.path("F", rep(x = rep(x = g, each = nG), times = nEIP+2),
                      rep(x = g, times = nG*(nEIP+2)),
                      rep(x = stages, each = nG^2),
                      fsep = "_")

  males <- file.path("M",g, fsep = "_")

  # indices of states
  ix <- list()
  ix$egg <- matrix(seq_along(eggs),nrow = nE,byrow = FALSE,dimnames = list(1:nE,g))
  ix$larvae <- matrix(data = seq_along(larvae) + nG*nE,nrow = nL,byrow = FALSE,dimnames = list(1:nL,g))
  ix$pupae <- matrix(data = seq_along(pupae) + nG*(nE + nL),nrow = nP,byrow = FALSE,dimnames = list(1:nP,g))
  ix$females_unmated <- setNames(object = seq_along(females_unmated) + nG*(nE + nL + nP), nm = g)

  # For the females, we have to permute because the array function doesn't have
  # something like "byrow" for matrices. This makes sure the "rows" are the female
  # genotype, cols are male mate, and z-axis is stage of incubation.
  # "resize=TRUE" is a cheat to keep dim names, doesn't cause issues in this instance
  ix$females <- aperm(a = array(data = seq_along(females) + nG*(nE + nL + nP + 1),dim = c(nG,nG,nEIP+2),
                  dimnames = list(g,g,stages)),
        perm = c(2,1,3),resize = TRUE)

  ix$males <- setNames(object = seq_along(males) + nG*(nE+nL+nP+nG*(nEIP+2) + 1), nm = g)

  # places (u)
  u <- c(eggs,larvae,pupae,females_unmated,females,males)

  # return list of places
  #  make ix a list to match network version
  return(list("ix" = list(ix),
              "u" = u) )
}
