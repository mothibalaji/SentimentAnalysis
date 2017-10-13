clean_text = function(x)
{
  x = gsub("rt", "", x) # remove Retweet
  x = gsub("@\\w+", "", x) # remove at(@)
  x = gsub("[[:punct:]]", "", x) # remove punctuation
  x = gsub("[[:digit:]]", "", x) # remove numbers/Digits
  x = gsub("http\\w+", "", x)  # remove links http
  x = gsub("[ |\t]{2,}", "", x) # remove tabs
  x = gsub("^ ", "", x)  # remove blank spaces at the beginning
  x = gsub(" $", "", x) # remove blank spaces at the end
  try.error = function(z) #To convert the text in lowercase
  {
    y = NA
    try_error = tryCatch(tolower(z), error=function(e) e)
    if (!inherits(try_error, "error"))
      y = tolower(z)
    return(y)
  }
  x = sapply(x, try.error)
  return(x)
}