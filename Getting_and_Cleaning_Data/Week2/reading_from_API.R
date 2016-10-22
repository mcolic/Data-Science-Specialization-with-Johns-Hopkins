##########################################
# Week 2: Reading from APIs
##########################################

# API - Application Programming Interface

# Accessing Twitter from R

# starting authorization process for your application
myapp = oauth_app("twitter",
                    key="yourConsumerKeyHere", secret="yourConsumerSecretHere")
sig = sign_oauth1.0(myapp,
                      token = "yourTokenHere",
                        token_secret = "yourTokenSecretHere")
homeTL = GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)

# Converting the json object

json1 = content(homeTL)
json2 = jsonlite::fromJSON(toJSON(json1)) # structured R objects back into JSON
json2[1,1:4]
