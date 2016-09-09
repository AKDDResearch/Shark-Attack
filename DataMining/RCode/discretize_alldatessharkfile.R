#Discretization of  additional variables shark attack file with attack = YES

sharkattackoutput <- read.csv("attackdateshark.csv", header = T, stringsAsFactors = F)
#discretization of dissolved oxygen
dis_disso2 <-discretize(sharkattackoutput$mod_dissolvedo2,"equalwidth", 3)
sharkattackoutput$DissolvedO2_discretize <- dis_disso2 $X
summary(sharkattackoutput$DissolvedO2_discretize )
sharkattackoutput$DissolvedO2_discretize[sharkattackoutput$DissolvedO2_discretize == 1] = 'Low'
sharkattackoutput$DissolvedO2_discretize[sharkattackoutput$DissolvedO2_discretize == 2] = 'Medium'
sharkattackoutput$DissolvedO2_discretize[sharkattackoutput$DissolvedO2_discretize == 3] = 'High'
summary(sharkattackoutput$DissolvedO2_discretize )


#discretization of salinity
dis_salinity <-discretize(sharkattackoutput$mod_salinity,"equalwidth", 3)
sharkattackoutput$salinity_discretize <- dis_salinity $X
summary(sharkattackoutput$salinity_discretize )
sharkattackoutput$salinity_discretize[sharkattackoutput$salinity_discretize == 1] = 'Low'
sharkattackoutput$salinity_discretize[sharkattackoutput$salinity_discretize == 2] = 'Medium'
sharkattackoutput$salinity_discretize[sharkattackoutput$salinity_discretize == 3] = 'High'
summary(sharkattackoutput$salinity_discretize )



#discretization of turbidity
dis_turbidity <-discretize(sharkattackoutput$mod_turbidity,"equalwidth", 3)
sharkattackoutput$turbidity_discretize <- dis_turbidity $X
summary(sharkattackoutput$turbidity_discretize )
sharkattackoutput$turbidity_discretize[sharkattackoutput$turbidity_discretize == 1] = 'Low'
sharkattackoutput$turbidity_discretize[sharkattackoutput$turbidity_discretize == 2] = 'Medium'
sharkattackoutput$turbidity_discretize[sharkattackoutput$turbidity_discretize == 3] = 'High'
summary(sharkattackoutput$turbidity_discretize )


#discretization of water temp
dis_temperature <-discretize(sharkattackoutput$mod_temperature,"equalwidth", 3)
sharkattackoutput$temperature_discretize <- dis_temperature $X
summary(sharkattackoutput$temperature_discretize )
sharkattackoutput$temperature_discretize[sharkattackoutput$temperature_discretize == 1] = 'Low'
sharkattackoutput$temperature_discretize[sharkattackoutput$temperature_discretize == 2] = 'Medium'
sharkattackoutput$temperature_discretize[sharkattackoutput$temperature_discretize == 3] = 'High'
summary(sharkattackoutput$temperature_discretize )



#discretization of precipitation
dis_precipitation <-discretize(sharkattackoutput$mod_precipitation,"equalwidth", 3)
sharkattackoutput$precipitation_discretize <- dis_precipitation $X
summary(sharkattackoutput$precipitation_discretize )
sharkattackoutput$precipitation_discretize[sharkattackoutput$precipitation_discretize == 1] = 'Low'
sharkattackoutput$precipitation_discretize[sharkattackoutput$precipitation_discretize == 2] = 'Medium'
sharkattackoutput$precipitation_discretize[sharkattackoutput$precipitation_discretize == 3] = 'High'
summary(sharkattackoutput$precipitation_discretize )



#discretization of pressure
dis_pressure <-discretize(sharkattackoutput$mod_pressure,"equalwidth", 3)
sharkattackoutput$pressure_discretize <- dis_pressure $X
summary(sharkattackoutput$pressure_discretize )
sharkattackoutput$pressure_discretize[sharkattackoutput$pressure_discretize == 1] = 'Low'
sharkattackoutput$pressure_discretize[sharkattackoutput$pressure_discretize == 2] = 'Medium'
sharkattackoutput$pressure_discretize[sharkattackoutput$pressure_discretize == 3] = 'High'
summary(sharkattackoutput$pressure_discretize )



#discretization of wind speed
dis_windspeed <-discretize(sharkattackoutput$mod_windspeed,"equalwidth", 3)
sharkattackoutput$windspeed_discretize <- dis_windspeed $X
summary(sharkattackoutput$windspeed_discretize )
sharkattackoutput$windspeed_discretize[sharkattackoutput$windspeed_discretize == 1] = 'Low'
sharkattackoutput$windspeed_discretize[sharkattackoutput$windspeed_discretize == 2] = 'Medium'
sharkattackoutput$windspeed_discretize[sharkattackoutput$windspeed_discretize == 3] = 'High'
summary(sharkattackoutput$windspeed_discretize )


#discretization of prep moving average
sharkattackoutput $prep_moving_average <- SMA(sharkattackoutput$mod_precipitation , n = 5)
dis_mva_precipitation <-discretize(sharkattackoutput$prep_moving_average,"equalwidth", 3)
sharkattackoutput$precipitationmva_discretize <- dis_mva_precipitation $X
summary(sharkattackoutput$precipitationmva_discretize )
sharkattackoutput$precipitationmva_discretize[sharkattackoutput$precipitationmva_discretize == 1] = 'Low'
sharkattackoutput$precipitationmva_discretize[sharkattackoutput$precipitationmva_discretize == 2] = 'Medium'
sharkattackoutput$precipitationmva_discretize[sharkattackoutput$precipitationmva_discretize == 3] = 'High'
summary(sharkattackoutput$precipitationmva_discretize )




