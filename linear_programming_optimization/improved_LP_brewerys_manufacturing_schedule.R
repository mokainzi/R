# install.packages("lpSolve")
library(lpSolve)

# objective function
f.obj <- c(13, 23, 30)

# constrains
f.con <- matrix(c(5,  15, 10,
                  4,   4,  4,
                  35, 20, 15,
                  5,  10, 20), nrow = 4, byrow = TRUE)

# constrains direction
f.dir <- c("<=",
           "<=",
           "<=",
           "<=")

# constrains right hand side
f.rhs <- c(480,
           160,
           1190,
           650)               # 130 hrs is a month of full-time hours * 5 employees

sol<-lp("max", f.obj, f.con, f.dir, f.rhs, compute.sens = TRUE)
sol$objval
sol$solution
sol$duals
