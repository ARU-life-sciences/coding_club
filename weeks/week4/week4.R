x <- c(1, 2, 3, 4, 5, 10, 1000)

# edit your median function so that it works
# for both even and odd length vectors
my.median <- function(x) {
  # is the vector even length??
  is_vector_even <- length(x) %% 2 == 0
  # sort
  sorted_vec <- sort(x)
  # get the mid point
  index_of_mid_point <- length(sorted_vec) / 2

  if (is_vector_even) {
    # ...
    first_midpoint <- sorted_vec[index_of_mid_point]
    second_midpoint <- sorted_vec[index_of_mid_point + 1]

    return((first_midpoint + second_midpoint) / 2)
  } else {
    to_integer <- ceiling(index_of_mid_point)
    first_midpoint <- sorted_vec[to_integer]
    return(first_midpoint)
  }
}

vec <- c(1, 2, 3, 4, 5, 10) # 3.5
vec2 <- c(1, 2, 3, 4, 5, 10, 1000) # 4

my.median(vec2)
median(vec2)

my.median(vec2) == median(vec2)
