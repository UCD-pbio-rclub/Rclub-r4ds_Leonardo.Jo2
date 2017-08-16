# 19 Functions
### 19.2

df <- tibble::tibble(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)

df

df$a <- (df$a - min(df$a, na.rm = TRUE)) / 
  (max(df$a, na.rm = TRUE) - min(df$a, na.rm = TRUE))
df$b <- (df$b - min(df$b, na.rm = TRUE)) / 
  (max(df$b, na.rm = TRUE) - min(df$a, na.rm = TRUE))
df$c <- (df$c - min(df$c, na.rm = TRUE)) / 
  (max(df$c, na.rm = TRUE) - min(df$c, na.rm = TRUE))
df$d <- (df$d - min(df$d, na.rm = TRUE)) / 
  (max(df$d, na.rm = TRUE) - min(df$d, na.rm = TRUE))

df

x <- df$a
(x - min(x, na.rm = TRUE)) / (max(x, na.rm = TRUE) - min(x, na.rm = TRUE))

x
rng <- range(x, na.rm = TRUE)
(x - rng[1]) / (rng[2] - rng[1])
rng


rescale01 <- function(x) {
  rng <- range(x, na.rm = TRUE)
  (x - rng[1]) / (rng[2] - rng[1])
}
rescale01(c(0, 5, 10))

rescale01(df)
rescale01(c(-10, 0, 10))
rescale01(c(1, 2, 3, NA, 5))
range(c(0,2,10))

df$a <- rescale01(df$a)
df$b <- rescale01(df$b)
df$c <- rescale01(df$c)
df$d <- rescale01(df$d)


x <- c(1:10, Inf)
rescale01(x)

rescale01 <- function(x) {
  rng <- range(x, na.rm = TRUE, finite = TRUE)
  (x - rng[1]) / (rng[2] - rng[1])
}
rescale01(x)
  

## 19.2.1 Practice

## 1. Why is TRUE not a parameter to rescale01()? What would happen if x contained a single missing value, and na.rm was FALSE?
rescale02 <- function(x) {
  rng <- range(x, na.rm = FALSE)
  (x - rng[1]) / (rng[2] - rng[1])
}
x <- c(0:100,NA)
x
rescale01(x)
rescale02(x)

## 2. In the second variant of rescale01(), infinite values are left unchanged. Rewrite rescale01() so that -Inf is mapped to 0, and Inf is mapped to 1.

rescale01 <- function(x) {
  rng <- range(x, na.rm = TRUE, finite = TRUE)
  a <- (x - rng[1]) / (rng[2] - rng[1])
  a[a == Inf] <- 1
  a[a == -Inf] <- 0
  a
}

x <- c(0:10, Inf, -Inf)
rescale01(x)


## 3. Practice turning the following code snippets into functions. Think about what each function does. What would you call it? How many arguments does it need? Can you rewrite it to be more expressive or less duplicative?
## -------------------------------------------------------------------
y <- c(NA,NA,1,2,NA,NA,1,2)
mean(is.na(x))

na.proportion1 <- function(x) {
  sum(is.na(x)) / length(x)
}

na.proportion2 <- function(x) {
  mean(is.na(x))
}

na.proportion1(y)
na.proportion2(y)

x <- tibble::tibble(a = c(NA,NA,1,2,NA,NA,1,2), b = c(NA,NA,1,2,NA,NA,1,2), c = 1:8)


na.proportion1(x)
na.proportion2(x)

## Doens't work equally for tables and vectors, reason -> length of tables are total number of columns

na.proportion3 <- function(x) {
  n.na <- sum(is.na(x))
  not.na <- sum(!is.na(x))
  n.na / (n.na + not.na)
}

na.proportion1(x)
na.proportion2(x)
na.proportion3(x)

## worked!
## -------------------------------------------------------------------

x / sum(x, na.rm = TRUE)

percentage <- function(x){
  x / sum(x, na.rm = TRUE)
}

percentage(x)

percentage <- function(x){
  a <- x
  b <- sum(x, na.rm = TRUE)
  a / b
}

percentage(x)

## -------------------------------------------------------------------
##

sd(x, na.rm = TRUE) / mean(x, na.rm = TRUE)
cvar <- function(x){
  a <- sd(x, na.rm = TRUE)
  b <- mean(x, na.rm = TRUE)
  a / b
}

cvar(y)

## 4. Follow http://nicercode.github.io/intro/writing-functions.html to write your own functions to compute the variance and skew of a numeric vector.

## 5. Write both_na(), a function that takes two vectors of the same length and returns the number of positions that have an NA in both vectors.

## 6. What do the following functions do? Why are they useful even though they are so short?

is_directory <- function(x) file.info(x)$isdir
is_readable <- function(x) file.access(x, 4) == 0

##Read the complete lyrics to “Little Bunny Foo Foo”. There’s a lot of duplication in this song. Extend the initial piping example to recreate the complete song, and use functions to reduce the duplication.
