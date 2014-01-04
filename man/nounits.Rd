\name{nounits}
\alias{nounits}
\title{Remove units from header}
\usage{
  nounits(x)
}
\arguments{
  \item{x}{A \code{data.frame} of weather data, as returned
  by \code{\link{weatherdata}}.}
}
\value{
  The same \code{data.frame} as \code{x} with unitless
  names.
}
\description{
  Removes the units from the data.frame names.
}
\examples{
x <- weatherdata("2012-12-25")
names(x)
names(nounits(x))
}
\author{
  Laurent Gatto <lg390@cam.ac.uk>
}

