
library(shiny)

shinyServer(function(input, output) {
        
    output$info <- renderText({
        "Beyond 128 bytes, R will ask for memory from the operating system in multiples of 8 bytes. The calculator adjusts for that every length 0 vector occupies 40 bytes of memory."
    })
    
    output$comment1 = renderText({
        if (input$idk == TRUE) 
                "- The standard bytes coefficient (8) should give a decent estimate." 
        else ""
    })
    output$comment2 = renderText({
        if (input$num == TRUE) "- Numeric vectors occupy 8 bytes per allocated entry." 
        else ""
    })
    output$comment3 = renderText({
        if (input$int == TRUE) "- Integer vectors occupy only 4 bytes per allocated entry." 
        else ""
    })
    output$comment4 = renderText({
        if (input$log == TRUE) "- Logical vectors occupy 4 bytes per allocated entry."
        else ""
    })
    output$comment5 = renderText({
        if (input$cha == TRUE) "- If the entry has less than 8 signs a character allocates 8 bytes per entry. Otherwise roughly one byte per sign. But R has a global string pool. This means that each unique string is only stored in one place, and therefore character vectors take up less memory than you might expect:" 
        else ""
    })
    output$comment6 = renderText({
        if (input$fac == TRUE) "- A factor allocates only 4 bytes per entry with a character vector attribute that contains the levels (unique elements) of the vector: Therefor the factor will allocate more memory, if all entries are unique:" 
        else ""
    })
    output$estByte = renderPrint({
        input$ncol*(40 + input$nrows*input$bytes)
    })
    output$estKilo = renderPrint({
        input$ncol*(40 + input$nrows*input$bytes)/2^10
    })
    output$estMega = renderPrint({
        input$ncol*(40 + input$nrows*input$bytes)/2^20
    })
    }
) 

