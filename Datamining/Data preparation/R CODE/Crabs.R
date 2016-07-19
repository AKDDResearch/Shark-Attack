library(readxl)
data <- read_excel("Crabs.xlsx",na = "NA")
# View(data[,-6])
data.frame=as.data.frame(data[,-6])

# View(data.frame)

#Minimum Value : 3968.34
#Maximum Value : 342193.6

#No of bins : 3

# Max - Min : 338225.26

# width : 338225.26/3 = 112741.7533333333

# Intervals : [Min,Min+width),[Min+width,Min+2width),[Min+2width,Max)

# [3968.34,116710.093),[116710.093,229451.846),[229451.846,342193.6)

library(infotheo)

# nbins<- sqrt(NROW(data.frame$Pounds))
data.frame$PoundsCategory <- discretize(data.frame$Pounds,"equalwidth", 3)

data.frame$normalized_Zscore <- scale(data.frame$Pounds,center = TRUE,scale =TRUE )

data.frame$PoundsCategory[data.frame$PoundsCategory == 1] = 'Low'
data.frame$PoundsCategory[data.frame$PoundsCategory == 2] = 'Medium'
data.frame$PoundsCategory[data.frame$PoundsCategory == 3] = 'High'

library(xlsx)
write.xlsx(x=data.frame[,-6],file ="Crabs_New.xlsx",showNA =TRUE )