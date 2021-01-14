appsilon.ui.main <- function(id) { 
    ns <- NS(id)
    
    out <- vessels %>% select(ship_type,SHIPTYPE) %>%
      distinct(SHIPTYPE,ship_type)
    
    vesselTypes <- as.character(out$SHIPTYPE)
    names(vesselTypes) <- out$ship_type
    
    tagList(
      fluidRow(
        box(
          width = 12,
          title = tags$span(icon("route"),"Observations"),
          solidHeader = FALSE, status = "primary",
          collapsible = FALSE,
          div(style="display:inline-block",
              pickerInput(
                inputId = ns("types"),
                label = "Type of ships", 
                choices = vesselTypes,
                options = list(
                  style = "btn-primary")
              )),
          div(style="display:inline-block; margin-left: 20px;",
              pickerInput(
                inputId = ns("vessels"),
                label = "Vessels", 
                choices = NULL,
                options = list(
                  style = "btn-primary")
              )),
          leafletOutput(ns("observation"))
      ))
    )
}

