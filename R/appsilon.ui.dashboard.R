appsilon.ui.dashboard <- function(){

  # Get vessels and calculate dashboard data.
  vesseldates <- vessels %>%
                mutate (dateVessels = ymd(date)) %>%
                summarise(min = min(dateVessels),max = max(dateVessels))
  ships <- n_distinct(vessels$SHIP_ID)
  
  dest <- vessels %>% count(DESTINATION) %>%
                slice(which.max(n))
                                   
  tagList(
    fluidRow(
      infoBox("Status date", 
              paste0(day(vesseldates$min),'/',month(vesseldates$min),
                     ' - ',
                     day(vesseldates$max),'/',month(vesseldates$max)
                     ),
                        icon = icon("history"), color = "yellow"),
      infoBox("Ships", ships, icon = icon("ship"), color = "purple"),
      infoBox("Main Destination", dest$DESTINATION, icon = icon("map-marked-alt"), color = "olive")
    )
  )
}