#merging weather data with shark attack

ncdata <- read.csv('nc_data.csv', header = T, stringsAsFactors = F)
ncdata09_16 <- subset(ncdata , ncdata$Year >=2009)
scdata <- read.csv('sc_data.csv', header = T, stringsAsFactors = F)
names(ncdata09_16)
names(scdata)
names(scdata)[20]<-paste("time.of.attack") 
sharkdata <- rbind(ncdata09_16,scdata)

names(sharkdata)
sharkattackdates<- read.csv('shark_attack_dates.csv', header = T, stringsAsFactors = F)
names(sharkattackdates)
names(sharkattackdates) <- c("Date","attack","moonphase")
sharkattackdates <- sharkattackdates[,-c(2)]
sharkdata $Date<- gsub("\\s","", sharkdata $Date)
sharkattackdates $Date<- gsub("\\s","", sharkattackdates $Date)

sharkdata $Date <- as.Date(sharkdata $Date, "%d-%B-%y")
sharkattackdates $Date <- as.Date(sharkattackdates $Date,"%d-%B-%y" )
sharkdata $Date <- as.factor(sharkdata $Date)
sharkattackdates $Date <- as.factor(sharkattackdates $Date)


sharkfile <- merge(sharkattackdates,sharkdata ,all.x = TRUE )
sharkfile $Attack[is.na(sharkfile $Attack)] <- "No" 
sharkfile $Attack <- as.factor(sharkfile $Attack)
summary(sharkfile $Attack)
sharkfile $Area <- as.factor(sharkfile $Area)
summary(sharkfile $Area)
sharkfile <- sharkfile[!duplicated(sharkfile),]


#north carolina data 
sharkfile $Area <- as.factor(sharkfile $Area)
summary(sharkfile $Area)
sharkfilenc <- subset(sharkfile , sharkfile $Area == "North Carolina" )
weathercape <-  read.csv('capehatterasweather.csv', header = T, stringsAsFactors = F)
names(sharkfilenc)
names(weathercape)
weathercape <- weathercape[,-c(1)]
names(weathercape) <- c("Date","DailyAverageDryBulbTemp","DailyPrecipitation","DailyAverageStationPressure","DailyAverageWindSpeed","DailyAverageDewPointTemp")
weathercape $Date <- as.Date(weathercape $Date, "%d-%B-%y")

weathercape $Date <- as.factor(weathercape $Date)

weatherfilenc <- merge(sharkfilenc,weathercape ,all.x = TRUE )


#south carolina data 
sharkfile $Area <- as.factor(sharkfile $Area)
summary(sharkfile $Area)
sharkfilesc <- subset(sharkfile , sharkfile $Area == "South Carolina" )
weathermyrtle <- read.csv('myrtleweather.csv', header = T, stringsAsFactors = F)
names(sharkfilesc)
names(weathermyrtle)
weathermyrtle <- weathermyrtle[,-c(1)]
names(weathermyrtle) <- c("Date","DailyAverageDryBulbTemp","DailyPrecipitation","DailyAverageStationPressure","DailyAverageWindSpeed","DailyAverageDewPointTemp")
weathermyrtle $Date <- as.Date(weathermyrtle $Date, "%d-%B-%y")
weathermyrtle $Date <- as.factor(weathermyrtle $Date)
sharkfilesc $Date <- as.factor(sharkfilesc $Date)
weatherfilesc <- merge(sharkfilesc,weathermyrtle ,all.x = TRUE )



#for attack = no 

sharkfile $Attack <- as.factor(sharkfile $Attack)
summary(sharkfile $Attack)
noattackfile <- subset(sharkfile , sharkfile $Attack ==  "No")
weatherbeaufort <-  read.csv('beaufortweather.csv', header = T, stringsAsFactors = F)
names(noattackfile)
names(weatherbeaufort)
weatherbeaufort <- weatherbeaufort[,-c(1)]
names(weatherbeaufort) <- c("Date","DailyAverageDryBulbTemp","DailyPrecipitation","DailyAverageStationPressure","DailyAverageWindSpeed","DailyAverageDewPointTemp")

weatherbeaufort $Date <- as.factor(weatherbeaufort $Date)
noattackfile $Date <- as.factor(noattackfile $Date)
weatherfilenoattack <- merge(noattackfile,weatherbeaufort ,all.x = TRUE )


dim(weatherfilesc)
dim(weatherfilenc)
dim(weatherfilenoattack)
weathersharkfile <- rbind(weatherfilenc,weatherfilesc,weatherfilenoattack)
dim(weathersharkfile)



write.csv(weathersharkfile, file = "weathersharkattackintegrated.csv")


