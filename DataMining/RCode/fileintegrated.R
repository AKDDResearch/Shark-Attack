#Code to integrate data from all data files
#integrated Moonphase , Turtle,Weather , Dissolved Oxygen , Water Temperature 
sharkfile <- read.csv("NC_AND_SC.csv", header = T, stringsAsFactors = F)
names(sharkfile)
sharkfile <- sharkfile[,c(2,6,7,14,15,17,20)]
splitloc <- strsplit(as.character(sharkfile $Location),',') 
length(splitloc)
for(i in 1:length(splitloc))
{#print(i)
#  print(length(splitloc[[i]]))
 # print(splitloc[[i]][length(splitloc[[i]])])
  sharkfile $beach[i] <- splitloc[[i]][1]
  sharkfile $county[i] <- splitloc[[i]][length(splitloc[[i]])]
}
names(sharkfile)




#moonphase
moonphase <- read.csv("shark_attack_dates.csv", header = T, stringsAsFactors = F)
dim(moonphase)
dim(sharkfile)
names(moonphase)
names(sharkfile)
moonphase <- moonphase[,c(1,3,4)]
sharkfilemoonphase <-  merge(sharkfile,moonphase)

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
names(sharkfilemoonphase)
shark_moon_turtle <- merge(turtlewithalldates,sharkfilemoonphase)
shark_moon_turtle <- shark_moon_turtle[!duplicated(shark_moon_turtle),]

#add 
#tactivity <- read.csv("turtleactivity.csv", header = T, stringsAsFactors = F)

#turtledatadate <- cbind(turtledatadate,tactivity $Turtle.Count,tactivity $Turtle.Activity,all.x = TRUE)



#weather data 

#north carolina data 
shark_moon_turtle $Area <- as.factor(shark_moon_turtle $Area)
summary(shark_moon_turtle $Area)
sharkfilenc <- subset(shark_moon_turtle , shark_moon_turtle $Area == "North Carolina" )
weathercape <-  read.csv('capehatterasweather.csv', header = T, stringsAsFactors = F)
names(sharkfilenc)
names(weathercape)
weathercape <- weathercape[,-c(1)]
names(weathercape) <- c("Date","DailyAverageDryBulbTemp","DailyPrecipitation","DailyAverageStationPressure","DailyAverageWindSpeed","DailyAverageDewPointTemp")
weathercape $Date <- as.Date(weathercape $Date, "%d-%B-%y")
#weathercape $Date <- format(weathercape $Date ,"%m/%d/%Y")
weathercape $Date <- as.factor(weathercape $Date)
sharkfilenc $Date <- as.Date(sharkfilenc $Date ,"%m/%d/%Y")
sharkfilenc $Date <- as.factor(sharkfilenc $Date)
weatherfilenc <- merge(sharkfilenc,weathercape  )


#south carolina data 
shark_moon_turtle $Area <- as.factor(shark_moon_turtle $Area)
summary(shark_moon_turtle $Area)

sharkfilesc <- subset(shark_moon_turtle , shark_moon_turtle $Area == "South Carolina" )
weathermyrtle <- read.csv('myrtleweather.csv', header = T, stringsAsFactors = F)
names(sharkfilesc)
names(weathermyrtle)
weathermyrtle <- weathermyrtle[,-c(1)]
names(weathermyrtle) <- c("Date","DailyAverageDryBulbTemp","DailyPrecipitation","DailyAverageStationPressure","DailyAverageWindSpeed","DailyAverageDewPointTemp")
weathermyrtle $Date <- as.Date(weathermyrtle $Date, "%d-%B-%y")
#weathermyrtle $Date <- format(weathermyrtle $Date ,"%m/%d/%Y")
weathermyrtle $Date <- as.factor(weathermyrtle $Date)
sharkfilesc $Date <- as.Date(sharkfilesc $Date ,"%m/%d/%Y")
sharkfilesc $Date <- as.factor(sharkfilesc $Date)
weatherfilesc <- merge(sharkfilesc,weathermyrtle ,all.x = TRUE )

#combine nc and sc data rowwise
dim(weatherfilesc)
dim(weatherfilenc)
shark_moon_turtle_weather <- rbind(weatherfilenc,weatherfilesc)
dim(shark_moon_turtle_weather)
names(shark_moon_turtle_weather)
shark_moon_turtle_weather <- shark_moon_turtle_weather[,-c(14,18)]
dim(shark_moon_turtle_weather)


#water data 
salturbtempdata <- read.csv('finalsalturbtemp_cleansed.csv', header = T, stringsAsFactors = F)
names(salturbtempdata)
salturbtempdata <- salturbtempdata[,c(-1)]
salturbtempdata $Date <- as.Date(salturbtempdata $Date, "%m/%d/%Y")
salturbtempdata $Date <- as.factor(salturbtempdata $Date)

shark_moon_turtle_weather_water <- merge(shark_moon_turtle_weather,salturbtempdata ,all.x = TRUE )

#dissolved oxygen

dissoxydata <- read.csv('finaldissolvedoxygen_Modified.csv', header = T, stringsAsFactors = F)
names(dissoxydata)
dissoxydata <- dissoxydata[,-c(1,3)]
names(dissoxydata) <- c("Date","DissolvedO2")
dissoxydata $Date <- as.Date(dissoxydata $Date, "%m/%d/%Y")
dissoxydata $Date <- as.factor(dissoxydata $Date)
shark_moon_turtle_weather_waterO2 <- merge(shark_moon_turtle_weather_water,dissoxydata ,all.x = TRUE )
dim(shark_moon_turtle_weather_waterO2)

outputfile <- as.data.frame(shark_moon_turtle_weather_waterO2)
head(outputfile)
write.csv(outputfile , file = "output.csv")


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
attackdatesharkfile <- read.csv("attackdateshark.csv", header = T, stringsAsFactors = F)
names(attackdatesharkfile)
attackdatesharkfile <- attackdatesharkfile[,-c(1)]
attackdatesharkfile $Date <- as.Date(attackdatesharkfile $Date ,"%m/%d/%y")
attackdatesharkfile $Date <- format(attackdatesharkfile $Date ,"%m/%d/%Y")
attackdatesharkfile $Date <- as.factor(attackdatesharkfile $Date)

turtlescwithalldates $Date <- as.Date(turtlescwithalldates $Date ,"%m/%d/%Y")
turtlescwithalldates $Date <- format(turtlescwithalldates $Date ,"%m/%d/%Y")
turtlescwithalldates $Date <- as.factor(turtlescwithalldates $Date)

sharkattackdate_turtlesc <- merge(turtlescwithalldates,attackdatesharkfile)
sharkattackdate_turtlesc <- sharkattackdate_turtlesc[!duplicated(sharkattackdate_turtlesc),]
write.csv(sharkattackdate_turtlesc, "attackdatesharkwithsc.csv")



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

sharkattackfinal <- read.csv("sharkattackfinal.csv", header = T, stringsAsFactors = F)
names(sharkattackfinal)


sharkattackfinal $Date <- as.Date(sharkattackfinal $Date ,"%m/%d/%Y")
sharkattackfinal $Date <- format(sharkattackfinal $Date ,"%m/%d/%Y")
sharkattackfinal $Date <- as.factor(sharkattackfinal $Date)

crabdata $Date <- as.Date(crabdata $Date ,"%m/%d/%Y")
crabdata $Date <- format(crabdata $Date ,"%m/%d/%Y")
crabdata $Date <- as.factor(crabdata $Date)

#colnames(crabdata)[2] <- "DATE"
#names(sharkfile)
#colnames(sharkfile)[1] <- "DATE"
#names(crabdata)
sharkfilewithcrab <-  merge(sharkattackfinal,crabdata)
write.csv(sharkfilewithcrab, "finalsharkattacks.csv")




#wind direction 



finalfilewowind <- read.csv("finalsharkattacks.csv", header = T, stringsAsFactors = F)
wind_dirdata <- read.csv('winddirection_datewise_Modified.csv', header = T, stringsAsFactors = F)
names(wind_dirdata)
wind_dirdata <- wind_dirdata[,-c(1,3)]
names(wind_dirdata) <- c("Date","Degree","Direction")



wind_dirdata $Date <- as.Date(wind_dirdata $Date, "%m/%d/%Y")
wind_dirdata $Date <- format(wind_dirdata $Date, "%m/%d/%Y")
finalfilewowind $Date <- as.Date(finalfilewowind $Date, "%m/%d/%Y")
finalfilewowind $Date <- format(finalfilewowind $Date, "%m/%d/%Y")
finalfilewowind $Date <- as.factor(finalfilewowind $Date)


finalfile <- merge(finalfilewowind,wind_dirdata  )
dim(finalfile)


#moonphase +-3 and +- 4 
wind_dirdata $Date <- as.factor(wind_dirdata $Date)





moonphase <- read.csv("shark_attack_dates.csv", header = T, stringsAsFactors = F)
dim(moonphase)
dim(sharkfile)
names(moonphase)
names(finalfile)
moonphase <- moonphase[,c(1,5,6)]

moonphase $Date <- as.Date(moonphase $Date, "%m/%d/%Y")
moonphase $Date <- format(moonphase $Date, "%m/%d/%Y")
moonphase $Date <- as.factor(moonphase $Date)

final_with_3_4 <-  merge(finalfile,moonphase)
final_with_3_4 <- final_with_3_4[!duplicated(final_with_3_4),]

write.csv(final_with_3_4 , file = "smallfile.csv")

