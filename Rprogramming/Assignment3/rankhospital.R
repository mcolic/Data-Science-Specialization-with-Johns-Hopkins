#################################################
# Author: Medina Colic
# Subject: R programming Coursera Data Science
# Assignment: Programming Assingment 3
#################################################


#################################################
# 3. Ranking hospitals by outcome in a state
#################################################

rankhospital <- function(state, outcome, num = "best") {
        ## Read outcome data
        outcome_data <- read.csv("outcome-of-care-measures.csv")

        ## Check that state and outcome are valid
        states <- levels(outcome_data[, 7])[outcome_data[, 7]]
        state_flag <- FALSE
        for (i in 1:length(states)) {
                if (state == states[i]) {
                        state_flag <- TRUE
                }
        }
        if (!state_flag) {
                stop ("invalid state")
        }
        if (!((outcome == "heart attack") | (outcome == "heart failure")
              | (outcome == "pneumonia"))) {
                stop ("invalid outcome")
        }

        ## Return hospital name in that state with the given rank 30-day death
        ## rate
        col <- if (outcome == "heart attack") {
                11
        } else if (outcome == "heart failure") {
                17
        } else {
                23
        }

        outcome_data[, col] <- suppressWarnings(as.numeric
          (levels(outcome_data[, col])[outcome_data[, col]]))
        outcome_data[, 2] <- as.character(outcome_data[, 2])
        statedata <- outcome_data[grep(state, outcome_data$State), ]
        orderdata <- statedata[order(statedata[, col],
          statedata[, 2], na.last = NA), ]
        if(num == "best") {
                orderdata[1, 2]
        } else if(num == "worst") {
                orderdata[nrow(orderdata), 2]
        } else{
                orderdata[num, 2]
        }
}
