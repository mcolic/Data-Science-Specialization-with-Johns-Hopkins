###################################################
# Author: Medina Colic
# Subject: Data Science Specialization Coursera
# Assignment: R programming - Assignment 1
###################################################


corr <- function(directory, threshold = 0) {
        all_files <- list.files(directory, full.names = TRUE)
        data <- vector(mode = "numeric", length = 0)

        for (i in 1:length(all_files)) {
                j <- read.csv(all_files[i])
                csum <- sum((!is.na(j$sulfate)) & (!is.na(j$nitrate)))
                if (csum > threshold) {
                        tmp <- j[which(!is.na(j$sulfate)), ]
                        submoni_i <- tmp[which(!is.na(tmp$nitrate)), ]
                        data <- c(data, cor(submoni_i$sulfate, submoni_i$nitrate))
                }
        }

        data
}
