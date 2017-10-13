

# Install and Activate Packages
install.packages("streamR")
install.packages("RCurl")
install.packages("ROAuth")
install.packages("RJSONIO")
library(streamR)
library(RCurl)
library(RJSONIO)
library(stringr)

require('ROAuth')
require('RCurl')

requestURL <- "https://api.twitter.com/oauth/request_token"
accessURL <- "https://api.twitter.com/oauth/access_token"
authURL <- "https://api.twitter.com/oauth/authorize"
consumerKey <- "3CYPzFkcYlylODEMlQKjZgg81" # From dev.twitter.com
consumerSecret <- "c6DPp9P9yIBawCmVIKNDtCP3WrmkvuoTtvPsHRqLQHFhdMRaOS" # From dev.twitter.com

my_oauth <- OAuthFactory$new(consumerKey = consumerKey,
                             consumerSecret = consumerSecret,
                             requestURL = requestURL,
                             accessURL = accessURL,
                             authURL = authURL)
my_oauth

my_oauth$handshake(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"))

save(my_oauth, file = "my_oauth.Rdata")