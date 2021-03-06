% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ER.R
\name{ER}
\alias{ER}
\alias{print.ER}
\alias{plot.ER}
\alias{tableER}
\title{Effect + Residual Modelling}
\usage{
ER(formula, data)

\method{print}{ER}(x, ...)

\method{plot}{ER}(
  x,
  y = 1,
  what = "raw",
  col = NULL,
  pch = NULL,
  model.line = (what \%in\% c("raw")),
  ylim = NULL,
  ylab = "",
  xlab = "",
  main = NULL,
  ...
)

tableER(object, variable)
}
\arguments{
\item{formula}{a model formula specifying features and effects.}

\item{data}{a \code{data.frame} containing response variables (features) and design factors or other groupings/continuous variables.}

\item{x}{Object of class \code{ER}.}

\item{...}{Additional arguments to \code{plot}}

\item{y}{Response name or number.}

\item{what}{What part of ER to plot; \code{raw} data (default), \code{fits}, \code{residuals} or
a named model effect (can be combined with 'effect', see \code{Examples}).}

\item{col}{Color of points, defaults to grouping. Usually set to a factor name.}

\item{pch}{Plot character of points, defaults to 1. Usually set to a factor name.}

\item{model.line}{Include line indicating estimates, default = TRUE. Can be an effect name.}

\item{ylim}{Y axis limits (\code{numeric}, but defaults to NULL)}

\item{ylab}{Y label (\code{character})}

\item{xlab}{X label (\code{character})}

\item{main}{Main title, defaults to \code{y} with description from \code{what}.}

\item{object}{ER object.}

\item{variable}{Numeric for selecting a variable for extraction.}
}
\value{
\code{ER} returns an object of class \code{ER} containing effects, ER values,
fitted values, residuals, features, coefficients, dummy design, symbolic design, dimensions,
highest level interaction and feature names.
}
\description{
Effect + Residual Modelling
}
\examples{
## Multiple Sclerosis
data(MS, package = "ER")
er <- ER(proteins ~ MS * cluster, data = MS)
print(er)
plot(er)                                       # Raw data, first feature
plot(er,2)                                     # Raw data, numbered feature
plot(er,'Q76L83', col='MS', pch='cluster')     # Selected colour and plot character
plot(er,'Q76L83', what='effect MS',
     model.line='effect cluster')              # Comparison of factors (points and lines)
\donttest{
  # Example compound plot
  old.par <- par(c("mfrow", "mar"))
  # on.exit(par(old.par))
  par(mfrow = c(3,3), mar = c(2,4,4,1))
  plot(er,'Q76L83')                                  # Raw data, named feature
  plot(er,'Q76L83', what='fits')                     # Fitted values
  plot(er,'Q76L83', what='residuals')                # Residuals
  plot(er,'Q76L83', what='effect MS')                # Effect levels
  plot(er,'Q76L83', what='effect cluster')           # ----||----
  plot(er,'Q76L83', what='effect MS:cluster')        # ----||----
  plot(er,'Q76L83', what='MS')                       # ER values
  plot(er,'Q76L83', what='cluster')                  # --------||---------
  plot(er,'Q76L83', what='MS:cluster')               # --------||---------
  par(old.par)
}

# Complete overview of ER
tab <- tableER(er, 1)

# In general there can be more than two, effects, more than two levels, and continuous effects:
# MS$three <- factor(c(rep(1:3,33),1:2))
# er3    <- ER(proteins ~ MS * cluster + three, data = MS)


## Lactobacillus
data(Lactobacillus, package = "ER")
erLac <- ER(proteome ~ strain * growthrate, data = Lactobacillus)
print(erLac)
plot(erLac)                            # Raw data, first feature
plot(erLac,2)                          # Raw data, numbered feature
plot(erLac,'P.LSA0316', col='strain',
    pch='growthrate')                  # Selected colour and plot character
plot(erLac,'P.LSA0316', what='strain',
    model.line='growthrate')           # Selected model.line


## Diabetes
data(Diabetes, package = "ER")
erDia <- ER(transcriptome ~ surgery * T2D, data = Diabetes)
print(erDia)
plot(erDia)                            # Raw data, first feature
plot(erDia,2)                          # Raw data, numbered feature
plot(erDia,'ILMN_1720829', col='surgery',
    pch='T2D')                         # Selected colour and plot character

}
\references{
* Mosleth et al. (2021) Cerebrospinal fluid proteome shows disrupted neuronal development in multiple sclerosis. Scientific Report, 11,4087. <doi:10.1038/s41598-021-82388-w>

* E.F. Mosleth et al. (2020). Comprehensive Chemometrics, 2nd edition; Brown, S., Tauler, R., & Walczak, B. (Eds.). Chapter 4.22. Analysis of Megavariate Data in Functional Omics. Elsevier. <doi:10.1016/B978-0-12-409547-2.14882-6>
}
\seealso{
Analyses using \code{ER}: \code{\link{elastic}} and \code{\link{pls}}. Confidence interval plots \code{\link{confints}}.
}
