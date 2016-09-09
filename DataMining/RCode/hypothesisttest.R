#Hypothesis testing for comparing the means of windspeed anf turbidity between sample file(dates with attack = NO ) and large file(all the dates after balancing )

samplefile <- read.csv("samplefileattackno.csv", header = T, stringsAsFactors = F)
n1<- dim(samplefile)[1]


largefile <- read.csv("mainfile.csv", header = T, stringsAsFactors = F)
n2 <- dim(largefile)[1]
#for Windspeed 

xbar1_windspeed <- mean(samplefile $WindSpeed_minmax)
s1_windspeed <- sd(samplefile $WindSpeed_minmax)

xbar2_windspeed <- mean(largefile $WindSpeed_minmax)
s2_windspeed <- sd(largefile $WindSpeed_minmax)

dfs<- min(n1-1,n2-1)
tdata_windspeed <- (xbar1_windspeed - xbar2_windspeed)/ sqrt((s1_windspeed^2/n1)+(s2_windspeed^2/n2))
pvalue_windspeed  <- 2*pt(tdata_windspeed,df=dfs , lower.tail = FALSE)
tdata_windspeed
pvalue_windspeed


#for turbidity

xbar1_turbidity <- mean(samplefile $Turbidity_minmax)
s1_turbidity <- sd(samplefile $Turbidity_minmax)

xbar2_turbidity <- mean(largefile $Turbidity_minmax)
s2_turbidity <- sd(largefile $Turbidity_minmax)

dfs<- min(n1-1,n2-1)
tdata_turbidity <- (xbar1_turbidity - xbar2_turbidity)/ sqrt((s1_turbidity^2/n1)+(s2_turbidity^2/n2))
pvalue_turbidity  <- 2*pt(tdata_turbidity,df=dfs , lower.tail = FALSE)
tdata_turbidity
pvalue_turbidity


#for turtles

xbar1_turtles <- mean(samplefile $Turtle_minmax)
s1_turtles <- sd(samplefile $Turtle_minmax)

xbar2_turtles <- mean(largefile $Turtle_minmax)
s2_turtles <- sd(largefile $Turtle_minmax)

dfs<- min(n1-1,n2-1)
tdata_turtles <- (xbar1_turtles - xbar2_turtles)/ sqrt((s1_turtles^2/n1)+(s2_turtles^2/n2))
pvalue_turtles  <- 2*pt(tdata_turtles,df=dfs , lower.tail = FALSE)
tdata_turtles
pvalue_turtles

#for crab
xbar1_crab <- mean(samplefile $Crablandings_minmax)
s1_crab <- sd(samplefile $Crablandings_minmax)

xbar2_crab <- mean(largefile $Crablandings_minmax)
s2_crab <- sd(largefile $Crablandings_minmax)

dfs<- min(n1-1,n2-1)
tdata_crab <- (xbar1_crab - xbar2_crab)/ sqrt((s1_crab^2/n1)+(s2_crab^2/n2))
pvalue_crab  <- 2*pt(tdata_crab,df=dfs , lower.tail = FALSE)
tdata_crab
pvalue_crab



balancedfile <- read.csv("filebalancedWEKAfinal.csv", header = T, stringsAsFactors = F)
#kmeansclusteting for binning
kmeansclustering <- kmeans(balancedfile $TurbidityMod , centers = 3)
kmeansclustering $centers
whichbin <- kmeansclustering $cluster
whichbin
balancedfile $turbidity_kmeans_binning <- whichbin
balancedfile $turbidity_kmeans_binning[balancedfile $turbidity_kmeans_binning == 1] <- "Low"
balancedfile $turbidity_kmeans_binning[balancedfile $turbidity_kmeans_binning == 2] <- "High"
balancedfile $turbidity_kmeans_binning[balancedfile $turbidity_kmeans_binning == 3] <- "Medium"

write.csv(balancedfile ,"filebalancedWEKAfinal.csv" )


