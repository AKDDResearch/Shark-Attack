install.packages("instaR")

install.packages("RCurl")

my_app_client_id  <- "7c5aa747b9e342ea9e0daee2bdda692f"
my_app_client_secret <- "20841b6e5a2e40d1a7ae141757bea4ca"
require(instaR)

my_app_OAuth <- instaOAuth(my_app_client_id,my_app_client_secret,scope = "basic")


my_access_token <- "3526837964.7c5aa74.65b8a20cc9e147d8b4bf8e7ba0959be3"
#getting information from token id 
owner_info_end_point <- paste( "https://api.instagram.com/v1/users/self/?access_token=",my_access_token, sep="")
require(RCurl)
data <- getURL(owner_info_end_point)
data
json <- fromJSON(data)
json


#information about a user 
getUser <- function(username, token, userid=NULL){
  
  if (is.null(userid)){
    url <- paste0("https://api.instagram.com/v1/users/search?q=", username)
    content <- callAPI(url, token)
    if (length(content$data)==0) stop("Error. User name not found.")
    userid <- as.numeric(content$data[[1]]$id)
  }
  
  url <- paste0("https://api.instagram.com/v1/users/", userid)
  content <- callAPI(url, token)
  if (content$meta$code==400){
    stop(content$meta$error_message)
  }
  
  if (length(content$data)==0){ 
    stop("No public data about user was found")
  }
  
  df <- userDataToDF(content$data)
  return(df)
}

my_access <- "9c0df7823dd546338c9fb772a6bc84ff"
rashmi <- getUser( username="rash", token=my_access_token, )
9c0df7823dd546338c9fb772a6bc84ff