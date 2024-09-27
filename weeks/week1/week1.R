# Week 1: working script
# building a simple script to do some probability calculations

# Write a function to simulate rolling two six-sided dice 
# 1,000 times. Count how often each possible outcome occurs.

# 1. We need to save the number of rolls.
# 2. Some way of simulating dice rolls (`?sample`).
# 3. We have two dice. Each die rolls a number. What are we interested in? 
# The actual values, or the combined value?
# 4. Count outcome occurrences (i.e. make a frequency distribution, `?table`)
# 5. Visualise!

# 1. Save the number of rolls
n_rolls <- 100000

# the dice numbers
dice_numbers <- 1:6

# some kind of random number generator
# use sample

# 2. Simulate dice rolls
# HELP: can we create a function to generate dice? Yes, we can!
# make the function
roll_dice <- function(n_rolls = 1000) {
  sample(dice_numbers, size = n_rolls, replace = TRUE)
}


dice1 <- roll_dice(n_rolls)
# this was the first roll of the dice
dice1[1]
# and the 100th
dice1[100]
# and we want another die
dice2 <- roll_dice(n_rolls)

# Are there rolls at the same index which were the same?
dice1 == dice2
sum(dice1 == dice2)
# HELP: what's the probability of this happening?
sum(dice1 == dice2) / n_rolls

# 3. Combine the dice rolls
# We want to add the two dice rolls together
counts <- dice1 + dice2
# show what these counts are:
counts

# 4. Count the occurrences

# do it manually, and naively
counts[counts == 5]

# a manual implementation of the frequency table
for (i in 2:12) {
  print(paste(i, "occurs", sum(counts == i), "times"))
}

frequncy_table <- table(counts)

# 5. Visualise!
barplot(frequncy_table, 
        main = "Frequency of dice rolls", 
        xlab = "Sum of dice rolls", 
        ylab = "Frequency"
      )
# HELP: do this in ggplot2

# And shuffling and drawing from 52 cards:

# 1. We need to make a big data frame of all the cards. 
#    We don't really want to type this all out though (`?expand.grid`)...
# 2. And how many cards are we drawing?
# 3. How are we going to shuffle the deck? (`sample` might be our friend here)
# 4. Draw the cards. How many times do we want to draw the cards?

suits <- c("hearts", "diamonds", "clubs", "spades")
values <- c(2:10, "J", "Q", "K", "A")

# 1. Make a big data frame of all the cards
cards <- expand.grid(suit = suits, value = values)

# make the shuffled indices
shuffled_indices_of_the_deck <- sample(x = 1:52, size = 52)

# shuffle the deck
shuffled_deck <- cards[shuffled_indices_of_the_deck, ]
rownames(shuffled_deck) <- NULL
# and this is the first card
shuffled_deck[1, ]

# okay that's fine, but we want to draw more than one card
# for each card, we must shuffle the deck again and again
draw_n_cards <- function(n_shuffles = 10000) {
  
  suits <- c("hearts", "diamonds", "clubs", "spades")
  values <- c(2:10, "J", "Q", "K", "A")
  cards <- expand.grid(suit = suits, value = values, stringsAsFactors = FALSE)
  
  d <- data.frame(suit = character(n_shuffles), value = character(n_shuffles))
  for (i in 1:n_shuffles) {
    shuffled_indices_of_the_deck <- sample(x = 1:52, size = 52)
    shuffled_deck <- cards[shuffled_indices_of_the_deck, ]
    # fill row, but keep character type
    d[i, ] <- shuffled_deck[1, ]
  }
  d
}

out <- draw_n_cards(10000)
table(out)

# plot the frequency of the cards
barplot(table(out), 
        main = "Frequency of cards drawn", 
        xlab = "Card", 
        ylab = "Frequency"
)
