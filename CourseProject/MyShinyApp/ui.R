# This application shows the probability for an iris species, proposed
# bei a logistics regression model

library(shiny)

# Define UI for application that draws a histogram
shinyUI(pageWithSidebar(
        
        headerPanel("Probability for Automatic vs. Manual Car"),
        
        sidebarPanel(
                strong("Documentation:"),
                p("With this Shiny application you can analyse the probability 
                  of a car having manual or automatic transmission based on the 
                  miles per gallon and number of forward gears it has. Select 
                  both parameters in the following slider and respectively 
                  dropdown menu and click on submit. Then you will see the 
                  result in a barplot."),
                sliderInput(inputId = "slider.mpg", 
                            label = "Select Miles per Gallon:",
                            min = 10, 
                            max = 34,
                            value = 20,
                            step = 0.5),
                selectInput(inputId = "select.gear",
                            label = "Select Number of forward Gears:",
                            choices = c(3,4,5),
                            selected = 4),
                submitButton("Submit!")
        ),
        
        # Show a barchart of the probabilities
        mainPanel(
                plotOutput("probabilityPlot")
        )
))
