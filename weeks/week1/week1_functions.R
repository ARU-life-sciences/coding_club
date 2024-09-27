# A clean up of the functions we wrote today

# The probability of getting any particular total from
# rolling two dice. We can alter the number of rolls.
# It returns a plot, and the underlying data
ptwo_dice <- function(n_rolls = 10000) {
  # the dice numbers
  # this is a vector of the numbers on the dice
  dice_numbers <- 1:6

  # inner function to roll the dice
  roll_dice <- function(n_rolls = 1000) {
    # sample from the dice_numbers vector
    # with replacement, and the size of the
    # number of rolls
    sample(dice_numbers, size = n_rolls, replace = TRUE)
  }

  # roll the dice
  dice1 <- roll_dice(n_rolls)
  dice2 <- roll_dice(n_rolls)

  # combine the dice rolls
  # simple sums work in R by summing each pair of numbers
  # across the whole vector
  counts <- dice1 + dice2

  # make a frequency table
  frequncy_table <- table(counts)

  # visualise the frequency table
  barplot(frequncy_table,
    main = "Frequency of dice rolls",
    xlab = "Sum of dice rolls",
    ylab = "Frequency"
  )

  # return the frequency table
  # the return function is not necessary in R, but
  # it is good practice to include it
  return(frequncy_table)
}

# test the function works
ptwo_dice()

# and the deck of cards
draw_n_cards <- function(n_shuffles = 10000) {

  # define the suits and values
  suits <- c("hearts", "diamonds", "clubs", "spades")
  values <- c(2:10, "J", "Q", "K", "A")
  # create a data frame of all the cards
  cards <- expand.grid(suit = suits, value = values, stringsAsFactors = FALSE)

  # create a data frame to store the first card
  # from each shuffled deck at each iteration
  d <- data.frame(suit = character(n_shuffles), value = character(n_shuffles))

  # loop through n_shuffles, shuffle the deck
  # and store the first card in the data frame
  for (i in 1:n_shuffles) {
    shuffled_indices_of_the_deck <- sample(x = 1:52, size = 52)
    shuffled_deck <- cards[shuffled_indices_of_the_deck, ]
    # fill row, but keep character type
    d[i, ] <- shuffled_deck[1, ]
  }

  # again, make a frequency table
  tab <- table(d)

  # plot the frequency of the cards
  barplot(tab,
    main = "Frequency of cards drawn",
    xlab = "Card",
    ylab = "Frequency"
  )

  tab
}

# test the function works
draw_n_cards()
