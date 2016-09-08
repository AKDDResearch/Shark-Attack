sharkattacknc <- read.csv('NC-2000_2016.csv', header = T, stringsAsFactors = F)
#1) barplot of activity invloved while attack 
summary(sharkattacknc $Activity)
sharkattacknc$Activity[sharkattacknc$Activity==""]<-"Others"
sharkattacknc $Activity <- as.factor(sharkattacknc $Activity)
sharkattacknc $Activity <- gsub("\\s","", sharkattacknc $Activity)
sharkattacknc $Activity <- as.factor(sharkattacknc $Activity)
sharkattacknc $Activity <- gsub("?","", sharkattacknc $Activity)
sharkattacknc $Activity <- as.factor(sharkattacknc $Activity)
sharkattacknc $Activity<- gsub("[^[:alnum:]///' ]", "", sharkattacknc $Activity)
sharkattacknc $Activity <- tolower(sharkattacknc $Activity)
# Simple Bar Plot 
counts <- table(sharkattacknc $Activity)
counts

 barplot(counts, main="Activities during attack", ylim = c(0,20),
        xlab="Activities" ,ylab = "No of attacks" ,col = "darkgreen")
 
 
 #2)Barplot of species of sharks vs attacks
 summary(sharkattacknc $Species) 
 sharkattacknc $Species <- tolower(sharkattacknc $Species)
 arrayofmatches <- grep("tiger", sharkattacknc $Species)
 arrayofmatches
 sharkattacknc $Species[arrayofmatches] <- "tiger shark"
 arrayofmatches <- grep("white", sharkattacknc $Species)
 arrayofmatches
 sharkattacknc $Species[arrayofmatches] <- "white shark"
 arrayofmatches <- grep("bull", sharkattacknc $Species)
 arrayofmatches
 sharkattacknc $Species[arrayofmatches] <- "bull shark"
 sharkattacknc $Species <- as.factor(sharkattacknc $Species)
 sharkattacknc $Species <- as.character(sharkattacknc $Species)
 arrayofmatches <- grep("involvement", sharkattacknc $Species)
 arrayofmatches
 sharkattacknc $Species[arrayofmatches] <- "Not Confirmed"
 arrayofmatches <- grep("sand", sharkattacknc $Species)
 arrayofmatches
 sharkattacknc $Species[arrayofmatches] <- "sand shark"
 arrayofmatches <- grep("", sharkattacknc $Species)
 arrayofmatches
 sharkattacknc $Species[arrayofmatches] <- "sand shark"
 sharkattacknc$Species[sharkattacknc$Species==""]<-"Unknown"
 sharkattacknc $Species <- gsub("shark","", sharkattacknc $Species)
 
 counts <- table(sharkattacknc $Species)
 counts
 library(ggplot2)
 qplot(sharkattacknc $Species, main="Sharks involved in attacks", ylim = c(0,25),
         xlab="Sharks Species/Size" ,ylab = "No of attacks" ) + coord_flip()
 
 
 #locations
 splitloc <- strsplit(as.character(sharkattacknc$Location),',') 
 splitloc
 for(i in 1:60)
 {print(i)
   print(length(splitloc[[i]]))
   print(splitloc[[i]][length(splitloc[[i]])])
   sharkattacknc $county[i] <- splitloc[[i]][length(splitloc[[i]])]
 }
 
 summary(sharkattacknc $county)
 sharkattacknc $county <- as.factor(sharkattacknc $county)
 sharkattacknc $county <- as.character(sharkattacknc $county) 
 sharkattacknc $county <- gsub("County","", sharkattacknc $county)
 sharkattacknc $county <- gsub("\\s","", sharkattacknc $county)
 sharkattacknc $county  <- tolower(sharkattacknc $county )
 arrayofmatches <- grep("brunswick", sharkattacknc $county)
 arrayofmatches
 sharkattacknc $county[arrayofmatches] <- "brunswick"
 arrayofmatches <- grep("onslow", sharkattacknc $county)
 arrayofmatches
 sharkattacknc $county[arrayofmatches] <- "onslow"
 library(ggplot2)
 qplot(sharkattacknc $county, main="County of attacks", ylim = c(0,20),
       xlab="County of north carolina " ,ylab = "No of attacks" ) + coord_flip()
 
 
 #time 
 sharkattacknc <- read.csv('NC-2000_2016_time.csv', header = T, stringsAsFactors = F)
 summary(sharkattacknc $time.of.attack)
 sharkattacknc $time.of.attack <- as.factor(sharkattacknc $time.of.attack)
 sharkattacknc $time.of.attack <- as.character(sharkattacknc $time.of.attack)
 arrayofmatches <- grep("0", sharkattacknc $time.of.attack)
 arrayofmatches
 sharkattacknc $time.of.attack[arrayofmatches] <- "Not recorded"
 counts <- table(sharkattacknc $time.of.attack)
 counts
 
 barplot(counts, main="Time of attack", ylim = c(0,30),
         xlab="Time of attack" ,ylab = "No of attacks" ,col = "darkgreen")
 
 