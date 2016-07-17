
#to find teh months of attack
SHARKATTACK<- read.csv('sharkattack.csv', header = T, stringsAsFactors = F)
install.packages("lubridate")
SHARKATTACK $Date <- gsub('', '', MDEHBFile $TEHBDedInnTier1Individual)
library(lubridate)
SHARKATTACK $Month <- month(SHARKATTACK $Date)
SHARKATTACK $Area <- as.factor(SHARKATTACK $Area)
summary(SHARKATTACK $Area)
SHARKATTACKnc <- subset(SHARKATTACK, SHARKATTACK $Area == "North Carolina" )

SHARKATTACKnc $Date <- as.factor(SHARKATTACKnc $Date)
summary(SHARKATTACKnc $Date)



#to merge moonphase file and shark attack file of nc


sharkattackdates<- read.csv('shark_attack_dates.csv', header = T, stringsAsFactors = F)
names(sharkattackdates)
names(sharkattackdates) <- c("Date","attack","moonphase")
sharkattacknc <- read.csv('NC-2000_2016_time.csv', header = T, stringsAsFactors = F)
sharkattacknc $Date <- as.factor(sharkattacknc $Date)
sharkattackdates $Date <- as.factor(sharkattackdates $Date)

sharkfile <- merge(sharkattackdates,sharkattacknc ,all.x = TRUE )

write.csv(sharkfile,"sharkfile.csv")



