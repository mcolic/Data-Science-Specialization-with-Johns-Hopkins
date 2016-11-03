##############
# Question 1
##############

fileURL1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileURL1, destfile = "microdata_survey.csv", method="curl")
question1 <- read.csv("microdata_survey.csv")
head(question1)

agricultureLogical <- (!is.na(question1$ACR)) & (!is.na(question1$AGS)) & (question1$ACR == 3) & (question1$AGS == 6)
which(agricultureLogical)

##############
# Question 2
##############

library(jpeg)

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg",
             destfile = "instructor.jpg", method = "curl", quiet = TRUE)
pic <- readJPEG("instructor.jpg", native = TRUE)
quantile(pic, probs = c(.30, .80))

##############
# Question 3
##############

fileURL2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
fileURL3 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"

download.file(fileURL2, destfile = "GDP_data.csv", method="curl")
GDP_data <- read.csv("GDP_data.csv", header = FALSE, skip = 5, nrows = 190))

download.file(fileURL3, destfile = "educational_data.csv", method="curl")
educational_data <- read.csv("educational_data.csv")

library(dplyr)

mergebycountry <- merge(x = GDP_data[, c(1,2)], y = educational_data[, 1:3],
                            by.x = "V1", by.y = "CountryCode" )
nrow(mergebycountry)

## Sort based on GDP
mergebycountry <- mergebycountry[order(desc(mergebycountry$V2)),]
## print the 13th country
mergebycountry[[13,"Long.Name"]]

##############
# Question 4
##############

countrysplit <- split(mergebycountry$V2, mergebycountry$Income.Group)
sapply(countrysplit, mean)

##############
# Question 5
##############

mergebycountry$qtile <- cut(mergebycountry$V2, breaks = quantile(mergebycountry$V2,
        probs = c(0, 0.2, 0.4, 0.6, 0.8, 1)), include.lowest = TRUE, labels = 1:5)
table(mergebycountry$qtile, mergebycountry$Income.Group)
