library(shiny)
library(dplyr)

function(input, output, session) {

  output$PopSize <- renderPrint({ input$PopSize })
  
  output$PopProp <- renderPrint({ input$PopProp })
  
  output$MOE <- renderPrint({ input$MOE })
  
  output$ConfidenceLevel <- renderPrint({ input$ConfidenceLevel })
  
  output$result <- renderText({
    #FORMULA
    ceiling(((qnorm(1-(1-input$ConfidenceLevel)/2)^2 * input$PopProp * (1-input$PopProp) ) + input$MOE^2 ) / ( input$MOE^2 + (qnorm(1-(1-input$ConfidenceLevel)/2))^2 * input$PopProp * (1-input$PopProp) / input$PopSize ))
    
  })

  observeEvent(input$PopSize,{ #limits PopSize input to numbers only
    cat(suppressWarnings(is.na(as.numeric(input$PopSize))),'\n')

    if(is.na(as.numeric(input$PopSize)))
    {
      showModal(modalDialog(
        title = "Error!",
        "Shoud be a digit",
        easyClose = TRUE
      ))
    } #end of if statement
  } #end of observe event inner bracket
  ) #end of observe event
  
  observeEvent(input$MOE,{ #limits MOE input to percentage
      cat(suppressWarnings(is.na(as.numeric(input$MOE))),'\n')
      if(!between(input$MOE,0,0.999))

      {
        showModal(modalDialog(
          title = "Error!",
          "Must be a percentage!",
          easyClose = TRUE
        ))
      }
  } #end of observe event inner bracket
  ) #end of observe event
  
  observeEvent(input$PopProp,{ #limits PopProp input to percentage
    cat(suppressWarnings(is.na(as.numeric(input$PopProp))),'\n')
    if(!between(input$PopProp,0,0.999))
      
    {
      showModal(modalDialog(
        title = "Error!",
        "Must be a percentage!",
        easyClose = TRUE
      ))
    }
  } #end of observe event inner bracket
  ) #end of observe event
  
  
  observeEvent(input$ConfidenceLevel,{ #limits ConfidenceLevel input to percentage
    cat(suppressWarnings(is.na(as.numeric(input$ConfidenceLevel))),'\n')
    if(!between(input$ConfidenceLevel,0,0.999))
      
    {
      showModal(modalDialog(
        title = "Error!",
        "Must be a percentage!",
        easyClose = TRUE
      ))
    }
  } #end of observe event inner bracket
  ) #end of observe event
  
} #end of script




  

  