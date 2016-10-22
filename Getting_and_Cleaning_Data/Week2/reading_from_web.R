##########################################
# Week 2: Reading from web
##########################################

# Webscraping - Programatically extracting
# data from the HTML code of websites.

con = url("yourURLlink")
htmlCode = readLines(con)
close(con)

# big long string
htmlCode

# Parsing with XML

library(XML)
url <- "yourURLlink"
html <- htmlTreeParse(url, useInternalNodes=T)

xpathSApply(html, "//title", xmlValue) # extracting just the title

# GET from the httr package

library(httr); html2 = GET(url)
content2 = content(html2, as="text")
parseHtml = htmlParse(content2, asText=TRUE)
xpathSApply(parseHtml, "//title", xmlValue)

# Accessing websites with password

pg2 = GET("http://httpbin.org/basic-auth/user/passwd",
    authenticate("user","passwd"))
pg2

# Using handles

google = handle("http://google.com")
pg1 = GET(handle=google, path="/")
pg2 = GET(handle=google, path="search)
