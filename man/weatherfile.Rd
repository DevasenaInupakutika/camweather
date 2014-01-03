\name{weatherfile}
\alias{weatherfile}
\title{Weather file}
\usage{
  weatherfile(date)
}
\arguments{
  \item{date}{A character describing a date with format
  \code{"YYYY-MM-DD"}.}
}
\value{
  Returns the full path to the corresponding weather file.
}
\description{
  Get the full path to a weather file
}
\examples{
weatherfile("2012-12-25")
try(weatherfile("1956-12-25"))
}
\author{
  Laurent Gatto <lg390@cam.ac.uk>
}

