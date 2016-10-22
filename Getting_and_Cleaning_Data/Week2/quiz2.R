######################################
# Author: Medina Colic
# Course: Getting and Cleaning Data
# Assignment: Quiz2
######################################

###############
# Question 1
###############

myapp = oauth_app("github",
                    key="c7c98b589e02b067c7ef",
                    secret="df1f104503f523333ef84e92bd1b13ad6b734a34")
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/rate_limit", gtoken)
stop_for_status(req)
content(req)



###############
# Question 2
###############
data1 <- download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv",
                      destfile = "./question2.csv", method="curl")
acs <- read.csv("./question2.csv")
sqldf("select pwgtp1 from acs where AGEP < 50")

###############
# Question 3
###############

sqldf("select distinct AGEP from acs")

###############
# Question 4
###############

data2 <- url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode <- readLines(data2)
close(data2)
nchar(htmlCode[c(10, 20, 30, 100)])

###############
# Question 5
###############

data3 <- download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for",
                        destfile = "./question5.for", method = "curl")
df <- read.fwf(file="./question5.for",
                widths=c(10, -5, 4, 4,-5, 4, 4, -5, 4, 4, -5, 4, 4),
                  skip=4,col.names=c("Week", "Nino12SST", "Nino12SSTA", "Nino3SST", "Nino3SSTA", "Nino34SST", "Nino34SSTA", "Nino4SST", "Nino4SSTA"))
sum(df$Nino3SST)
