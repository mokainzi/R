# install.packages("lpSolve")
library(lpSolve)

f.obj <- c(13,23,30)

f.con <- matrix(c(5,  15, 10,
                  4,   4,  4,
                  35, 20, 15,
                  5,  10, 20), nrow = 4, byrow = TRUE)

f.dir <- c("<=",
           "<=",
           "<=",
           "<=")

f.rhs <- c(480,
           160,
           1190,
           800)

sol<-lp("max", f.obj, f.con, f.dir, f.rhs, compute.sens = TRUE)
sol$objval
sol$solution
sol$duals
