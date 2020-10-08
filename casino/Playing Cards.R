# Load deck cards
library(readr)
deck <- read_csv("https://gist.github.com/garrettgman/9629323/raw/ee5dfc039fd581cb467cc69c226ea2524913c3d8/deck.csv")
deck$value <- as.integer(deck$value)
View(deck)

# Set up blackjack deck
blackjack <- deck
facecard <- c("king", "queen", "jack")
blackjack$value[blackjack$face %in% facecard] <- 10
blackjack$value[blackjack$face == "ace"] <- NA
View(blackjack)

# Set up hearts deck
hearts <- deck
hearts$value <- 0
hearts$value[hearts$suit == "hearts"] <- 1
hearts$value[hearts$face == "queen" & hearts$suit == "spades"] <- 13
View(hearts)



# Shuffle deck
shuffle <- function(deck){
  deck[sample(nrow(deck)),]
}
View(shuffle(blackjack))
View(shuffle(hearts))



# Deal to 2 players (13 cards/each) in hearts
deal_hearts <- function(){
  local_hearts <- shuffle(hearts)         # create new shuffled hearts deck
  
  player1_hand <- head(local_hearts, 13)  # deal top 13 cards to player1
  local_hearts <- tail(local_hearts,-13)  # remove top 13 cards from the deck
  
  player2_hand <- head(local_hearts, 13)  # deal top 13 cards to player2
  local_hearts <- tail(local_hearts,-13)  # remove top 13 cards from the deck

  print("----Hearts player1----")
  print(player1_hand)
  print("----Hearts player2----")
  print(player2_hand)
  
  # update (or create if not existed) Global Environment hearts deck object
  assign("hearts", local_hearts, envir = globalenv())
}
deal_hearts()



# Deal cards to 2 players and a dealer in blackjack
deal_blackjack <- function(){
  local_blackjack <- shuffle(blackjack)        # create new shuffled hearts deck
  
  player1_hand <- head(local_blackjack, 2)     # deal top 2 cards to player1
  local_blackjack <- tail(local_blackjack,-2)  # remove top 2 cards from the deck
  
  player2_hand <- head(local_blackjack, 2)     # deal top 2 cards to player2
  local_blackjack <- tail(local_blackjack,-2)  # remove top 2 cards from the deck
  
  dealer_hand <- head(local_blackjack, 2)      # deal top 2 cards to dealer
  local_blackjack <- tail(local_blackjack,-2)  # remove top 2 cards from the deck
  
  print("----Blackjack player1----")
  print(player1_hand)
  print("----Blackjack player2----")
  print(player2_hand)
  print("----Blackjack dealer----")
  print(dealer_hand)
  
  # update (or create if not existed) Global Environment blackjack deck object
  assign("blackjack", local_blackjack, envir = globalenv())
}
deal_blackjack()



# Check updated hearts and blackjack decks
View(hearts)
View(blackjack)
