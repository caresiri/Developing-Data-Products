library(shiny) 
library(caret)
shinyUI(fluidPage(
  titlePanel("Predict Horsepower from MPG"), 
  sidebarLayout(
    sidebarPanel(
      sliderInput("sliderMPG", "What is the MPG of the car?", 10, 35, value = 20), 
      submitButton("Submit"),
      h5("Select the MPG of the car and select what tab would you like to predict the values of "),
      h6("The blue dot shows a graphical prediction. There is also a numberical prediction below the graph")
      ),
    mainPanel(
      tabsetPanel(
      tabPanel("Horse Power",plotOutput("plot1"), h3("Predicted Horepower:"), textOutput("pred1")),
      tabPanel("Weight",plotOutput("plot2"), h3("Predicted Weight:"), textOutput("pred2")),
      tabPanel("1/4 mile time",plotOutput("plot3"),h3("Predicted 1/4 mile time:"), textOutput("pred3"))
      )
      )
  )
))
