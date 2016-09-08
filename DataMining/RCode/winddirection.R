wind_data <- read.csv('Winddirectionraw.csv', header = T, stringsAsFactors = F)
dim(wind_data)[1]
names(wind_data)
wind_data <- wind_data[,c(3,4,5,19,20)]
splitloc <- strsplit(as.character(wind_data $DateTimeStamp),' ') 
length(splitloc)
for(i in 1:dim(wind_data)[1])
{
  wind_data $DATE[i] <- splitloc[[i]][1]
  wind_data $TIME[i] <- splitloc[[i]][2]
}



wind_data$datetime <- as.POSIXct(paste(wind_data$DATE, wind_data$TIME), format="%m/%d/%Y %H:%M")

wind_10_til_9  <- subset(wind_data, format(datetime,'%H') %in% c('10','11','12','13','14','15','16','17','18','19','20'))
wind_at_9 <-  subset(wind_data, format(datetime,'%H:%M') %in% c('21:00'))
wind_10_to_9 <- rbind(wind_10_til_9,wind_at_9)
names(wind_10_to_9)
#disoxygen <- do_10_to_9[,c(3,4,5,15,16)]
wind_10_to_9 <- as.factor(disoxygen $DO_mgl )
summary(wind_10_to_9 $Wdir )
#filtering do for rejected data
arrayofmatches <- grep("<-3>", wind_10_to_9 $F_Wdir)
length(arrayofmatches)
wind_cleansed  <- as.data.frame(wind_10_to_9 [-arrayofmatches,] )
#handling dissolved oxygen data
dim(wind_cleansed)[1]
head(wind_cleansed)

summary(wind_cleansed $Wdir)

wind_na_removed <- as.data.frame(wind_cleansed[!is.na(wind_cleansed $Wdir),])
summary(wind_na_removed $Wdir)

wind_na_removed $Wdir <- as.numeric(wind_na_removed $Wdir)

wind_data_aggregate <- aggregate(wind_na_removed $Wdir , list( wind_na_removed $DATE) , mean)
names(wind_data_aggregate) <- c("date","degreedir")
names(wind_data_aggregate)
write.csv(wind_data_aggregate, file = "wind_data_aggregate.csv")



dates <- read.csv('dates.csv', header = T, stringsAsFactors = F)
dim(dates)
names(dates)
wind_for_date <- merge(dates, wind_data_aggregate , all.x = TRUE)
wind_for_date $degreedir <- as.factor(wind_for_date $degreedir)
summary(wind_for_date $degreedir)
write.csv(wind_for_date, file = "winddirection_datewise.csv")








