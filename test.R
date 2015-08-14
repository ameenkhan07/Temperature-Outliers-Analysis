library("ggmap")
data1 <- read.csv("./MapHot.csv",header=TRUE)
data2 <- read.csv("./MapStrongHot.csv",header=TRUE)
data3 <- read.csv("./MapCold.csv",header=TRUE)
data4 <- read.csv("./MapStrongCold.csv",header=TRUE)

colnames(data1)[colnames(data1) == 'Plot.Color'] <- 'Color'
colnames(data2)[colnames(data2) == 'Plot.Color'] <- 'Color'
colnames(data3)[colnames(data3) == 'Plot.Color'] <- 'Color'
colnames(data4)[colnames(data4) == 'Plot.Color'] <- 'Color'

myLocation <- "United States"

myMap1 <- get_map(location=myLocation,  source="osm", maptype="53428", crop=FALSE, zoom=4,color="bw")
myMap2 <- get_map(location=myLocation,  source="google", maptype="roadmap", crop=FALSE, zoom=4,color="bw")
myMap3 <- get_map(location=myLocation,  source="google", maptype="roadmap", crop=FALSE, zoom=4,color="bw")
myMap4 <- get_map(location=myLocation,  source="google", maptype="roadmap", crop=FALSE, zoom=4,color="bw")


# ggmap(myMap)

ggmap(myMap1) + 
  geom_point(aes(x = Longitude, y = Latitude,  colour = factor(Color) ) , data = data1 , alpha = .5 ) + 
  scale_colour_manual(values=c("Darkest Yellow" = "#CCCC00" , "Dark Yellow"="#FFFF00","Light Yellow"="#FFFF33","Yellow"="#FFFF99","No Colour"="#00000" ))

ggmap(myMap2) + 
  geom_point(aes(x = Longitude, y = Latitude,  colour = factor(Color) ) , data = data2 , alpha = 1 ) + 
  scale_colour_manual(values=c("Darkest Red" = "#660000" , "Dark Red"="#990000","Light Red"="#FF6633","Red"="#CC0000","No Colour"="#00000" ))

ggmap(myMap3) + 
  geom_point(aes(x = Longitude, y = Latitude,  colour = factor(Color) ) , data = data3 , alpha = .5 ) + 
  scale_colour_manual(values=c("Darkest Green" = "#003300" , "Dark Green"="#006600","Light Green"="#33CC33","Green"="#33FF00","No Colour"="#00000" ))

ggmap(myMap3) + 
  geom_point(aes(x = Longitude, y = Latitude,  colour = factor(Color) ) , data = data4 , alpha = .5 ) + 
  scale_colour_manual(values=c("Darkest Blue" = "#000033" , "Dark Blue"="#000066","Light Blue"="#0000FF","Blue"="#000099","No Colour"="#00000" ))
