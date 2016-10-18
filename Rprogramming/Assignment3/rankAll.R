#################################################
# Author: Medina Colic
# Subject: R programming Coursera Data Science
# Assignment: Programming Assingment 3
#################################################


#################################################
# 4. Ranking hospitals in all states
#################################################

rankall <- function(outcome, num = "best") {
        ## Read outcome data
        outcome_data <- read.csv("outcome-of-care-measures.csv")

        ## Check that outcome is valid
        if (!((outcome == "heart attack") | (outcome == "heart failure")
              | (outcome == "pneumonia"))) {
                stop ("invalid outcome")
        }

        ## For each state, find the hospital of the given rank
        col <- if (outcome == "heart attack") {
                11
        } else if (outcome == "heart failure") {
                17
        } else {
                23
        }

        outcome_data[, col] <- suppressWarnings(as.numeric(levels(outcome_data[, col])[outcome_data[, col]]))
        outcome_data[, 2] <- as.character(outcome_data[, 2])

        # Generate an empty vector that will be filled later, row by row, to
        # generate the final output.
        output <- vector()

        states <- levels(outcome_data[, 7])

        for(i in 1:length(states)) {
                statedata <- outcome_data[grep(states[i], outcome_data$State), ]
                orderdata <- statedata[order(statedata[, col], statedata[, 2],
                                             na.last = NA), ]
                hospital <- if(num == "best") {
                        orderdata[1, 2]
                } else if(num == "worst") {
                        orderdata[nrow(orderdata), 2]
                } else{
                        orderdata[num, 2]
                }
                output <- append(output, c(hospital, states[i]))
        }

        ## Return a data frame with the hospital names and the (abbreviated)
        ## state name
        output <- as.data.frame(matrix(output, length(states), 2, byrow = TRUE))
        colnames(output) <- c("hospital", "state")
        rownames(output) <- states

        output
}
