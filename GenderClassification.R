genderizeAPI = function(x, 
                        apikey = NULL, 
                        ssl.verifypeer = TRUE
) {
  
  termsQuery = x
  
  query = as.list(termsQuery)
  
  names(query)  = paste0('name[', 0:(length(termsQuery) - 1), ']')
  
  if (!is.null(apikey)) {
    
    query = c('apikey' = apikey, query)
    
  }
  
  # fix for version 1.0.0 of the httr package        
  #  r = httr::GET("https://api.genderize.io", httr::timeout(100), 
  #  query = query, httr::config(ssl.verifypeer = ssl.verifypeer)) 
  
  r = httr::GET("https://api.genderize.io", query = query, 
                httr::config(ssl_verifypeer = ssl.verifypeer))
  
  if (httr::status_code(r) == 200) {
    
    l = httr::content(r)
    if (is.atomic(l[[1]])) {l = list(l)}
    l = l[unlist(lapply(l, function(x) {!is.null(x$gender)}))]
    
    limitLeft = as.numeric(httr::headers(r)$'x-rate-limit-remaining')
    limit = as.numeric(httr::headers(r)$'x-rate-limit-limit')
    limitReset = as.numeric(httr::headers(r)$'x-rate-reset')
    
    return(
      list(
        response = data.table::rbindlist(l),
        limitLeft = limitLeft, 
        limit = limit, 
        limitReset = limitReset
      )
    )
    
  } else {
    
    cat('\n', httr::http_status(r)$message)
    cat('\n', httr::content(r)$error)
    
    if (httr::status_code(r) == 429) {
      
      warning('You have used all available requests in this subscription plan.')
      
    }
    
    
    return
  }
  
}