#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Maximální tepová frekvence"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         sliderInput(inputId = "vek",
                     label = "Věk:",
                     min = 1,
                     max = 100,
                     value = 30,
                     animate = animationOptions(interval = 300, loop = TRUE)
                     )
      ),
      
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput(outputId = "vekPlot")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$vekPlot <- renderPlot({
      # generate bins based on input$bins from ui.R
      vek_df <- data.frame(factor("TF"),input$vek)

      ggplot(vek_df) + geom_col(aes(x = "tf",y = vek_df[,2])) + coord_cartesian(ylim = c(0, 200)) + labs(x="Tepová frekvence", y="Věk")
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

