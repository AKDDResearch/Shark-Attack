do_data <- read.csv('sal_turb_data.csv', header = T, stringsAsFactors = F)
dim(do_data)[1]
splitloc <- strsplit(as.character(sal_turb_data $DateTimeStamp),' ') 
splitloc
for(i in 1:dim(sal_turb_data)[1])
{
  do_data $DATE[i] <- splitloc[[i]][1]
  do_data $TIME[i] <- splitloc[[i]][2]
}



do_data$datetime <- as.POSIXct(paste(sal_turb_data$DATE, sal_turb_data$TIME), format="%m/%d/%Y %H:%M")

do_10_til_9  <- subset(do_data, format(datetime,'%H') %in% c('10','11','12','13','14','15','16','17','18','19','20'))
do_at_9 <-  subset(do_data, format(datetime,'%H:%M') %in% c('21:00'))
do_10_to_9 <- rbind(do_10_til_9,do_at_9)
names(do_10_to_9)
disoxygen <- do_10_to_9[,c(3,4,5,15,16)]
disoxygen $DO_mgl <- as.factor(disoxygen $DO_mgl )
summary(disoxygen $DO_mgl )
#filtering do for rejected data
arrayofmatches <- grep("<-3>", disoxygen $F_DO_mgl)
length(arrayofmatches)
disoxygen_cleansed  <- as.data.frame(disoxygen [-arrayofmatches,] )
#handling dissolved oxygen data
dim(disoxygen_cleansed)[1]
head(disoxygen_cleansed)
splitloc <- strsplit(as.character(disoxygen_cleansed $DateTimeStamp),' ') 
splitloc
for(i in 1:dim(disoxygen_cleansed)[1])
{
  disoxygen_cleansed $DATE[i] <- splitloc[[i]][1]
  disoxygen_cleansed $TIME[i] <- splitloc[[i]][2]
}
summary(disoxygen_cleansed $DO_mgl)
disoxygen_cleansed $DO_mgl <- as.numeric(disoxygen_cleansed $DO_mgl)
do_data_aggregate <- aggregate(disoxygen_cleansed $DO_mgl , list(disoxygen_cleansed $DATE) , mean)
names(do_data_aggregate) <- c("date","dissolvedoxygen")
names(do_data_aggregate)
write.csv(do_data_aggregate, file = "do_data_aggregate.csv")



dates <- read.csv('dates.csv', header = T, stringsAsFactors = F)
dim(dates)
names(dates)
do_for_date <- merge(dates, do_data_aggregate , all.x = TRUE)
do_for_date $dissolvedoxygen <- as.factor(do_for_date $dissolvedoxygen)
summary(do_for_date $dissolvedoxygen)
write.csv(do_for_date, file = "final_dissolvedoxygen.csv")








