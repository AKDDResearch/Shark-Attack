allsharkfile <- read.csv("sharkfiletotal.csv", header = T, stringsAsFactors = F)
names(allsharkfile)
allsharkfile <- allsharkfile[,c(2,10,11,18,19,21,24,30,32,33,34,35,36,4)]


splitloc <- strsplit(as.character(allsharkfile $Location),',') 
length(splitloc)
for(i in 1:length(splitloc))
{#print(i)
  #  print(length(splitloc[[i]]))
  # print(splitloc[[i]][length(splitloc[[i]])])
  allsharkfile $beach[i] <- splitloc[[i]][1]
  allsharkfile $county[i] <- splitloc[[i]][length(splitloc[[i]])]
}
names(allsharkfile)

#moonphase
moonphase <- read.csv("shark_attack_dates.csv", header = T, stringsAsFactors = F)
dim(moonphase)
dim(allsharkfile)
names(moonphase)
names(allsharkfile)
moonphase <- moonphase[,c(1,3,4)]
allsharkmoonphase <-  merge(allsharkfile,moonphase,all.x = TRUE)
names(allsharkmoonphase)

#turtle data 
turtledatadate <- read.csv("turtledatancdatewise.csv", header = T, stringsAsFactors = F)
names(turtledatadate)
turtledatadate <- turtledatadate[,c(2,5)]
names(turtledatadate) <- c("Date","TurtleExactCount")
moonphase <- read.csv("shark_attack_dates.csv", header = T, stringsAsFactors = F)
names(moonphase)
alldates <- as.data.frame(moonphase[,c(1)])
names(alldates) <- c("Date")
turtlewithalldates <- merge(alldates,turtledatadate,all.x = TRUE)
names(turtlewithalldates)
turtlewithalldates $TurtleExactCount[is.na(turtlewithalldates$TurtleExactCount)] <- 0



library(infotheo)

# nbins<- sqrt(NROW(data.frame$Pounds))
dis_turtle_exact_count <-discretize(turtlewithalldates$TurtleExactCount,"equalwidth", 4)
turtlewithalldates$TurtleActivity <- dis_turtle_exact_count $X
summary(turtlewithalldates $TurtleActivity )
turtlewithalldates$TurtleActivity[turtlewithalldates$TurtleActivity == 1] = 'Low'
turtlewithalldates$TurtleActivity[turtlewithalldates$TurtleActivity == 2] = 'Medium'
turtlewithalldates$TurtleActivity[turtlewithalldates$TurtleActivity == 3] = 'High'
turtlewithalldates$TurtleActivity[turtlewithalldates$TurtleActivity == 4] = 'Very High'
turtlewithalldates $Date <- as.factor(turtlewithalldates $Date)
turtlewithalldates $TurtleActivity <- as.factor(turtlewithalldates $TurtleActivity)
summary(turtlewithalldates $TurtleActivity )

names(turtlewithalldates)
names(turtlewithalldates) <- c("Date","TurtleExactCount","turtleexactdiscretize")
names(allsharkmoonphase)
all_shark_moon_turtle <- merge(turtlewithalldates,allsharkmoonphase)
all_shark_moon_turtle <- all_shark_moon_turtle[!duplicated(all_shark_moon_turtle),]
names(all_shark_moon_turtle)
write.csv(all_shark_moon_turtle, "mainfile.csv")




#add sc data
turtlescdatadate <- read.csv("turtledatascdatewise.csv", header = T, stringsAsFactors = F)
names(turtlescdatadate)
turtlescdatadate <- turtlescdatadate[,c(2,5)]
names(turtlescdatadate) <- c("Date","TurtleExactCountSC")
moonphase <- read.csv("shark_attack_dates.csv", header = T, stringsAsFactors = F)
names(moonphase)
alldates <- as.data.frame(moonphase[,c(1)])
names(alldates) <- c("Date")
turtlescwithalldates <- merge(alldates,turtlescdatadate,all.x = TRUE)
names(turtlescwithalldates)
turtlescwithalldates $TurtleExactCountSC[is.na(turtlescwithalldates$TurtleExactCountSC)] <- 0




library(infotheo)

# nbins<- sqrt(NROW(data.frame$Pounds))
dis_turtle_exact_count <-discretize(turtlescwithalldates$TurtleExactCountSC,"equalwidth", 4)
turtlescwithalldates$TurtleActivity <- dis_turtle_exact_count $X
summary(turtlescwithalldates $TurtleActivity )
turtlescwithalldates$TurtleActivity[turtlescwithalldates$TurtleActivity == 1] = 'Low'
turtlescwithalldates$TurtleActivity[turtlescwithalldates$TurtleActivity == 2] = 'Medium'
turtlescwithalldates$TurtleActivity[turtlescwithalldates$TurtleActivity == 3] = 'High'
turtlescwithalldates$TurtleActivity[turtlescwithalldates$TurtleActivity == 4] = 'Very High'
turtlescwithalldates $Date <- as.factor(turtlescwithalldates $Date)
turtlescwithalldates $TurtleActivity <- as.factor(turtlescwithalldates $TurtleActivity)
summary(turtlescwithalldates $TurtleActivity )
names(turtlescwithalldates)
names(turtlescwithalldates) <- c("Date","TurtleExactCountSC","turtleexactdiscretizeSC")
names(alldatessharkfile)


#read the file
alldatesharkfile <- read.csv("alldatesharkfile.csv", header = T, stringsAsFactors = F)
names(alldatesharkfile)
alldatesharkfile <- alldatesharkfile[,-c(1)]
alldatesharkfile $Date <- as.Date(alldatesharkfile $Date ,"%m/%d/%y")
alldatesharkfile $Date <- format(alldatesharkfile $Date ,"%m/%d/%Y")
alldatesharkfile $Date <- as.factor(alldatesharkfile $Date)

turtlescwithalldates $Date <- as.Date(turtlescwithalldates $Date ,"%m/%d/%Y")
turtlescwithalldates $Date <- format(turtlescwithalldates $Date ,"%m/%d/%Y")
turtlescwithalldates $Date <- as.factor(turtlescwithalldates $Date)

sharkalldate_turtlesc <- merge(turtlescwithalldates,alldatesharkfile)
sharkalldate_turtlesc <- sharkalldate_turtlesc[!duplicated(sharkalldate_turtlesc),]
write.csv(sharkalldate_turtlesc, "alldatesharkwithsc.csv")



#fix crab data
crabdata <-   read.csv("crabdata.csv")
names(crabdata)
library(infotheo)
crabdata $Pounds <- as.numeric(crabdata $Pounds)
crabdata$crablandings_norm <- scale(crabdata$Pounds,center = TRUE,scale =TRUE )
dis_crabdata <- discretize(crabdata$Pounds,"equalwidth", 3)
crabdata$PoundsCategory <- dis_crabdata $X

crabdata$PoundsCategory[crabdata$PoundsCategory == 1] = 'Low'
crabdata$PoundsCategory[crabdata$PoundsCategory == 2] = 'Medium'
crabdata$PoundsCategory[crabdata$PoundsCategory == 3] = 'High'
crabdata <- crabdata[,-c(1)]
names(crabdata) <- c("Date","Pounds","Crab_normalised","PoundsCategory")
names(crabdata)

alldatesfinal <- read.csv("alldatesfinal.csv", header = T, stringsAsFactors = F)
names(alldatesfinal)


alldatesfinal $Date <- as.Date(alldatesfinal $Date ,"%m/%d/%Y")
alldatesfinal $Date <- format(alldatesfinal $Date ,"%m/%d/%Y")
alldatesfinal $Date <- as.factor(alldatesfinal $Date)

crabdata $Date <- as.Date(crabdata $Date ,"%m/%d/%Y")
crabdata $Date <- format(crabdata $Date ,"%m/%d/%Y")
crabdata $Date <- as.factor(crabdata $Date)

#colnames(crabdata)[2] <- "DATE"
#names(sharkfile)
#colnames(sharkfile)[1] <- "DATE"
#names(crabdata)
alldateswithcrab <-  merge(alldatesfinal,crabdata)
write.csv(alldateswithcrab, "finalalldates.csv")








#wind direction 


finalallwowind <- read.csv("finalalldates.csv", header = T, stringsAsFactors = F)
wind_dirdata <- read.csv('winddirection_datewise_Modified.csv', header = T, stringsAsFactors = F)
names(wind_dirdata)
wind_dirdata <- wind_dirdata[,-c(1,3)]
names(wind_dirdata) <- c("Date","Degree","Direction")



wind_dirdata $Date <- as.Date(wind_dirdata $Date, "%m/%d/%Y")
wind_dirdata $Date <- format(wind_dirdata $Date, "%m/%d/%Y")
wind_dirdata $Date <- as.factor(wind_dirdata $Date)





finalallwowind $Date <- as.Date(finalallwowind $Date, "%m/%d/%Y")
finalallwowind $Date <- format(finalallwowind $Date, "%m/%d/%Y")
finalallwowind $Date <- as.factor(finalallwowind $Date)


finalfile <- merge(finalallwowind,wind_dirdata ,all.x = TRUE )
dim(finalfile)


#moonphase +-3 and +- 4 
moonphase <- read.csv("shark_attack_dates.csv", header = T, stringsAsFactors = F)
dim(moonphase)
dim(finalfile)
names(moonphase)
names(finalfile)
moonphase <- moonphase[,c(1,5,6)]

moonphase $Date <- as.Date(moonphase $Date, "%m/%d/%Y")
moonphase $Date <- format(moonphase $Date, "%m/%d/%Y")
moonphase $Date <- as.factor(moonphase $Date)

final_with_3_4 <-  merge(finalfile,moonphase)
dim(final_with_3_4)
final_with_3_4 <- final_with_3_4[!duplicated(final_with_3_4),]

write.csv(final_with_3_4 , file = "largefile.csv")

