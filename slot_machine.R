get_symbols <- function (){
  weel <- c("DD", "7", "BBB", "BB", "B", "C", "0")
  sample(weel, size = 3, replace = TRUE,
   prob = c(0.03, 0.03, 0.06, 0.1, 0.25, 0.01, 0.52))
}
#get_symbols

score <- function (symbols) {
  # identify case
  same <- symbols[1] == symbols[2] && symbols[2] == symbols[3]
  bars <- symbols %in% c("B", "BB", "BBB")
  
  # get prize
  if (same) {
    payouts <- c("DD" = 100, "7" = 80, "BBB" = 40, "BB" = 25, 
                 "B" = 10, "C" = 10, "0" = 0)
    prize <- unname(payouts[symbols[1]])
  } else if (all(bars)) {
    prize <- 5
  } else {
    cherries <- sum(symbols == "C")
    prize <- c(0, 2, 5)[cherries + 1]
  }
  
  # adjust for diamonds
  diamonds <- sum(symbols == "DD")
  prize * 2 ^ diamonds
}

play <- function() {
  symbols <- get_symbols()
  structure(score(symbols), symbols = symbols)
}
#play()

slot_display <- function(prize){
  
  # extract symbols
  symbols <- attr(prize, "symbols")
  
  # collapse symbols into single string
  symbols <- paste(symbols, collapse = " ")
  
  # combine symbol with prize as a character string
  # \n is special escape sequence for a new line (i.e. return or enter)
  string <- paste(symbols, prize, sep = "\n$")
  
  # display character string in console without quotes
  cat(string)
}
slot_display(play())


# simulation
winnings <- vector("integer", 1000000)
Acc_winnings <- vector("integer", 1000000)

for (i in 1:length(winnings)){
  # how to simulate independently, without using play()?
  winnings[i] <- (play() * - 1) + 1 		# each play of the slot machine costs $1
  
  if(i != 1){
    Acc_winnings[i] <- Acc_winnings[i-1] + winnings[i]
  }else{
    Acc_winnings[i] <- winnings[i]
  }
}

Acc_winnings[10000000]                            # why it results to NA?
sum(winnings)


# plot winnings and accumulated winnings
hist(winnings,                                    # how to plot it better?
     col = "lightblue",
     main = "Histogram of Casino Porfit Simulation
     of Each Slot Machine Play
     (1000,000 Played Slot Machines)",
     xlab = "Profit ($)",                         # do we have a better label?
     ylab = "Frequency")                          # do we have a better label?
hist(Acc_winnings,
     col = "lightblue",
     main = "Histogram of Casino Porfit Simulation
     (1000,000 Played Slot Machines)",
     xlab = "Profit ($)",                         # do we have a better label?
     ylab = "Frequency")                          # do we have a better label?