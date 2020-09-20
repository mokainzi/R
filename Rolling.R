# Homework

# Using MatrixDS or R-Studio Cloud
# 1. Create a 10 sided dice and a 20 sided dice. 
# 2. Create a function to roll 6 of these dice at a time and calculate the sum and
# 3. another function to calculate how many dice rolled more than 6 (for the 10 sided) or 16 (for the 20 sided).
# 4. Make sure to save all of your functions on a script called rolling.R 
# 5. Upload your rolling.R script

die10 <- 1:10
die20 <- 1:20

roll <- function(die10, die20){
  dice10 <- sample(die10, 6)
  dice20 <- sample(die20, 6)
  rolls_sum = list("dice10" = dice10, "dice20" = dice20, "sum_dices" = sum(dice10, dice20))
  return(rolls_sum)
}
dices_rolls <- roll(die10, die20)
dices_rolls

dice_over_threshhold <- function(dice10, dice20){
  dice10_threshold <- 6
  dice20_threshold <- 16
  dice10_over_threshold_counter <- 0
  dice20_over_threshold_counter <- 0
  
  for (dice10_roll in dice10) 
    if (dice10_roll > dice10_threshold)
      dice10_over_threshold_counter = dice10_over_threshold_counter + 1
  
  for (dice20_roll in dice20)
    if (dice20_roll > dice20_threshold)
      dice20_over_threshold_counter = dice20_over_threshold_counter + 1
  
  cat("\n10-sided dice rolled more than", dice10_threshold, " :", dice10_over_threshold_counter)
  cat("\n20-sided dice rolled more than", dice20_threshold, ":", dice20_over_threshold_counter)
  
  #over_threshold = list("dice10_over_threshold_counter" = dice10_over_threshold_counter, "dice20_over_threshold_counter" = dice20_over_threshold_counter)
  #return(over_threshold)
}
dice_over_threshhold(dices_rolls$dice10, dices_rolls$dice20)
