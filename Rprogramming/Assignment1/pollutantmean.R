###################################################
# Author: Medina Colic
# Subject: Data Science Specialization Coursera
# Assignment: R programming - Assignment 1
###################################################


pollutantmean <- function(directory, pollutant, id = 1:332) {
        all_files <- list.files(directory, full.names = TRUE)

        data <- data.frame()

        for (i in id) {
                data <- rbind(data, read.csv(all_files[i]))
        }

        mean(data[, pollutant], na.rm = TRUE)
}
