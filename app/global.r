library("RColorBrewer")
library("shiny")
library("leaflet")

data1 <- read.csv("./MapHot.csv",header=TRUE)
data2 <- read.csv("./MapStrongHot.csv",header=TRUE)
data3 <- read.csv("./MapCold.csv",header=TRUE)
data4 <- read.csv("./MapStrongCold.csv",header=TRUE)

#RENAME column Color
colnames(data1)[colnames(data1) == 'Plot.Color'] <- 'Color'
colnames(data2)[colnames(data2) == 'Plot.Color'] <- 'Color'
colnames(data3)[colnames(data3) == 'Plot.Color'] <- 'Color'
colnames(data4)[colnames(data4) == 'Plot.Color'] <- 'Color'

#REMOVE NA LOCATIONS
data1<-data1[!is.na(data1$Latitude),]
data2<-data2[!is.na(data2$Latitude),]
data3<-data3[!is.na(data3$Latitude),]
data4<-data4[!is.na(data4$Latitude),]