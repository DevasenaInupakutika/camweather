allweather <- read.csv("weather-raw.csv", header = FALSE)
## TODO column names and appropriate column types
## colnames(allweather) = 
save(allweather, file = "../../data/allweather.rda",
     compression_level = 9, compress = "xz")
