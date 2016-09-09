#Code to derive a New variable Change_temp which describes the increase(+) /decrease(-) in temperature from previous values.
#EQ signifies no change in temperature .

largefile <- read.csv("largefile1.csv", header = T, stringsAsFactors = F)
largefile $zscore.water.temp <- (largefile $Temperature_Mod- mean(largefile $Temperature_Mod))/sd(largefile $Temperature_Mod)
largefile $change_temp <- "EQ"

for(i in 2:dim(largefile)[1])
{
  if((largefile $zscore.water.temp[i] - largefile $zscore.water.temp[i-1]) >= 1  )
  {
    largefile $change_temp[i] <- "+"
  }
  if((largefile $zscore.water.temp[i] - largefile $zscore.water.temp[i-1]) <= -1  )
  {
    largefile $change_temp[i] <- "-"
  }
  
}
write.csv(largefile,"largefile_modified.csv")
