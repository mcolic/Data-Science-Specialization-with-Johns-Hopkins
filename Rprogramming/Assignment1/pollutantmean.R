###################################################
# Author: Medina Colic
# Subject: Data Science Specialization Coursera
# Assignment: R programming - Assignment 1
###################################################


pollutantmean <- function(directory, pollutant, id = 1:332) {
      setwd(file.path(getwd(), directory))
      sum = 0
      counts = 0

      for (i in id) {
        if (i < 10) {
          data <- read.csv(paste("0", "0", as.character(i), ".csv", sep =""),
          header = TRUE, na.rm = TRUE)
        }
        else if (i >= 10 & 1 < 100) {
          data <- read.csv(paste("0", as.character(i), ".csv", sep = ""),
          header = TRUE, na.rm = TRUE)
        }
        else {
          data <- read.csv(paste(as.character(i), ".csv", sep = ""),
          header = TRUE, na.rm = TRUE)
        }

      }

      counts = counts + nrow(data)
      if (pollutant == 'sulfate') {
        sum = sum + sum(data$sulfate)
      }
      else {
        sum = sum + sum(data$nitrate)
      }

      setwd("..")
      return (sum/counts)
}
