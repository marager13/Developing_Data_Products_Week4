#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)


fluidPage(
  
  fluidRow(column(width=12, offset = 0.1,numericInput("PopSize", label = h3("Population Size (N=)"), value = 1000, min=30)),
           column(width = 12, offset = 0.5,"Formula is assuming a large population size i.e. N>=30")
  ),
  
  numericInput("PopProp", label = h3("Population Proportion (%)"), value = .5, min=0, max=0.99,step=0.01),

  numericInput("MOE", label = h3("Margin of Error (%)"), value = .05,min=0, max=0.99, step=0.01),
  
  numericInput("ConfidenceLevel", label = h3("Confidence Level (%)"), value = .95,min=0, max=0.999, step=0.01),
 

  mainPanel(h2("Sample Size"),
          verbatimTextOutput("result"))
  )  
 
