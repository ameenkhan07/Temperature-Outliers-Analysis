shinyServer(function(input, output){
  
  output$map1 <- renderLeaflet({
    
    darkest <-rgb(.8039,0.4,0)
    dark    <- rgb(1,0.549,0)
    norm    <- rgb(1,0.5,0)
    light   <- rgb(1,0.5,0.278)
    none    <- rgb(0.05098,0.05098,0.05098)
    
    pal <- colorFactor( c(darkest, dark , light , norm , none),  
                        domain = c("Darkest Yellow", "Dark Yellow" , "Light Yellow" , "Yellow" , "No Colour")
    )
    
    m <-data1 %>%
      leaflet() %>%
      setView(lng = -98.5795, lat = 39.8282, zoom = 4) %>%
      addTiles("http://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}.png") %>% 
      addCircleMarkers(
        lng = ~Longitude, 
        lat = ~Latitude, 
        popup=data1$Station, 
        weight = 1, 
        radius = 3,
        color = ~pal(Color),
        stroke = FALSE, 
        fillOpacity = 0.7)%>% 
        addLegend(colors = c(darkest,dark,norm,light), labels=c("Top 5%","5-10%","10-25%","25-50%"))
    m
    
  })
  
  output$map2 <- renderLeaflet({
    
    darkest <-rgb(0.545,0,0)
    dark    <- rgb(0.753,0,0)
    norm    <- rgb(1,0,0)
    light   <- rgb(1,0.388,0.278)
    none    <- rgb(0.05098,0.05098,0.05098)
    
    pal <- colorFactor( c(darkest, dark , light , norm , none), 
                        domain = c("Darkest Red" , "Dark Red","Light Red","Red", "No Color")
    )
    
    m <- data2 %>%
      leaflet() %>%
      setView(lng = -98.5795, lat = 39.8282, zoom = 4) %>%
      addTiles("http://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}.png") %>% 
      addCircleMarkers(
        lng = ~Longitude, 
        lat = ~Latitude, 
        popup=data2$Station, 
        weight = 1, 
        radius=3,
        color = ~pal(Color),
        stroke = FALSE, 
        fillOpacity = 0.7)%>% 
        addLegend(colors = c(darkest,dark,norm,light), labels=c("Top 5%","5-10%","10-25%","25-50%"))
    m
    
  })
  
  output$map3 <- renderLeaflet({
    darkest<-rgb(0,0.545,0)
    dark <- rgb(0,0.753,0)
    none <-rgb(0.05098,0.05098,0.05098)
    
    pal <- colorFactor( c(darkest, dark , none), 
                        domain = c("Darkest Green", "Dark Green", "No Colour")
    )
    
    m <- data3 %>%
      leaflet() %>%
      setView(lng = -98.5795, lat = 39.8282, zoom = 4) %>%
      addTiles("http://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}.png") %>% 
      addCircleMarkers(
        lng = ~Longitude, 
        lat = ~Latitude, 
        popup=data3$Station,
        weight = 1, 
        radius =3,
        color = ~pal(Color),
        stroke = FALSE, 
        fillOpacity = 0.7) %>% 
        addLegend(colors = c(darkest,dark), labels=c("Top 5%","5-10%"))
    m
    
  })
  output$map4 <- renderLeaflet({
    darkest<-rgb(0,0,0.545)
    dark <- rgb(0,0,0.753)
    none <-rgb(0.05098,0.05098,0.05098)
    
    pal <- colorFactor( c(darkest, dark , none), 
                    domain = c("Darkest Blue","Dark Blue","No Colour")
    )
    
    m <- data4 %>%
      leaflet() %>%
      setView(lng = -98.5795, lat = 39.8282, zoom = 4) %>%
      addTiles("http://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}.png") %>% 
      addCircleMarkers(
        lng = ~Longitude, 
        lat = ~Latitude, 
        popup=data4$Station, 
        weight = 1, 
        radius=3,
        color = ~pal(Color),
        stroke = FALSE, 
        fillOpacity = 0.7) %>% 
        addLegend(colors = c(darkest,dark), labels=c("Top 5%","5-10%"))
    m
    
  })
  
})