#Code to get aggregated nesting and false crawls for turtle activity on daily basis  for South Carolina State.
turtledatasc <- read.csv('sc_turtle_data.csv', header = T, stringsAsFactors = F)
dim(turtledatasc)[1]
turtledatasc $Activity <- as.factor(turtledatasc $Activity)
turtledatasc <- turtledatasc[1:46918,]
summary(turtledatasc $Activity)
turtledatasc $Activity[2]


for (i in 1 :dim(turtledatasc)[1] )
{
  if (turtledatasc $Activity[i] == "N")
  {
    turtledatasc $NestFlag[i] <- 1
    turtledatasc $FalseCrawlFlag[i] <- 0
  }
  if (turtledatasc $Activity[i] == "FC")
  {
    turtledatasc $NestFlag[i] <- 0
    turtledatasc $FalseCrawlFlag[i] <- 1
  }
  
}
turtledatasc $Beach <- as.factor(turtledatasc $Beach)
turtledatasc $Activity.Date <- as.factor(turtledatasc $Activity.Date)
turtledatasc $NestFlag <- as.numeric(turtledatasc $NestFlag)
turtledatasc $FalseCrawlFlag <- as.numeric(turtledatasc $FalseCrawlFlag)
#aggregate location as well as datewise
names(turtledatasc)
taggregate <-  aggregate(as.matrix(turtledatasc[,c(8,9)]),as.list(turtledatasc[,c(1,4)]), FUN =  sum)
taggregate $total <- taggregate $NestFlag + taggregate $FalseCrawlFlag
taggregate $Activity.Date <- as.character(taggregate $Activity.Date)
names(taggregate2009_2016) <- c("Location","Date","Nesting","FalseCrawls","Total")
taggregate $state <- "SC"
write.csv(taggregate, file = "turtledatascaggregated.csv")



#aggregate datewise
names(turtledatasc)
length(turtledatasc $NestFlag)
length(turtledatasc $FalseCrawlFlag)
turtledatasc <- turtledatasc[,-c(1,2,3,5,6,7)]  
names(turtledatasc) <- c("Date","NestFlag","FalseCrawlFlag")
turtledatasc $Date <-as.factor(turtledatasc $Date)
taggregatedate <-  aggregate(as.matrix(turtledatasc[,c(2,3)]),list(turtledatasc[,c(1)]), FUN =  sum)

taggregatedate $total <- taggregatedate $NestFlag + taggregatedate $FalseCrawlFlag
names(taggregatedate) <- c("Date","NestFlag","FalseCrawlFlag","total")
names(taggregatedate)
taggregatedate $Date <- as.character(taggregatedate $Date)
taggregatedate $state <- "SC"
write.csv(taggregatedate, file = "turtledatascdatewise.csv")








