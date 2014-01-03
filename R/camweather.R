.camweatherEnv  <- new.env(parent = emptyenv(), hash = TRUE)

assign("weatherfiles",
       dir(system.file("extdata", package = "camweather"),
           full.names = FALSE),
       envir = .camweatherEnv)

lockEnvironment(.camweatherEnv, bindings = TRUE)


##' Describes the \code{camweather} data.
##'
##' @title Cambridge Weather Data 
##' @return NULL. Used for its side effect.
##' @author Laurent Gatto <lg390@@cam.ac.uk>
##' @examples
##' camweather()
camweather <- function() {
    fls <- weatherfiles()
    n <- length(fls)
    from <- as.Date(weatherfiles()[1], "%Y_%m_%d")
    to <- as.Date(weatherfiles()[n], "%Y_%m_%d")
    message("Cambridge Weather Data")
    message("Credit: Digital Technology Group")
    message("Source: http://www.cl.cam.ac.uk/research/dtg/weather/")
    message("- ", n, " weather files")
    message("- from: ", from)
    message("- to: ", to)
}

##' Get all available weather file names
##'
##' @title All weather files
##' @return A vector with all available file names.
##' @author Laurent Gatto <lg390@@cam.ac.uk>
##' @examples
##' head(weatherfiles)
##' length(weatherfiles)
weatherfiles <- function() get("weatherfiles", .camweatherEnv)

##' Get the full path to a weather file
##'
##' @title Weather file
##' @param date A character describing a date with format
##' \code{"YYYY-MM-DD"}.
##' @return Returns the full path to the corresponding weather file.
##' @author Laurent Gatto <lg390@@cam.ac.uk>
##' @examples
##' weatherfile("2012-12-25")
##' try(weatherfile("1956-12-25"))
weatherfile <- function(date) {
    fls <- weatherfiles()
    date <- gsub("-", "_", date) 
    i <- grep(date, fls)
    if (length(i) == 0)
        stop("No weather file found")
    fls <- dir(system.file("extdata", package = "camweather"),
               full.names = TRUE)
    fls[i]
}

##' Get the weather data for a day.
##'
##' @title Weather data
##' @param date A character describing a date with format
##' \code{"YYYY-MM-DD"}.
##' @return A \code{data.frame} with the weather data for the
##' corresponding \code{date}.
##' @author Laurent Gatto <lg390@@cam.ac.uk>
##' @examples
##' x <- weatherdata("2012-12-25")
##' dim(x)
##' head(x)
##' plot(x$Time, x[, "Temp [degC]"], type = "b")
weatherdata <- function(date) {
    f <- weatherfile(date)
    if (length(f) > 1) {
        warning("Found ", length(f), " files. Using first one ",
                basename(f[1]))
        f <- f[1]
    }
    w <- read.table(f, header = FALSE,
                    comment.char = "#",
                    sep = "\t")
    hd <- readLines(f)
    hd <- hd[grep("#", hd)]
    hd <- sub("#", "", hd)
    hd <- hd[7:8]
    hd <- gsub(" ", "", hd)
    hd <- strsplit(hd, "\t")
    hd <- paste0(hd[[1]], " [", hd[[2]], "]")
    hd <- sub(" \\[\\]", "", hd)
    names(w) <- hd
    w$Time <- strptime(paste(basename(f), w$Time), "%Y_%m_%d %H:%M")
    w$Day <- as.Date(basename(f), "%Y_%m_%d")
    return(w)
}


