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
\details{
  Data are immediate at \code{Time} except wind speed
  (average since previous \code{Time}) and wind direction
  (most frequent since previous \code{Time}.)  Sun and rain
  values are cumulative from code{Start}. \code{MxWSpd}
  gives max wind speed since previous \code{Time}.
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
\seealso{
  \code{\link{nounits}} to remove the units from the
  \code{data.frame}'s names.
}

