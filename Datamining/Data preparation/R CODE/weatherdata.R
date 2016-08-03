weatherdata <- read.csv('weatherdata.csv', header = T, stringsAsFactors = F)

weatherdata $DAILYAverageSeaLevelPressure <- as.factor(weatherdata $DAILYAverageSeaLevelPressure)
summary(weatherdata $DAILYAverageSeaLevelPressure)
weatherdata_beaufort $REPORTTPYE <- as.factor(weatherdata_beaufort $REPORTTPYE)
summary(weatherdata_beaufort $REPORTTPYE)

weatherdata $STATION_NAME <- as.factor(weatherdata $STATION_NAME)
summary(weatherdata $STATION_NAME)
weatherdata_beaufort <-  subset(weatherdata, weatherdata $STATION_NAME == "BEAUFORT MCAS SC US" )
names(weatherdata_beaufort)


arrayofmatches <- grep("2009", weatherdata_beaufort $DATE)
arrayofmatches
beaufort_2009  <- as.data.frame(weatherdata_beaufort [arrayofmatches,] )
d_beaufort_2009 <-  subset(beaufort_2009, beaufort_2009 $REPORTTPYE == "SOD" )

arrayofmatches <- grep("2010", weatherdata_beaufort $DATE)
arrayofmatches
beaufort_2010  <- as.data.frame(weatherdata_beaufort [arrayofmatches,] )
d_beaufort_2010 <-  subset(beaufort_2010, beaufort_2010 $REPORTTPYE == "SOD" )


arrayofmatches <- grep("2011", weatherdata_beaufort $DATE)
arrayofmatches
beaufort_2011  <- as.data.frame(weatherdata_beaufort [arrayofmatches,] )
d_beaufort_2011 <-  subset(beaufort_2011, beaufort_2011 $REPORTTPYE == "SOD" )


arrayofmatches <- grep("2012", weatherdata_beaufort $DATE)
arrayofmatches
beaufort_2012  <- as.data.frame(weatherdata_beaufort [arrayofmatches,] )
d_beaufort_2012 <-  subset(beaufort_2012, beaufort_2012 $REPORTTPYE == "SOD" )



arrayofmatches <- grep("2013", weatherdata_beaufort $DATE)
arrayofmatches
beaufort_2013  <- as.data.frame(weatherdata_beaufort [arrayofmatches,] )
d_beaufort_2013 <-  subset(beaufort_2013, beaufort_2013 $REPORTTPYE == "SOD" )


arrayofmatches <- grep("2014", weatherdata_beaufort $DATE)
arrayofmatches
beaufort_2014  <- as.data.frame(weatherdata_beaufort [arrayofmatches,] )
d_beaufort_2014 <-  subset(beaufort_2014, beaufort_2014 $REPORTTPYE == "SOD" )



arrayofmatches <- grep("2015", weatherdata_beaufort $DATE)
arrayofmatches
beaufort_2015  <- as.data.frame(weatherdata_beaufort [arrayofmatches,] )
d_beaufort_2015 <-  subset(beaufort_2015, beaufort_2015 $REPORTTPYE == "SOD" )


arrayofmatches <- grep("2016", weatherdata_beaufort $DATE)
arrayofmatches
beaufort_2016  <- as.data.frame(weatherdata_beaufort [arrayofmatches,] )
d_beaufort_2016 <-  subset(beaufort_2016, beaufort_2016 $REPORTTPYE == "SOD" )

weatherdata_beaufort_sod <- rbind(d_beaufort_2009,d_beaufort_2010,d_beaufort_2011,d_beaufort_2012,d_beaufort_2013,
                                  d_beaufort_2014,d_beaufort_2015,d_beaufort_2016)
names(weatherdata_beaufort_sod)
weatherdata_beaufort_sod <- weatherdata_beaufort_sod[, c("STATION","STATION_NAME","ELEVATION","LATITUDE","LONGITUDE","DATE",
                                                         "DAILYAverageDryBulbTemp","DAILYPrecip","DAILYAverageStationPressure",
                                                         "DAILYAverageWindSpeed","DAILYAverageDewPointTemp")]

splitloc <- strsplit(as.character(weatherdata_beaufort_sod $DATE),' ') 
splitloc
for(i in 1:2740)
{
  #print(i)
#  print(length(splitloc[[i]]))
 # print(splitloc[[i]][length(splitloc[[i]])])
  weatherdata_beaufort_sod $DATE[i] <- splitloc[[i]][1]
}
weatherdata_beaufort_sod <- weatherdata_beaufort_sod[,-c(1,2,3,4,5)]

write.csv(weatherdata_beaufort_sod, file = "beaufortweather.csv")


#merge with attack = no attribute of nc file 


#for nc weather  using CAPE HATTERAS BILLY MITCHELL FIELD NC US
summary(weatherdata $STATION_NAME)
weatherdata_cape_hatteras <-  subset(weatherdata, weatherdata $STATION_NAME == "CAPE HATTERAS BILLY MITCHELL FIELD NC US" )
names(weatherdata_cape_hatteras)


arrayofmatches <- grep("2009", weatherdata_cape_hatteras $DATE)
arrayofmatches
capehatteras_2009  <- as.data.frame(weatherdata_cape_hatteras [arrayofmatches,] )
d_cape_2009 <-  subset(capehatteras_2009 , capehatteras_2009 $REPORTTPYE == "SOD" )



arrayofmatches <- grep("2010", weatherdata_cape_hatteras $DATE)
arrayofmatches
capehatteras_2010  <- as.data.frame(weatherdata_cape_hatteras [arrayofmatches,] )
d_cape_2010 <-  subset(capehatteras_2010 , capehatteras_2010 $REPORTTPYE == "SOD" )





arrayofmatches <- grep("2011", weatherdata_cape_hatteras $DATE)
arrayofmatches
capehatteras_2011  <- as.data.frame(weatherdata_cape_hatteras [arrayofmatches,] )
d_cape_2011 <-  subset(capehatteras_2011 , capehatteras_2011 $REPORTTPYE == "SOD" )



arrayofmatches <- grep("2012", weatherdata_cape_hatteras $DATE)
arrayofmatches
capehatteras_2012  <- as.data.frame(weatherdata_cape_hatteras [arrayofmatches,] )
d_cape_2012 <-  subset(capehatteras_2012 , capehatteras_2012 $REPORTTPYE == "SOD" )

arrayofmatches <- grep("2013", weatherdata_cape_hatteras $DATE)
arrayofmatches
capehatteras_2013  <- as.data.frame(weatherdata_cape_hatteras [arrayofmatches,] )
d_cape_2013 <-  subset(capehatteras_2013 , capehatteras_2013 $REPORTTPYE == "SOD" )


arrayofmatches <- grep("2014", weatherdata_cape_hatteras $DATE)
arrayofmatches
capehatteras_2014  <- as.data.frame(weatherdata_cape_hatteras [arrayofmatches,] )
d_cape_2014 <-  subset(capehatteras_2014 , capehatteras_2014 $REPORTTPYE == "SOD" )

arrayofmatches <- grep("2015", weatherdata_cape_hatteras $DATE)
arrayofmatches
capehatteras_2015  <- as.data.frame(weatherdata_cape_hatteras [arrayofmatches,] )
d_cape_2015 <-  subset(capehatteras_2015 , capehatteras_2015 $REPORTTPYE == "SOD" )


arrayofmatches <- grep("2016", weatherdata_cape_hatteras $DATE)
arrayofmatches
capehatteras_2016  <- as.data.frame(weatherdata_cape_hatteras [arrayofmatches,] )
d_cape_2016 <-  subset(capehatteras_2016 , capehatteras_2016 $REPORTTPYE == "SOD" )



weatherdata_capehatteras_sod <- rbind(d_cape_2009,d_cape_2010,d_cape_2011,d_cape_2012,d_cape_2013,
                                      d_cape_2014,d_cape_2015,d_cape_2016)
names(weatherdata_capehatteras_sod)
weatherdata_capehatteras_sod <- weatherdata_capehatteras_sod[, c("STATION","STATION_NAME","ELEVATION","LATITUDE","LONGITUDE","DATE",
                                                         "DAILYAverageDryBulbTemp","DAILYPrecip","DAILYAverageStationPressure",
                                                         "DAILYAverageWindSpeed","DAILYAverageDewPointTemp")]




splitloc <- strsplit(as.character(weatherdata_capehatteras_sod $DATE),' ') 
splitloc
for(i in 1:2747)
{
  #print(i)
  #  print(length(splitloc[[i]]))
  # print(splitloc[[i]][length(splitloc[[i]])])
  weatherdata_capehatteras_sod $DATE[i] <- splitloc[[i]][1]
}
weatherdata_capehatteras_sod <- weatherdata_capehatteras_sod[,-c(1,2,3,4,5)]
write.csv(weatherdata_capehatteras_sod, file = "capehatterasweather.csv")

#merge  with location = North carolina

#for sc 
summary(weatherdata $STATION_NAME)
weatherdata_myrtle <-  subset(weatherdata, weatherdata $STATION_NAME == "NORTH MYRTLE BEACH GRAND STRAND AIRPORT SC US" )
names(weatherdata_myrtle)


arrayofmatches <- grep("2009", weatherdata_myrtle $DATE)
arrayofmatches
myrtle_2009  <- as.data.frame(weatherdata_myrtle [arrayofmatches,] )
d_myrtle_2009 <-  subset(myrtle_2009 , myrtle_2009 $REPORTTPYE == "SOD" )



arrayofmatches <- grep("2010", weatherdata_myrtle $DATE)
arrayofmatches
myrtle_2010  <- as.data.frame(weatherdata_myrtle [arrayofmatches,] )
d_myrtle_2010 <-  subset(myrtle_2010 , myrtle_2010 $REPORTTPYE == "SOD" )





arrayofmatches <- grep("2011", weatherdata_myrtle $DATE)
arrayofmatches
myrtle_2011  <- as.data.frame(weatherdata_myrtle [arrayofmatches,] )
d_myrtle_2011 <-  subset(myrtle_2011 , myrtle_2011 $REPORTTPYE == "SOD" )



arrayofmatches <- grep("2012", weatherdata_myrtle $DATE)
arrayofmatches
myrtle_2012  <- as.data.frame(weatherdata_myrtle [arrayofmatches,] )
d_myrtle_2012 <-  subset(myrtle_2012 , myrtle_2012 $REPORTTPYE == "SOD" )

arrayofmatches <- grep("2013", weatherdata_myrtle $DATE)
arrayofmatches
myrtle_2013  <- as.data.frame(weatherdata_myrtle [arrayofmatches,] )
d_myrtle_2013 <-  subset(myrtle_2013 , myrtle_2013 $REPORTTPYE == "SOD" )


arrayofmatches <- grep("2014", weatherdata_myrtle $DATE)
arrayofmatches
myrtle_2014  <- as.data.frame(weatherdata_myrtle [arrayofmatches,] )
d_myrtle_2014 <-  subset(myrtle_2014 , myrtle_2014 $REPORTTPYE == "SOD" )

arrayofmatches <- grep("2015", weatherdata_cape_myrtle $DATE)
arrayofmatches
myrtle_2015  <- as.data.frame(weatherdata_myrtle [arrayofmatches,] )
d_myrtle_2015 <-  subset(myrtle_2015 , myrtle_2015 $REPORTTPYE == "SOD" )


arrayofmatches <- grep("2016", weatherdata_myrtle $DATE)
arrayofmatches
myrtle_2016  <- as.data.frame(weatherdata_myrtle [arrayofmatches,] )
d_myrtle_2016 <-  subset(myrtle_2016 , myrtle_2016 $REPORTTPYE == "SOD" )



weatherdata_myrtle_sod <- rbind(d_myrtle_2009,d_myrtle_2010,d_myrtle_2011,d_myrtle_2012,d_myrtle_2013,
                                      d_myrtle_2014,d_myrtle_2015,d_myrtle_2016)
names(weatherdata_myrtle_sod)
weatherdata_myrtle_sod <- weatherdata_myrtle_sod[, c("STATION","STATION_NAME","ELEVATION","LATITUDE","LONGITUDE","DATE",
                                                                 "DAILYAverageDryBulbTemp","DAILYPrecip","DAILYAverageStationPressure",
                                                                 "DAILYAverageWindSpeed","DAILYAverageDewPointTemp")]




splitloc <- strsplit(as.character(weatherdata_capehatteras_sod $DATE),' ') 
splitloc
for(i in 1:2747)
{
  #print(i)
  #  print(length(splitloc[[i]]))
  # print(splitloc[[i]][length(splitloc[[i]])])
  weatherdata_myrtle_sod $DATE[i] <- splitloc[[i]][1]
}
weatherdata_myrtle_sod <- weatherdata_myrtle_sod[,-c(1,2,3,4,5)]
write.csv(weatherdata_myrtle_sod, file ="myrtleweather.csv")
#merge  with location = south carolina








