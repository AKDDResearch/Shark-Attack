#Code to get dailt data for salinity and turbidity from raw data source

sal_turb_data <- read.csv('sal_turb_data.csv', header = T, stringsAsFactors = F)

#sal_turb_data$date <- strptime(x = as.vector(sal_turb_data$DateTimeStamp),format = "%d/%m/%Y %H:%M")
#select timings from 10 am to 9 pm 

dim(sal_turb_data)[1]
splitloc <- strsplit(as.character(sal_turb_data $DateTimeStamp),' ') 
splitloc
for(i in 1:dim(sal_turb_data)[1])
{
  sal_turb_data $DATE[i] <- splitloc[[i]][1]
  sal_turb_data $TIME[i] <- splitloc[[i]][2]
}



sal_turb_data$datetime <- as.POSIXct(paste(sal_turb_data$DATE, sal_turb_data$TIME), format="%m/%d/%Y %H:%M")

sal_turb_10_til_9  <- subset(sal_turb_data, format(datetime,'%H') %in% c('10','11','12','13','14','15','16','17','18','19','20'))
sal_turb_at_9 <-  subset(sal_turb_data, format(datetime,'%H:%M') %in% c('21:00'))
sal_turb_10_to_9 <- rbind(sal_turb_10_til_9,sal_turb_at_9)


names(sal_turb_10_to_9)
salturb <- sal_turb_10_to_9[,c(3,4,5,7,8,11,12,23,24)]
salturb $F_Temp <- as.factor(salturb $F_Temp)
summary(salturb $F_Temp)
write.csv(salturb, file = "salturb.csv")
#removing rejected data from the dataset for each of the variables salinity ,turbidity and temperature with F_Flaf = <-3>
dim(salturb)
names(salturb)
sal_data <- salturb[,c(1,2,3,6,7)] 
dim(sal_data)
temp_data <- salturb[,c(1,2,3,4,5)]
turb_data <- salturb[,c(1,2,3,8,9)]

#filtering salinity data to remove rejected values where F_Sal contains <-3>

arrayofmatches <- grep("<-3>", sal_data $F_Sal)
length(arrayofmatches)
sal_data_cleansed  <- as.data.frame(sal_data [-arrayofmatches,] )


#filtering temperature data to remove rejected values where F_Turb contains <-3>

arrayofmatches <- grep("<-3>", temp_data $F_Temp)
length(arrayofmatches)
temp_data_cleansed  <- as.data.frame(temp_data [-arrayofmatches,] )






#filtering turbidity data to remove rejected values where F_Turb contains <-3>

arrayofmatches <- grep("<-3>", turb_data $F_Turb)
length(arrayofmatches)
turb_data_cleansed  <- as.data.frame(turb_data [-arrayofmatches,] )



#handling salinity data


dim(sal_data_cleansed)[1]
splitloc <- strsplit(as.character(sal_data_cleansed $DateTimeStamp),' ') 
splitloc
for(i in 1:dim(sal_data_cleansed)[1])
{
  sal_data_cleansed $DATE[i] <- splitloc[[i]][1]
  sal_data_cleansed $TIME[i] <- splitloc[[i]][2]
  }

sal_data_aggregate <- aggregate(sal_data_cleansed $Sal , list(sal_data_cleansed $DATE) , mean)
names(sal_data_aggregate) <- c("date","salinity")
names(sal_data_aggregate)
write.csv(sal_data_aggregate, file = "sal_data_aggregate.csv")



dates <- read.csv('dates.csv', header = T, stringsAsFactors = F)
dim(dates)
names(dates)
sal_for_date <- merge(dates, sal_data_aggregate , all.x = TRUE)
sal_for_date $salinity <- as.factor(sal_for_date $salinity)
summary(sal_for_date $salinity)
write.csv(sal_for_date, file = "final_sal.csv")

#handling temp data 

dim(temp_data_cleansed)[1]
splitloc <- strsplit(as.character(temp_data_cleansed $DateTimeStamp),' ') 
splitloc
for(i in 1:dim(temp_data_cleansed)[1])
{
  temp_data_cleansed $DATE[i] <- splitloc[[i]][1]
  temp_data_cleansed $TIME[i] <- splitloc[[i]][2]
}

temp_data_aggregate <- aggregate(temp_data_cleansed $Temp , list(temp_data_cleansed $DATE) , mean)
names(temp_data_aggregate) <- c("date","temperature")
names(temp_data_aggregate)
write.csv(temp_data_aggregate, file = "temp_data_aggregate.csv")



temp_for_date <- merge(dates, temp_data_aggregate , all.x = TRUE)
temp_for_date $temperature <- as.factor(temp_for_date $temperature)
summary(temp_for_date $temperature)
write.csv(temp_for_date, file = "final_temp.csv")



#handling turbidity data 

dim(turb_data_cleansed)[1]
splitloc <- strsplit(as.character(turb_data_cleansed $DateTimeStamp),' ') 
splitloc
for(i in 1:dim(turb_data_cleansed)[1])
{
  turb_data_cleansed $DATE[i] <- splitloc[[i]][1]
  turb_data_cleansed $TIME[i] <- splitloc[[i]][2]
}

turb_data_aggregate <- aggregate(turb_data_cleansed $Turb , list(turb_data_cleansed $DATE) , mean)
names(turb_data_aggregate) <- c("date","turbidity")

names(turb_data_aggregate)
write.csv(turb_data_aggregate, file = "turb_data_aggregate.csv")



turb_for_date <- merge(dates, turb_data_aggregate , all.x = TRUE)
turb_for_date $turbidity <- as.factor(turb_for_date $turbidity)
summary(turb_for_date $turbidity)
write.csv(turb_for_date, file = "final_turb.csv")




dim(turb_for_date)
dim(temp_for_date)
dim(sal_for_date)
turb_for_date $turbidity <- as.character(turb_for_date $turbidity)
temp_for_date $temperature <- as.character(temp_for_date $temperature)

sal_for_date $salinity <- as.character(sal_for_date $salinity)

finalsalturbtemp <- as.data.frame(cbind(sal_for_date $date ,sal_for_date $salinity, temp_for_date $temperature ,turb_for_date $turbidity))
names(finalsalturbtemp) < c("date","salinity" ,"temperature","turbidity")
write.csv(finalsalturbtemp, file = "finalsalturbtemp.csv")






