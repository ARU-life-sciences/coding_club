# Coding club week 1

## Simulating basic probability:

Tasks:

- Write a function to simulate rolling two six-sided dice 1,000 times. Count how often each possible outcome occurs.
- Visualize the distribution of outcomes using a bar plot.
- If we finish, can we extend this to simulate drawing cards from a deck?

We'll make the code together, and upload something to here when we are done.

Walkthrough:

This is for two dice.

1. We need to save the number of rolls.
2. Some way of simulating dice rolls (`?sample`).
3. We have two dice. Each die rolls a number. What are we interested in? The actual values, or the combined value?
4. Count outcome occurrences (i.e. make a frequency distribution, `?table`)
5. Visualise!

We managed to do this, but I have cleaned up the code into functions. See `week1_functions.R`.


## Extension:

And shuffling and drawing from 52 cards:

1. We need to make a big data frame of all the cards. We don't really want to type this all out though (`?expand.grid`)...
2. And how many cards are we drawing?
3. How are we going to shuffle the deck? (`sample` might be our friend here)
4. Draw the cards. What's the probability of drawing a King?

We didn't get to this, but I've put up my solution on here. It's not the only one!

## Conclusions

Even doing something really simple as throwing dice is tricky to formalise in code, but hopefully you can see all the steps here.
