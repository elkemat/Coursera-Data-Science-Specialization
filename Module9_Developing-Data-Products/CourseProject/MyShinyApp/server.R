library(shiny)

# Define server logic required to draw the plot
shinyServer(function(input, output) {
        # setting up data
        mtcars$gear <- as.factor(mtcars$gear)
        mtcars$am <- as.factor(mtcars$am)      
        
        # create logistic regression model
        model <- glm(am ~ gear + mpg, data = mtcars, family = "binomial")
        
        # get the input data and generate plot according to the input
        output$probabilityPlot <- renderPlot({
                mpg.input <- input$slider.mpg
                gear.input <- input$select.gear
                newdata <- data.frame(gear = as.factor(gear.input), 
                                      mpg = mpg.input)
                print(newdata)
                probManual <- predict(model, newdata = newdata, type = "response")
                probAutomatic <- 1 - probManual
                probs <- c(manual = probManual, automatic = probAutomatic)
                barplot(probs, xlab = "Transmission", ylab = "Probability", 
                        names.arg = c("manuel", "automatic"))
        })
})
