\name{weatherdata}
\alias{weatherdata}
\title{Weather data}
\usage{
  weatherdata(date)
}
\arguments{
  \item{date}{A character describing a date with format
  \code{"YYYY-MM-DD"}.}
}
\value{
  A \code{data.frame} with the weather data for the
  corresponding \code{date}.
}
\description{
  Get the weather data for a day.
}
\examples{
x <- weatherdata("2012-12-25")
dim(x)
head(x)
plot(x$Time, x[, "Temp [degC]"], type = "b")
}
\author{
  Laurent Gatto <lg390@cam.ac.uk>
}

