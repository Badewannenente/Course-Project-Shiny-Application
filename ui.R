
library(shiny)
library(shinythemes)

shinyUI(fluidPage(theme = shinytheme("superhero"),
    titlePanel("Required Memory Calculator for R Beginners"),
    sidebarLayout(
        sidebarPanel(
            h3("Checklist for the bytes coefficient"),
                checkboxInput("idk", "Don't know any classes in the dataset", FALSE),
                checkboxInput("num", "The dataset contains numeric classes", FALSE),
                checkboxInput("int", "The dataset contains integer classes", FALSE),
                checkboxInput("log", "The dataset contains logical classes", FALSE),
                checkboxInput("cha", "The dataset contains character classes", FALSE),
                checkboxInput("fac", "The dataset contains factor classes", FALSE),    
            h3("Dimensions of the data set"),
                numericInput('nrows', 'Enter Number of Observations (rows)', 0, min = 0),
                numericInput('ncol', 'Enter Number of variables (columns)', 0, min = 0),
            sliderInput("bytes", "bytes coefficient", value = 8, min = 4, max = 16, 
                                                      step = 1)
        ), 
        mainPanel(
            h3("General info"),
                textOutput("info"),
            h3("Info to adust bytes coefficient"), 
                textOutput("comment1"),
                textOutput("comment2"),
                textOutput("comment3"),
                textOutput("comment4"),
                textOutput("comment5"),
                textOutput("comment6"),
            h3('Estimated memory required in byte'), 
                verbatimTextOutput("estByte"),
            h3('Estimated memory required in kilobyte'),
                verbatimTextOutput("estKilo"),
            h3('Estimated memory required in megabyte'), 
                verbatimTextOutput("estMega"),
            h5("Note: When loaded into R, the function object_size() from the *pryr* 
            package tells you exactly how many bytes of memory an object occupies. 
            This function is better than the built-in function object.size(), because
            it accounts for shared elements within an object and includes the size 
            of environments."),
            h5("Sources:"), 
            h5("- http://danielmarcelino.github.io/blog/2016/calculating-memory-requirements.html"),
            h5("- http://adv-r.had.co.nz/memory.html"),
            h5("- https://bookdown.org/Tazinho/Advanced-R-Solutions/memory.html")
        )
    ) 
))
