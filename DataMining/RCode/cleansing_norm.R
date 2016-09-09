#Merging Weather data with salinity and turbidity data 



weatherdata <- read.csv('weathersharkattackintegrated_Modified1.csv', header = T, stringsAsFactors = F)
names(weatherdata)
#cleansing the precipitation variable
#Replacing teh T value of precipitation with 0 
weatherdata $Modified.Precipitation.Value <- gsub("T","0", weatherdata $Modified.Precipitation.Value)
salturbtempdata <- read.csv('finalsalturbtemp_cleansed.csv', header = T, stringsAsFactors = F)
names(salturbtempdata)
weatherdata <- weatherdata[,-c(1)]
salturbtempdata <- salturbtempdata[,c(-1)]
weatherdatatotal <-  merge(weatherdata,salturbtempdata)
weatherdatatotal $Modified_Precipitation_Value <- as.factor(weatherdatatotal $Modified_Precipitation_Value)
summary(weatherdatatotal $Modified_Precipitation_Value)
library(TTR)
weatherdatatotal $Modified.Precipitation.Value <- as.numeric(weatherdatatotal $Modified.Precipitation.Value)
summary(weatherdatatotal $Modified.Precipitation.Value)
weatherdatatotal $prep_moving_average <- SMA(weatherdatatotal $Modified.Precipitation.Value , n = 5)
summary(weatherdatatotal $prep_moving_average)
min(weatherdatatotal $prep_moving_average)


#Normalization of weather data 
names(weatherdatatotal)
summary(weatherdatatotal $Modified.Precipitation.Value)
#precipitation z score
weatherdatatotal $zscore.precipitation <- (weatherdatatotal $Modified.Precipitation.Value - mean(weatherdatatotal $Modified.Precipitation.Value))/sd(weatherdatatotal $Modified.Precipitation.Value)
#Dry bulb temperature
weatherdatatotal $Modified.Dry.Bulb.Tempearture <- as.numeric(weatherdatatotal $Modified.Dry.Bulb.Tempearture)
summary(weatherdatatotal $Modified.Dry.Bulb.Tempearture)
weatherdatatotal $zscore.drybulbtemp <- (weatherdatatotal $Modified.Dry.Bulb.Tempearture - mean(weatherdatatotal $Modified.Dry.Bulb.Tempearture))/sd(weatherdatatotal $Modified.Dry.Bulb.Tempearture)
#station pressutre
weatherdatatotal $zscore.pressure <- (weatherdatatotal $Modified.Station.Pressure - mean(weatherdatatotal $Modified.Station.Pressure))/sd(weatherdatatotal $Modified.Station.Pressure)
#Wind Speed
weatherdatatotal $zscore.windspeed <- (weatherdatatotal $Modified.Wind.Speed - mean(weatherdatatotal $Modified.Wind.Speed))/sd(weatherdatatotal $Modified.Wind.Speed)
#salinity
summary(weatherdatatotal $Salinity)
weatherdatatotal $zscore.salinity <- (weatherdatatotal $Salinity - mean(weatherdatatotal $Salinity))/sd(weatherdatatotal $Salinity)
#turbidity
summary(weatherdatatotal $Turbidity)
weatherdatatotal $zscore.turbidity <- (weatherdatatotal $Turbidity - mean(weatherdatatotal $Turbidity))/sd(weatherdatatotal $Turbidity)
summary(weatherdatatotal $zscore.turbidity)
#water temperature
summary(weatherdatatotal $Temperature)
weatherdatatotal $zscore.seatemp <- (weatherdatatotal $Temperature - mean(weatherdatatotal $Temperature))/sd(weatherdatatotal $Temperature)

write.csv(weatherdatatotal ,"sharkfiletotal.csv")




#combine dissolved oxygen
domod_data <- read.csv('finaldissolvedoxygen_Modified.csv', header = T, stringsAsFactors = F)
names(domod_data)
names(weatherdatatotal)
domod_data <- domod_data[,c(-1)]
weatherdatatotal <-  merge(domod_data,weatherdatatotal)
#normalizing dissolved oxygen
summary(weatherdatatotal $Modified.Dissoved.O2.Value)
weatherdatatotal $zscore.disso2 <- (weatherdatatotal $Modified.Dissoved.O2.Value - mean(weatherdatatotal $Modified.Dissoved.O2.Value))/sd(weatherdatatotal $Modified.Dissoved.O2.Value)

write.csv(weatherdatatotal ,"sharkfiletotal.csv")


