# Plotting in R

We will do some basic plotting in R, using first of all R's base plot functionality (which I think is pretty good).

## The very basic stuff

A scatter plot. 

```R
# Generate some data
x <- 1:10
y <- x^2

# Create a scatter plot
plot(x, y, main="Scatter Plot of x vs y", xlab="X values", ylab="Y values")
```

A line plot.

```R
# Generate data
x <- seq(-pi, pi, length.out=50)
y <- sin(x)

# Create a line plot
plot(x, y, type="l", col="blue", main="Line Plot of sin(x)", xlab="X", ylab="sin(X)")
```

A bar plot.

```R
# Data for a bar plot
categories <- c("A", "B", "C", "D")
values <- c(3, 7, 9, 5)

# Bar plot
barplot(values, names.arg=categories, col="purple", main="Bar Plot of Categories", xlab="Category", ylab="Value")
```

And for the statistical amongst us:

```R
# Generate random data
data <- rnorm(1000, mean=0, sd=1)

# Histogram
hist(data, breaks=20, col="lightblue", main="Histogram of Random Data", xlab="Value")
```

## Getting a little trickier

What if we wanted to add multiple series to the plot? Notice anything weird about these commands?

```R
# Generate data for multiple series
x <- seq(0, 10, by=0.1)
y1 <- sin(x)
y2 <- cos(x)

# Base plot with first series
plot(x, y1, type="l", col="blue", lwd=2, main="Sine and Cosine", xlab="X", ylab="Y")

# Add the second series
lines(x, y2, col="red", lwd=2)

# Adding a legend
legend("topright", legend=c("sin(x)", "cos(x)"), col=c("blue", "red"), lty=1, lwd=2)
```

And to colour based on grouped data?

```R
# a scatter plot of some grouped data
# lets make the data first
set.seed(123)
n <- 100
df <- data.frame(x = rnorm(n), y = rnorm(n), group = sample(letters[1:3], n, replace = TRUE))
# make some artificial differences between groups
df$x[df$group == "a"] <- df$x[df$group == "a"] + 10
df$x[df$group == "b"] <- df$x[df$group == "b"] + 1

# make some colours
cols <- c("red", "green", "blue")

# now plot it using base R
plot(df$x, df$y, col = cols[as.numeric(factor(df$group))], pch = 19, xlab = "X", ylab = "Y", main = "A scatter plot of some grouped data")
```

Mixing two different plotting types:

```R
# Generate data
x <- 1:10
y1 <- x + rnorm(10)
y2 <- x + rnorm(10, mean=5)

# Start with a scatter plot
plot(x, y1, pch=19, col="blue", ylim=c(min(y1, y2), max(y1, y2)), main="Overlaying Points and Lines", xlab="X", ylab="Y")

# Overlay with a line
lines(x, y2, col="red", lty=2, lwd=2)

# Add legend
legend("topleft", legend=c("Points", "Line"), col=c("blue", "red"), pch=c(19, NA), lty=c(NA, 2), lwd=2)
```

## Multiple plots

```R
# Example with iris dataset
pairs(iris[1:4], col=iris$Species, main="Pairwise Scatter Plot for Iris Data")
```

And using `par()`

```R
op <- par(mfrow=c(2,2))
plot(1:10, 1:10)
plot(1:10, 1:10, type="l")
plot(1:10, 1:10, type="b")
plot(1:10, 1:10, type="h")
par(op)
```

## Over to you!

Load up the barley data again:

```R
barley <- read.csv("https://raw.githubusercontent.com/ARU-life-sciences/bioinformatics/main/R/programming/2_working_with_dataframes/data/barley.csv")

# make some (meaningful) plots based on this data
```
