
install.packages("devtools")
library(devtools)
install.packages("httr")
install.packages("curl")

install_github("Rfacebook", "pablobarbera", subdir="Rfacebook")

require("Rfacebook")
require("httr")
require("curl")
fb_oauth <- fbOAuth(app_id="146096909147224", app_secret="3fbbed28ea1ce35beeab6834056cf209",extended_permissions = TRUE)
save(fb_oauth, file="fb_oauth")
load("fb_oauth")
#the getUsers function return public information about one or more Facebook user
me <- getUsers("me", token=fb_oauth)
summary(me)
me$name
my_friends <- getFriends(token=fb_oauth, simplify=FALSE)
my_friends
head(my_friends, n=10)
my_friends_info <- getUsers(my_friends$id, token=fb_oauth, private_info=TRUE)

#create a table with the relationship statuses

table(my_friends_info$relationship_status)



#analysis of facebook friends 
mat <- getNetwork(token=fb_oauth, format="adj.matrix")
library(igraph) 

network <- graph.adjacency(mat, mode="undirected") 

plot(network)

#find the pages liked by you and your friends.

my_likes <- getLikes(user="me", token=fb_oauth ) 

View(my_likes)



#Analysis of a facebook group 
ids <- searchGroup(name="sharkattack", token=fb_oauth) 
View(ids)
group1 <- getGroup(group_id=166016346751346, token=fb_oauth)
group2 <- getGroup(group_id=169112316753515, token=fb_oauth)




#analysis of facebook page 
pages <- searchPages( string="shark attack", token=fb_oauth )
# 200 pages 
#get the posts of one page  (international shark attack file page) #since and until can eb used to get posts of period 
fb_page <- getPage(page="531607613519779", token=fb_oauth)
View(fb_page)

#posts made by others not teh admin
postbyothers <- getPage(page="531607613519779", token=fb_oauth, feed=TRUE)



#analysis of facebook post 
post <- getPost(post=fb_page$id[18], n=2000, token=fb_oauth)
View(post)








