turtledatanc <- read.csv('turtledatanc.csv', header = T, stringsAsFactors = F)
dim(turtledatanc)[1]
turtledatanc $Activity <- as.factor(turtledatanc $Activity)
summary(turtledatanc $Activity)
turtledatanc $Activity[2]


for (i in 1 :dim(turtledatanc)[1] )
{
  if (turtledatanc $Activity[i] == "N")
  {
    turtledatanc $NestFlag[i] <- 1
    turtledatanc $FalseCrawlFlag[i] <- 0
  }
  if (turtledatanc $Activity[i] == "FC")
  {
    turtledatanc $NestFlag[i] <- 0
    turtledatanc $FalseCrawlFlag[i] <- 1
  }
  if (turtledatanc $Activity[i] == "PN" | turtledatanc $Activity[i] == "UN" )
  {
    turtledatanc $NestFlag[i] <- 0
    turtledatanc $FalseCrawlFlag[i] <- 0
    
  }
  
}
turtledatanc $Beach <- as.factor(turtledatanc $Beach)
turtledatanc $Activity.Date <- as.factor(turtledatanc $Activity.Date)
turtledatanc $NestFlag <- as.numeric(turtledatanc $NestFlag)
turtledatanc $FalseCrawlFlag <- as.numeric(turtledatanc $FalseCrawlFlag)
taggregate <-  aggregate(as.matrix(turtledatanc[,c(8,9)]),as.list(turtledatanc[,c(1,4)]), FUN =  sum)
taggregate $total <- taggregate $NestFlag + taggregate $FalseCrawlFlag
taggregate $Activity.Date <- as.character(taggregate $Activity.Date)
arrayofmatches <- grep("2008", taggregate $Activity.Date)
arrayofmatches
length(arrayofmatches)
taggregate2009_2016 <- taggregate[-arrayofmatches, ]
names(taggregate2009_2016) <- c("Location","Date","Nesting","FalseCrawls","Total")
taggregate2009_2016 $state <- "NC"
write.csv(taggregate2009_2016, file = "turtledatancaggregated.csv")




