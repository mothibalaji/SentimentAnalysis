#install.packages("jsonlite")
library(jsonlite)




# Load the package required to read JSON files.
library("rjson")
library("RCurl")
library("bitops")
library("plyr")

#install.packages("gender")

#install.packages("genderdata", type = "source", repos = "http://packages.ropensci.org")

#install.packages(c("gender", "genderdata"),repos = "http://packages.ropensci.org",  type = "source")

library(gender)

yelp <- stream_in(file("tweets1.json"))

# Convert JSON file to a data frame.
json_data_frame <- as.data.frame(yelp)

print(json_data_frame)

#Extracted Tweets Alone
i=0
n=nrow(json_data_frame)
flag=1
for(i in 1:n ){
  flag=1
  if(i==1){
    text_before=json_data_frame$text[i];
    text2=unique(clean_text(text_before))
    name2=json_data_frame$user$name[i];
    processName=unlist(strsplit(name2, " "))[1]
    genderValue=gender(processName, method = "ssa")
    userGender=genderValue$gender
    #print(name)
    
    sent=sentiment(text2)
    val2=sent$polarity
  }else{
    text_before=json_data_frame$text[i];
    text3=unique(clean_text(text_before))
    text2=c(text2,text3);
    name3=json_data_frame$user$name[i];
    processName=unlist(strsplit(name3, " "))[1]
    genderValue=gender(processName, method = "ssa")
    comp=genderValue$gender
    
    if(grepl("character",typeof(comp))){
      userGender1=genderValue$gender
    }
    if(grepl("logical",typeof(comp))){
      userGender1="NA"
    }
   
    
    
    print(flag)
    print(userGender1)
   
    userGender=c(userGender,userGender1)
    name2=c(name2,name3);
    
    
    #print(name)
    print("*")
    sent=sentiment(json_data_frame$text[i])
    val3=sent$polarity
    val2=c(val2,val3)
    # print(val)
  }
  
  
}
