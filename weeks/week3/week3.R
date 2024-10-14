# a very simple function
add_one <- function(x) x + 1

# a more complex function, spread over several lines
add_one_multiply_2 <- function(x) {
  # add one
  add_one <- x + 1
  cat("The value of add_one is: ", add_one, "\n")
  # multiply by two
  # the last line of the function is the return value
  return(add_one * 2)
}

# call the function by writing its name and the parentheses
# along with any arguments, here we only had one parameter, x.
add_one_multiply_2(3)

# functions do not have to have arguments.
cat_dir <- function() {
  files <- list.files(".")
  for (file in files) {
    cat(file, "\n")
  }
}

# again call the function
cat_dir()

# Control flow in programs!

# a verbose function to check if a number is even
is_even <- function(x) {
  is_even <- x %% 2 == 0
  if (is_even) {
    cat(x, "is even\n")
  } else {
    cat(x, "is odd\n")
  }
}

# probably better written like this:
is_even <- function(x) ifelse(x %% 2 == 0, yes = "even", no = "odd")

# and working with a bit of 'real' data
# read in the barley data
barley <- read.csv("https://raw.githubusercontent.com/ARU-life-sciences/bioinformatics/main/R/programming/2_working_with_dataframes/data/barley.csv")

# take the yield column again
yield <- barley$yield

# assign high and low yield based on mean value
high_or_low_yield <- ifelse(yield < mean(yield), yes = "low", no = "high")

# assign this back to our data in a new column
barley$high_or_low_yield <- high_or_low_yield

barley[barley$high_or_low_yield == "high", ]
