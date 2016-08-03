balfile <- read.csv("finalfilebalancedWEKA.csv", header = T, stringsAsFactors = F)



balfile $Precipitation_Normalised <- (balfile $PrecipitationValueMod - mean(balfile $PrecipitationValueMod))/sd(balfile $PrecipitationValueMod)
balfile $StationPressure_Normalised <- (balfile $StationPressureMod - mean(balfile $StationPressureMod))/sd(balfile $StationPressureMod)
balfile $WindSpeed_Normalised <- (balfile $WindSpeedMod - mean(balfile $WindSpeedMod))/sd(balfile $WindSpeedMod)
balfile $Salinity_Normalised <- (balfile $SalinityMod - mean(balfile $SalinityMod))/sd(balfile $SalinityMod)
balfile $Turbidity_Normalised<- (balfile $TurbidityMod - mean(balfile $TurbidityMod))/sd(balfile $TurbidityMod)
balfile $Dissolved02_Normalised <- (balfile $DissovedO2Mod - mean(balfile $DissovedO2Mod))/sd(balfile $DissovedO2Mod)

balfile $Precipitation_minmax <- (balfile $PrecipitationValueMod - min(balfile $PrecipitationValueMod))/(max(balfile $PrecipitationValueMod) - min(balfile $PrecipitationValueMod))
balfile $StationPressure_minmax <- (balfile $StationPressureMod - min(balfile $StationPressureMod))/(max(balfile $StationPressureMod) - min(balfile $StationPressureMod))
balfile $WindSpeed_minmax <- (balfile $WindSpeedMod - min(balfile $WindSpeedMod))/(max(balfile $WindSpeedMod) - min(balfile $WindSpeedMod))
balfile $Salinity_minmax <- (balfile $SalinityMod - min(balfile $SalinityMod))/(max(balfile $SalinityMod) - min(balfile $SalinityMod))
balfile $Turbidity_minmax <- (balfile $TurbidityMod - min(balfile $TurbidityMod))/(max(balfile $TurbidityMod) - min(balfile $TurbidityMod))
balfile $Dissolved02_minmax <- (balfile $DissovedO2Mod - min(balfile $DissovedO2Mod))/(max(balfile $DissovedO2Mod) - min(balfile $DissovedO2Mod))
balfile $WaterTemp_minmax <- (balfile $TemperatureMod - min(balfile $TemperatureMod))/(max(balfile $TemperatureMod) - min(balfile $TemperatureMod))


write.csv(balfile ,"filebalancedWEKA.csv" )



balancedfile <- read.csv("filebalancedWEKA.csv", header = T, stringsAsFactors = F)
balancedfile $Turtle_minmax <- (balancedfile $TurtleExactCombined  - min(balancedfile $TurtleExactCombined))/(max(balancedfile $TurtleExactCombined) - min(balancedfile $TurtleExactCombined))
balancedfile $Crablandings_minmax <- (balancedfile $CrabLandings - min(balancedfile $CrabLandings))/(max(balancedfile $CrabLandings) - min(balancedfile $CrabLandings))
write.csv(balancedfile ,"filebalancedWEKAfinal.csv" )
