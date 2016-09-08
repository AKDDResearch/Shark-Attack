sharkattackoutput <- read.csv("attackdatesharkwithsc.csv", header = T, stringsAsFactors = F)
#discretization of dissolved oxygen
dis_disso2 <-discretize(sharkattackoutput$Dissoved_O2_Modified,"equalwidth", 3)
sharkattackoutput$DissolvedO2_discretize <- dis_disso2 $X
summary(sharkattackoutput$DissolvedO2_discretize )
sharkattackoutput$DissolvedO2_discretize[sharkattackoutput$DissolvedO2_discretize == 1] = 'Low'
sharkattackoutput$DissolvedO2_discretize[sharkattackoutput$DissolvedO2_discretize == 2] = 'Medium'
sharkattackoutput$DissolvedO2_discretize[sharkattackoutput$DissolvedO2_discretize == 3] = 'High'
sharkattackoutput$DissolvedO2_discretize <- as.factor(sharkattackoutput$DissolvedO2_discretize)
summary(sharkattackoutput$DissolvedO2_discretize )


#discretization of salinity
dis_salinity <-discretize(sharkattackoutput$Salinity_Modified,"equalwidth", 3)
sharkattackoutput$salinity_discretize <- dis_salinity $X
summary(sharkattackoutput$salinity_discretize )
sharkattackoutput$salinity_discretize[sharkattackoutput$salinity_discretize == 1] = 'Low'
sharkattackoutput$salinity_discretize[sharkattackoutput$salinity_discretize == 2] = 'Medium'
sharkattackoutput$salinity_discretize[sharkattackoutput$salinity_discretize == 3] = 'High'
sharkattackoutput$salinity_discretize <- as.factor(sharkattackoutput$salinity_discretize)
summary(sharkattackoutput$salinity_discretize )





#discretization of turbidity
dis_turbidity <-discretize(sharkattackoutput$Turbidity_Modified,"equalwidth", 3)
sharkattackoutput$turbidity_discretize <- dis_turbidity $X
summary(sharkattackoutput$turbidity_discretize )
sharkattackoutput$turbidity_discretize[sharkattackoutput$turbidity_discretize == 1] = 'Low'
sharkattackoutput$turbidity_discretize[sharkattackoutput$turbidity_discretize == 2] = 'Medium'
sharkattackoutput$turbidity_discretize[sharkattackoutput$turbidity_discretize == 3] = 'High'
sharkattackoutput$turbidity_discretize <- as.factor(sharkattackoutput$turbidity_discretize)
summary(sharkattackoutput$turbidity_discretize )


#discretization of water temp
dis_temperature <-discretize(sharkattackoutput$Temperature_Modified,"equalwidth", 3)
sharkattackoutput$temperature_discretize <- dis_temperature $X
summary(sharkattackoutput$temperature_discretize )
sharkattackoutput$temperature_discretize[sharkattackoutput$temperature_discretize == 1] = 'Low'
sharkattackoutput$temperature_discretize[sharkattackoutput$temperature_discretize == 2] = 'Medium'
sharkattackoutput$temperature_discretize[sharkattackoutput$temperature_discretize == 3] = 'High'
sharkattackoutput$temperature_discretize <- as.factor(sharkattackoutput$temperature_discretize)

summary(sharkattackoutput$temperature_discretize )



#discretization of precipitation
dis_precipitation <-discretize(sharkattackoutput$Precipitation_Value_Modified,"equalwidth", 3)
sharkattackoutput$precipitation_discretize <- dis_precipitation $X
summary(sharkattackoutput$precipitation_discretize )
sharkattackoutput$precipitation_discretize[sharkattackoutput$precipitation_discretize == 1] = 'Low'
sharkattackoutput$precipitation_discretize[sharkattackoutput$precipitation_discretize == 2] = 'Medium'
sharkattackoutput$precipitation_discretize[sharkattackoutput$precipitation_discretize == 3] = 'High'
sharkattackoutput$precipitation_discretize <- as.factor(sharkattackoutput$precipitation_discretize)
summary(sharkattackoutput$precipitation_discretize )



#discretization of pressure
dis_pressure <-discretize(sharkattackoutput$Station_Pressure_Modified,"equalwidth", 3)
sharkattackoutput$pressure_discretize <- dis_pressure $X
summary(sharkattackoutput$pressure_discretize )
sharkattackoutput$pressure_discretize[sharkattackoutput$pressure_discretize == 1] = 'Low'
sharkattackoutput$pressure_discretize[sharkattackoutput$pressure_discretize == 2] = 'Medium'
sharkattackoutput$pressure_discretize[sharkattackoutput$pressure_discretize == 3] = 'High'
sharkattackoutput$pressure_discretize <- as.factor(sharkattackoutput$pressure_discretize)
summary(sharkattackoutput$pressure_discretize )



#discretization of wind speed
dis_windspeed <-discretize(sharkattackoutput$Wind_Speed_Modified,"equalwidth", 3)
sharkattackoutput$windspeed_discretize <- dis_windspeed $X
summary(sharkattackoutput$windspeed_discretize )
sharkattackoutput$windspeed_discretize[sharkattackoutput$windspeed_discretize == 1] = 'Low'
sharkattackoutput$windspeed_discretize[sharkattackoutput$windspeed_discretize == 2] = 'Medium'
sharkattackoutput$windspeed_discretize[sharkattackoutput$windspeed_discretize == 3] = 'High'
sharkattackoutput$windspeed_discretize <- as.factor(sharkattackoutput$windspeed_discretize)

summary(sharkattackoutput$windspeed_discretize )


#discretization of prep moving average

library(TTR)
#cleansing weather prepcipitation and replacing NAs in moving average with  mean value 
sharkattackoutput$Precipitation_Value_Modified[sharkattackoutput$Precipitation_Value_Modified == "T"] <-  0

sharkattackoutput$Precipitation_Value_Modified  <- as.numeric(sharkattackoutput$Precipitation_Value_Modified )
sharkattackoutput $prep_moving_average <- SMA(sharkattackoutput$Precipitation_Value_Modified , n = 5)
meanmvaprep <- mean(sharkattackoutput $prep_moving_average ,na.rm = TRUE)
meanmvaprep
sharkattackoutput$prep_moving_average[is.na(sharkattackoutput$prep_moving_average)] <-  meanmvaprep


dis_mva_precipitation <-discretize(sharkattackoutput$prep_moving_average,"equalwidth", 3)
sharkattackoutput$precipitationmva_discretize <- dis_mva_precipitation $X
summary(sharkattackoutput$precipitationmva_discretize )
sharkattackoutput$precipitationmva_discretize[sharkattackoutput$precipitationmva_discretize == 1] = 'Low'
sharkattackoutput$precipitationmva_discretize[sharkattackoutput$precipitationmva_discretize == 2] = 'Medium'
sharkattackoutput$precipitationmva_discretize[sharkattackoutput$precipitationmva_discretize == 3] = 'High'
sharkattackoutput$precipitationmva_discretize <- as.factor(sharkattackoutput$precipitationmva_discretize)

summary(sharkattackoutput$precipitationmva_discretize )


write.csv(sharkattackoutput, "sharkattackfinal.csv")



