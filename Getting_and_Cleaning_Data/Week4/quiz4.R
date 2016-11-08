##############
# Question 1
##############

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url = fileURL, destfile = "microData_survey.csv", method = "curl")
idaho_housing <- read.csv("microData_survey.csv")

strsplit(names(idaho_housting),"wgtp")[[123]]

##############
# Question 2
##############

fileURL2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(url = fileURL2, destfile = "GDP.csv", method = "curl")
gdp_data <- read.csv("GDP.csv",header = FALSE, skip = 5, nrows = 190)

mean(as.numeric(gsub(",","",gdp_data$V4)))

##############
# Question 3
##############

grep("^United",gdp_data$V4)
grep("United", gdp_data$V4, value = TRUE)

##############
# Question 4
##############

fileURL3 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(url = fileURL3, destfile = "educational_data.csv", method = "curl")
educational_data <- read.csv("educational_data.csv")

fileURL4 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(url = fileURL4, destfile = "gdp_data2.csv", method = "curl")
gdp_data2 <- read.csv("gdp_data2.csv",header = FALSE, skip = 5, nrows = 190)

matchData <- merge(x = gdp_data2[, c(1,2)], y = educational_data[, c(1,10)],
                      by.x = "V1", by.y = "CountryCode" )
length(grep("Fiscal year end: June", matchData$Special.Notes))

##############
# Question 5
##############

install.packages("quntmod")
library(quantmod)

amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)

values2012 <- sampleTimes[grep("2012-", sampleTimes)]
length(values2012)

sum(weekdays(as.Date(values2012))=="Monday")
