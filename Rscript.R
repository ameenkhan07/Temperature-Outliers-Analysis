
data<-read.csv("esya.csv",header=TRUE,na.strings="NA",stringsAsFactors=FALSE)

station<-unique(data$station_name)

station_str_hot<-integer()
station_hot<-integer()
station_str_cold<-integer()
station_cold<-integer()

long<-integer()
lati<-integer()

for(st_name in station)
{
  date_data<-data[data$station_name == st_name,]
  
  
  str_hot<-integer()
  hot<-integer()
  str_cold<-integer()
  cold<-integer()
  
  year<-integer()
  
  for(i in 1964:2013)
  {
  
    yr<-toString(i)
    
    yr_data_ind<-grep(yr,date_data[,1],value=FALSE)
    
    if(length(yr_data_ind) == 0)
      next
    
    year<-c(year,i)
    
    str_hot_cnt <- (sum(date_data[yr_data_ind,9] == "Strong Hot"))/length(yr_data_ind)
    hot_cnt <- (sum(date_data[yr_data_ind,9] == "Weak Hot"))/length(yr_data_ind)
    str_cold_cnt <- (sum(date_data[yr_data_ind,9] == "Strong Cold"))/length(yr_data_ind)
    cold_cnt <- (sum(date_data[yr_data_ind,9] == "Weak Cold"))/length(yr_data_ind)
    
    
    
    str_hot<-c(str_hot,str_hot_cnt)
    hot<-c(hot,hot_cnt)
    str_cold<-c(str_cold,str_cold_cnt)
    cold<-c(cold,cold_cnt)
    
    
  }  
  
  lm_str_hot=coef(lm(str_hot~year))["year"]
  lm_hot=coef(lm(hot~year))["year"]
  lm_str_cold=coef(lm(str_cold~year))["year"]
  lm_cold=coef(lm(cold~year))["year"]
  
  station_str_hot<-c(station_str_hot,lm_str_hot)
  station_hot<-c(station_hot,lm_hot)
  station_str_cold<-c(station_str_cold,lm_str_cold)
  station_cold<-c(station_cold,lm_cold)
  long<-c(long,date_data[yr_data_ind[1],4])
  lati<-c(lati,date_data[yr_data_ind[1],5])
  
  
  print(paste(st_name,date_data[yr_data_ind[1],4],date_data[yr_data_ind[1],5]))


}

station_details<-data.frame(station,long,lati)

str_hot_color<-c(rep("Darkest Red",136),rep("Dark Red",136),rep("Red",407),rep("Light Red",679),rep("No Color",1358))
hot_color<-c(rep("Darkest Yellow",136),rep("Dark Yellow",136),rep("Yellow",407),rep("Light Yellow",679),rep("No Color",1358))
str_cold_color<-c(rep("Darkest Blue",136),rep("Dark Blue",136),rep("Blue",407),rep("Light Blue",679),rep("No Color",1358))
cold_color<-c(rep("Darkest Green",136),rep("Dark Green",136),rep("Green",407),rep("Light Green",679),rep("No Color",1358))

GraphStrongHot<-cbind(station_details,station_str_hot)
GraphStrongHot<-GraphStrongHot[order(-GraphStrongHot$station_str_hot),]
GraphStrongHot<-cbind(GraphStrongHot,str_hot_color)
GraphStrongHot<-GraphStrongHot[order(GraphStrongHot$station),]

GraphHot<-cbind(station_details,station_hot)
GraphHot<-GraphHot[order(-GraphHot$station_hot),]
GraphHot<-cbind(GraphHot,hot_color)
GraphHot<-GraphHot[order(GraphHot$station),]

GraphStrongCold<-cbind(station_details,station_str_cold)
GraphStrongCold<-GraphStrongCold[order(-GraphStrongCold$station_str_cold),]
GraphStrongCold<-cbind(GraphStrongCold,str_cold_color)
GraphStrongCold<-GraphStrongCold[order(GraphStrongCold$station),]

GraphCold<-cbind(station_details,station_cold)
GraphCold<-GraphCold[order(-GraphCold$station_cold),]
GraphCold<-cbind(GraphCold,cold_color)
GraphCold<-GraphCold[order(GraphCold$station),]


write.csv(GraphStrongHot,file="StrongHot.csv")
write.csv(GraphHot,file="Hot.csv")
write.csv(GraphStrongCold,file="StrongCold.csv")
write.csv(GraphCold,file="Cold.csv")





    
  