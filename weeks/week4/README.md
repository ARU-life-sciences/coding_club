# Simple stats

## Central tendency

Values tend to cluster around certain values. Even if the data does not show a tendency to cluster around a value, then the parameters derived from repeated experiments mostly do.

### The mean

What is the mean? Usually we're talking about the arithmetic mean.

It's the sum of a group of numbers divided by the number of elements you took to make that sum.

- Create an R function to compute the mean

```R
arithmetic.mean <- function(x) mean(x) # is not allowed...
# because it's cheating.
```

### The median

The median is less sensitive to outliers than is the median. How do we compute the median? If we were to sort some numbers and find the middle value, that's the median.

- slightly more complicated to compute than the mean

```R
med <- function(x) median(x) # is again cheating!
```

1. Sort the data
2. Find the mid-point of the data
3. If the number of elements is even, we average mid-point 1 and mid-point 2, otherwise we're golden

## Variance

Is perhaps one of the most important ideas in statistics. Things vary, but how much?

Something I cooked up based on Mick Crawley's R book (v good by the way):

```R
d <- c(13, 7, 5, 9, 12, 8, 6, 11, 10, 14)
plot(d, ylim = c(min(d) - 2, max(d) + 2), 
     pch = 19, 
     xlab = "Index", 
     ylab = "Value"
    )
abline(h = mean(d), col = "red", lty = 2)

# show lines from each of our points to the mean
for (i in 1:length(d)) {
  print(paste(c(i, i), c(d[i], mean(d))))
  lines(c(i, i), c(d[i], mean(d)), col = "blue")
}

# why does simple summing not work? Write on plot
# the cumulative residuals above each point
cumulative_residuals <- cumsum(d - mean(d))
for (i in 1:length(d)) {
  # if the point is above the average put text above the point
  if (d[i] > mean(d)) {
    text(i, d[i] + 1.5, labels = cumulative_residuals[i])
  } else {
    text(i, d[i] - 1.5, labels = cumulative_residuals[i])
  }
}

# now what about the sum of the squares of the residuals?
# write this on the plot
sum_of_squares <- sum((d - mean(d))^2)

# but this always gets bigger as we add more points...
# so we need to divide by the degrees of freedom
# which is the number of points minus 1
degrees_of_freedom <- length(d) - 1
mean_squared_residuals <- sum_of_squares / degrees_of_freedom
```

Now we will compute the variance by hand.
