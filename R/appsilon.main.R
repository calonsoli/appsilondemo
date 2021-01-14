appsilon.main <- function(id) { 
  moduleServer(id, function(input, output, session) { 
    ns <- NS(id)
    
    ### DrowpDown Vessel typology
    observeEvent(input$types, { 
      
      data <- vessels %>% filter( SHIPTYPE == input$types) %>%
          select(SHIP_ID,SHIPNAME) %>%
          distinct(SHIP_ID,SHIPNAME)
      
      vesselsBytype <- as.character(data$SHIP_ID)
      names(vesselsBytype) <- data$SHIPNAME
      
      updatePickerInput(session = session, inputId = "vessels",
                        choices = vesselsBytype)
    }) 
    
    ### DrowpDown Vessel
    ready2RenderObservations <- reactive({
      req(input$vessels)
      data <- vessels %>% filter( SHIP_ID == input$vessels) %>%
        arrange(DATETIME) %>%
        mutate ( LAT2 = lead (LAT)) %>%
        mutate ( LON2 = lead (LON)) %>%
        mutate(distance = mapply( function(lg, lt,lg2,lt2) 
          distm(c(lg, lt), c(lg2, lt2), fun=distHaversine), 
          LON,LAT,lead(LON),lead(LAT) ) )
      
      obs <- data %>% slice(which.max(distance)) %>%
        slice(which.max(DATETIME))
      
    })
    
    ### Print two points observation
    output$observation <- renderLeaflet({
      leaflet(ready2RenderObservations()) %>% addTiles() %>%
        addMarkers(~LON, ~LAT, popup = ~as.character(paste('Origin Distance:',distance))) %>%
        addMarkers(~LON2, ~LAT2, popup = ~as.character(paste('End Point Distance:',distance))) 
        
      
    })
    
  
  })
}

