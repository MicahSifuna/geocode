#activate the libraries
library(dplyr, warn.conflicts = FALSE)
library(tidygeocoder)

#setting the working directory
setwd("D:\\geocode")

#get the working directory
getwd()
dir()


# Read the data
data2016 <- read.csv("acc_2016.csv")
data2017<-read.csv("acc_2017.csv")
summary(data2016)
# Convert the data to a dataframe
#2016
addr2016 <- as.data.frame(data2016)
View(addr2016)
#2017
addr2017 <- as.data.frame(data2017)

# Geocode using the osm method
#2016
geocoded_data016 <- addr2016 %>%
  geocode(address = PLACE, method = 'osm', lat = "latitude", long = "longitude")

View(geocoded_data016)

#2017
geocoded_data017 <- addr2017 %>%
  geocode(address = PLACE, method = 'osm', lat = "latitude", long = "longitude")
View(geocoded_data017)

# Filter out rows without missing latitude or longitude
#2016
geocoded_data016 <- geocoded_data016 %>% filter(!is.na(latitude) & !is.na(longitude))

#2017
geocoded_data017 <- geocoded_data017 %>% filter(!is.na(latitude) & !is.na(longitude))


# Save as a CSV file
#2016
write.csv(geocoded_data016, row.names = FALSE)

#2017
write.csv(geocoded_data017,row.names = FALSE)
