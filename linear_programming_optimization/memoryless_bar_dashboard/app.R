library(shiny)
library(expm)
library(diagram)

T <- matrix(c(
  
  0, 0, 0.6, 0.4,
  0, 0, 0.6, 0.4,     # transition matrix
  0, 0, 0.6, 0.4,
  0, 0, 0.6, 0.4
  
), nrow = 4, byrow = TRUE)

colnames(T) = c(0,1,2,3)
rownames(T) = c(0,1,2,3)

ui <- fluidPage(
  h1("Memoryless Bar Dashboard"),
  h3("Transition Matrix Diagram"),
  plotOutput("plotmat")
)

server <- function(input, output) {
  output$plotmat <- renderPlot({
    plotmat(T,pos = c(1,2,1),
            curve = 0,
            lwd = 1, box.lwd = 2,
            cex.txt = 0.8,
            box.size = 0.1,
            box.type = "ellipse",
            box.prop = 0.4,
            box.col = "light blue",
            arr.length=.1,
            arr.width=.1,
            self.cex = .4,
            self.shifty = -.07,
            self.shiftx = c(-0.1, 0.1, -0.1, 0.1)
            )
  })
}

shinyApp(ui = ui, server = server)