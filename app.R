appsilon.libraries()
appsilon.loadData()

# UI Look'n'feel.
ui <- function (){
    dashboardPage( 
        dashboardHeader(title = 'Appsilon demo'),
        dashboardSidebar(disable = TRUE),
        dashboardBody(
            shinyDashboardThemes(
                theme = "grey_dark"
            ),
            appsilon.ui.dashboard(),
            appsilon.ui.main('demo')
       )
    )   
}
    
# Server logic 
server <- function(input, output) {
    appsilon.main('demo')
}

# Run the application 
shinyApp(ui = ui, server = server)
