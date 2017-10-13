install.packages("streamR")
library(streamR)
load("my_oauth.Rdata")
filterStream(file.name = "tweets1.json", # Save tweets in a json file
             track = c("Affordable Care Act", "ACA", "Obamacare"), # Collect tweets mentioning either Affordable Care Act, ACA, or Obamacare
             language = "en",
             location = c(-119, 33, -117, 35), # latitude/longitude pairs providing southwest and northeast corners of the bounding box.
             timeout = 60, # Keep connection alive for 60 seconds
             oauth = my_oauth) # Use my_oauth file as the OAuth credentials

tweets.df <- parseTweets("tweets.json", simplify = FALSE) # parse the json file and save to a data frame called tweets.df. Simplify = FALSE ensures that we include lat/lon information in that data frame.