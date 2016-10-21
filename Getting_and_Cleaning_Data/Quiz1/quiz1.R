######################################
# Author: Medina Colic
# Course: Getting and Cleaning Data
# Assignment: Quiz1
######################################

###############
# Question 1
###############

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url=fileURL, destfile = "housing_of_idaho.csv", method ="curl")
list.files(".")

idaho_housing <- read.csv("housing_of_idaho.csv")
head(idaho_housing)
sum(idaho_housing$VAL==24 & !is.na(idaho_housing$VAL))

###############
# Question 2
###############

# Using the data from question 1. Consider the var FES in the codebook.
# Which of the “tidy data” principles does this variable violate?

# 1) Tidy data has one variable per column.
# 2) Numeric values in tidy data can not represent categories.
# 3) Tidy data has variable values that are internally consistent.
# 4) Each variable in a tidy data set has been transformed to be interpretable.

# Answer:
# 1) Tidy data has one variable per column. 

###############
# Question 3
###############

excelURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(url = excelURL, destfile = "natural_gas.xlxs", method = "curl")

rowIndex <- 18:23
colIndex <- 7:15

dat <- read.xlsx(file="natural_gas.xlsx", sheetIndex = 1, colIndex = colIndex,
                   startRow = 18, endRow = 23, header = TRUE)
head(dat)
sum(dat$Zip*dat$Ext, na.rm=T)


###############
# Question 4
###############

library(XML)

doc2 <-  xmlTreeParse("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml",
  useInternal = TRUE)
dat2 <- xmlRoot(doc2)
sum(xpathSApply(dat2, "//zipcode", xmlValue) == 21231)


###############
# Question 5
###############

library(data.table)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, destfile="./data3.csv")
data_table <- fread("./data3.csv")
system.time(data_table[,mean(pwgtp15),by=SEX])
system.time(mean(data_table[data_table$SEX==1,]$pwgtp15))+system.time(
  mean(data_table[data_table]$SEX==2,]$pwgtp15))
system.time(sapply(split(data_table$pwgtp15,data_table$SEX),mean))
system.time(mean(data_table$pwgtp15,by=data_table$SEX))
system.time(tapply(data_table$pwgtp15,data_table$SEX,mean))
system.time(rowMeans(data_tabl)[data_table$SEX==1])+system.time(
  rowMeans(data_table)[data_table$SEX==2]
