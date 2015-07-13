library(shiny)
library(leaflet)
file1 <- read.csv("data/Chelsea_Indicators_Fake.csv", header= TRUE, sep = ",", 
                     quote = "\"", dec = ".", fill = TRUE, comment.char = "")
bare <- read.csv("data/blank.csv", header= TRUE, sep = ",", 
                  quote = "\"", dec = ".", fill = TRUE, comment.char = "")
initialMatrixValue <- file1
bMemory <- 0

shinyServer(function(input, output, session) {
  ##demo data logic chain##
  values <- reactiveValues(matrix = initialMatrixValue)
  observe({
    if (input$calcRisk == 0)
      return()
    array <- file1$riskarea + file1$callsforservice + file1$crime + file1$notifications
    values$matrix$risk_score <- array
  })
  output$table1 <- renderDataTable({
    values$matrix
  })
  
  ##user uploaded data logic chain##
  
  output$table2 <- renderDataTable({
    inFile <- input$file2
    if (is.null(inFile))
      return(bare)
    read.csv(inFile$datapath, header=input$header, sep=input$sep, 
             quote=input$quote)
   })
  #  m <- leaflet() %>% addTiles() %>% 
  
})

