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


# transition matrix diagram
plotmat(T,pos = c(3,1),
        lwd = 1, box.lwd = 1,
        cex.txt = 0.8,
        box.size = 0.1,
        box.type = "ellipse",
        box.prop = 0.4,
        box.col = "light blue",
        arr.length=.1,
        arr.width=.1,
        self.cex = .4,
        self.shifty = -.07,
        self.shiftx = .10,
        main = "")


# transition matrix
T

T%^%2

T%^%5

# steady state matrix appear between 20-100 period steps
T%^%20              
