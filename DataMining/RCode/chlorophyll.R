chloro_data <- read.csv('cholorophyll.csv', header = T, stringsAsFactors = F)
dim(chloro_data)[1]
splitloc <- strsplit(as.character(chloro_data $DateTimeStamp),' ') 
splitloc
for(i in 1:dim(chloro_data)[1])
{
  chloro_data $DATE[i] <- splitloc[[i]][1]
  chloro_data $TIME[i] <- splitloc[[i]][2]
}



chloro_data$datetime <- as.POSIXct(paste(chloro_data$DATE, chloro_data$TIME), format="%m/%d/%Y %H:%M")

c_10_til_9  <- subset(chloro_data, format(datetime,'%H') %in% c('10','11','12','13','14','15','16','17','18','19','20'))
c_at_9 <-  subset(chloro_data, format(datetime,'%H:%M') %in% c('21:00'))
c_10_to_9 <- rbind(c_10_til_9,c_at_9)
names(c_10_to_9)
chloro <- c_10_to_9[,c(3,4,5)]
chloro $CHLA_N <- as.factor(chloro $CHLA_N )
summary(chloro $CHLA_N )
#filtering do for rejected data

#handling dissolved oxygen data
dim(chloro)[1]
head(chloro)
splitloc <- strsplit(as.character(chloro $DateTimeStamp),' ') 
splitloc
for(i in 1:dim(chloro)[1])
{
  chloro $DATE[i] <- splitloc[[i]][1]
  chloro $TIME[i] <- splitloc[[i]][2]
}
summary(chloro $CHLA_N)
chloro $CHLA_N <- as.numeric(chloro $CHLA_N)
chloro_aggregate <- aggregate(chloro $CHLA_N , list(chloro $DATE) , mean)
names(chloro_aggregate) <- c("date","chlorophyll")
names(chloro_aggregate)
write.csv(chloro_aggregate, file = "chloro_aggregate.csv")



dates <- read.csv('dates.csv', header = T, stringsAsFactors = F)
dim(dates)
names(dates)
chloro_for_date <- merge(dates, chloro_aggregate , all.x = TRUE)
do_for_date $dissolvedoxygen <- as.factor(do_for_date $dissolvedoxygen)
summary(do_for_date $dissolvedoxygen)
write.csv(do_for_date, file = "final_dissolvedoxygen.csv")








