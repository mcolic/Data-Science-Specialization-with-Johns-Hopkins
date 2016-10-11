#################################################
# Author: Medina Colic
# Subject: R programming Coursera Data Science
# Assignment: Quiz 3
#################################################

#############
# Question 1
#############

library(datasets)
data(iris)

# iris

virginica < subset(iris, Species == "virginica")
# virginica
summary(virginica)
sapply(virginica[,1:4], mean)

# Sepal.Length  Sepal.Width Petal.Length  Petal.Width
#       6.588        2.974        5.552        2.026

##############
# Question 2
##############

apply(iris[, 1:4], 2, mean)

# Sepal.Length  Sepal.Width Petal.Length  Petal.Width
#       6.588        2.974        5.552        2.026

##############
# Question 3
##############

library(datasets)
data(mtcars)

# mtcars

sapply(split(mtcars$mpg, mtcars$cyl), mean)
tapply(mtcars$mpg, mtcars$cyl, mean)
with(mtcars, tapply(mpg, cyl, mean))


##############
# Question 4
##############

a <- with(mtcars, tapply(hp, cyl, mean))
range_val <- max(a) - min(a)

# [1] 11.56364

##############
# Question 5
##############

debug(ls)
ls

# Execution of 'ls' will suspend at
# the beginning of the function and you will be in the browser.
