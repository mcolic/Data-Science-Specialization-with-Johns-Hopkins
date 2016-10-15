#################################################
# Author: Medina Colic
# Subject: R programming Coursera Data Science
# Assignment: Programming Assingment 3
#################################################

#################################################
# 1 Plot the 30-day mortality rates for heart
# attack
#################################################

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
ncol(outcome)
## [1] 46
nrow(outcome)
## [1] 4706

outcome[, 11] <- as.numeric(outcome[, 11])
## You may get a warming about NAs being introduced; that is okay
## Warning message:
## NAs introduced by coercion

hist(outcome[, 11])
## histogram generated

#################################################
# Finding the best hospital in a state
#################################################

best <- function(state, outcome) {
  ## Read outcome data
  outcome <- read.csv("outcome-of-care-measures.csv",
                      colClasses = "character")

  ## Check that state and outcomes are valid

  ## Return hospital name in that state with lowest 30-day death rate

}
