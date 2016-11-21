#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#

library(shiny)

# The three models are defined below.

  shinyServer(function(input, output) {    
    model1 <- lm( hp ~ mpg, data=mtcars)
    model2 <- lm(wt ~ mpg, data = mtcars)
    model3 <- lm(qsec ~ mpg, data = mtcars)
 
    
    #### Model 1        
    model1pred <- reactive({
      mpgInput <- input$sliderMPG
      predict(model1, newdata = data.frame(mpg = mpgInput))
    })
    
      output$plot1 <- renderPlot({ 
        mpgInput <- input$sliderMPG
        plot(mtcars$mpg, mtcars$hp, xlab = "Miles Per Gallon",
             ylab = "Horsepower", bty = "n", pch = 16,
             xlim = c(10, 35), ylim = c(50, 350))
          abline(model1, col = "red", lwd = 2)
          points(mpgInput, model1pred(), col = "blue", pch = 16, cex = 2)
      }) 
      output$pred1 <- renderText({
        model1pred()
      })

      
#### Model 2     
      model2pred <- reactive({
        mpgInput <- input$sliderMPG
        predict(model2, newdata = data.frame(mpg = mpgInput))
      })
        output$plot2 <- renderPlot({ 
          mpgInput <- input$sliderMPG
          plot(mtcars$mpg, mtcars$wt, xlab = "Miles Per Gallon",
               ylab = "Weight (1000 Lbs)", bty = "n", pch = 16,
               xlim = c(10, 35), ylim = c(1, 6))
            abline(model2, col = "red", lwd = 2)
            points(mpgInput, model2pred(), col = "blue", pch = 16, cex = 2)
  })
        output$pred2 <- renderText({
          model2pred()
        })
        
        #### Model 3     
        model3pred <- reactive({
          mpgInput <- input$sliderMPG
          predict(model3, newdata = data.frame(mpg = mpgInput))
        })
        output$plot3 <- renderPlot({ 
          mpgInput <- input$sliderMPG
          plot(mtcars$mpg, mtcars$qsec, xlab = "Miles Per Gallon",
               ylab = "1/4 mile time", bty = "n", pch = 16,
               xlim = c(10, 35), ylim = c(15, 23))
          abline(model3, col = "red", lwd = 2)
          points(mpgInput, model3pred(), col = "blue", pch = 16, cex = 2)
        })
        
        output$pred3 <- renderText({
          model3pred()
        })
  })       