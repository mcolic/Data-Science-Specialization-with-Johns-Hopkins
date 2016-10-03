###################################################
# Author: Medina Colic
# Subject: Data Science Specialization Coursera
# Assignment: R programming - Assignment 1
###################################################


complete <- function(directory, id = 1:332) {
        all_files <- list.files(directory, full.names = TRUE)
        data <- data.frame()

        for (i in id) {
                j <- read.csv(all_files[i])
                nobs <- sum(complete.cases(j))
                tmp <- data.frame(i, nobs)
                data <- rbind(data, tmp)
        }

        colnames(data) <- c("id", "nobs")
        data
}
