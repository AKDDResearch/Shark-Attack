#Code to add Normalised Variables to the balanced file using Z-score and Min-max normalization.

balfile <- read.csv("large_file_final.csv", header = T, stringsAsFactors = F)



balfile $Precipitation_Normalised <- (balfile $Precipitation_Value_Mod - mean(balfile $Precipitation_Value_Mod))/sd(balfile $Precipitation_Value_Mod)
balfile $StationPressure_Normalised <- (balfile $Station_Pressure_Mod - mean(balfile $Station_Pressure_Mod))/sd(balfile $Station_Pressure_Mod)
balfile $WindSpeed_Normalised <- (balfile $Wind_Speed_Mod - mean(balfile $Wind_Speed_Mod))/sd(balfile $Wind_Speed_Mod)
balfile $Salinity_Normalised <- (balfile $Salinity_Mod - mean(balfile $Salinity_Mod))/sd(balfile $Salinity_Mod)
balfile $Turbidity_Normalised<- (balfile $Turbidity_Mod - mean(balfile $Turbidity_Mod))/sd(balfile $Turbidity_Mod)
balfile $Dissolved02_Normalised <- (balfile $Dissoved_O2_Mod - mean(balfile $Dissoved_O2_Mod))/sd(balfile $Dissoved_O2_Mod)

balfile $Precipitation_minmax <- (balfile  - min(balfile $Precipitation_Value_Mod))/(max(balfile $Precipitation_Value_Mod) - min(balfile $Precipitation_Value_Mod))
balfile $StationPressure_minmax <- (balfile $Station_Pressure_Mod - min(balfile $Station_Pressure_Mod))/(max(balfile $Station_Pressure_Mod) - min(balfile $Station_Pressure_Mod))
balfile $WindSpeed_minmax <- (balfile $Wind_Speed_Mod - min(balfile $Wind_Speed_Mod))/(max(balfile $Wind_Speed_Mod) - min(balfile $Wind_Speed_Mod))
balfile $Salinity_minmax <- (balfile $Salinity_Mod - min(balfile $Salinity_Mod))/(max(balfile $Salinity_Mod) - min(balfile $Salinity_Mod))
balfile $Turbidity_minmax <- (balfile $Turbidity_Mod - min(balfile $Turbidity_Mod))/(max(balfile $Turbidity_Mod) - min(balfile $Turbidity_Mod))
balfile $Dissolved02_minmax <- (balfile $Dissoved_O2_Mod - min(balfile $Dissoved_O2_Mod))/(max(balfile $Dissoved_O2_Mod) - min(balfile $Dissoved_O2_Mod))
balfile $WaterTemp_minmax <- (balfile $Temperature_Mod - min(balfile $Temperature_Mod))/(max(balfile $Temperature_Mod) - min(balfile $Temperature_Mod))


write.csv(balfile ,"final_largefile.csv" )



balancedfile <- read.csv("final_largefile.csv", header = T, stringsAsFactors = F)
balancedfile $Turtle_minmax <- (balancedfile $TurtleExactCombined  - min(balancedfile $TurtleExactCombined))/(max(balancedfile $TurtleExactCombined) - min(balancedfile $TurtleExactCombined))
balancedfile $Crablandings_minmax <- (balancedfile $CrabLandings - min(balancedfile $CrabLandings))/(max(balancedfile $CrabLandings) - min(balancedfile $CrabLandings))
write.csv(balancedfile ,"mainfile.csv" )
