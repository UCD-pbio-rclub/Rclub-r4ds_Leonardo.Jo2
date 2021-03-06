# 19 Functions
library(tidyverse)
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
  a <- sum(is.na(x))
  b <- length(x)
  a / b
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
  a <- sum(is.na(x))
  b <- sum(!is.na(x))
  a / (a + b)
}

na.proportion1(x)
na.proportion2(x)
na.proportion3(x)

## worked!
## -------------------------------------------------------------------

x / sum(x, na.rm = TRUE)

percentage <- function(x){
  a <- x
  b <- sum(x, na.rm = TRUE)
  a / b
}

percentage(x)
percentage(y)

## -------------------------------------------------------------------
##

sd(x, na.rm = TRUE) / mean(x, na.rm = TRUE)
cvar <- function(x){
  a <- sd(x, na.rm = TRUE)
  b <- mean(x, na.rm = TRUE)
  a / b
}

cvar(y)
## cvar(x) doesnt work with tables!

## 4. Follow http://nicercode.github.io/intro/writing-functions.html to write your own functions to compute the variance and skew of a numeric vector.

table <- tibble::tibble(a = c(10,5,1,2,4,33,1,2), b = c(2,3,1,2,5,1,1,2), c = 1:8)

mean(table$a)
var(table$a)
length(table$a)

## Standard error
sqrt(var(table$a)/length(table$a))

sqrt(var(table$b)/length(table$b))

## Function

standard.error <- function(x) {
  sqrt(var(x)/length(x))
}

standard.error(table$b)
standard.error(table$a)

x <- 1:100 

standard.error(table$a) ## same answer 
standard.error <- function(x) {
  v <- var(x)
  n <- length(x)
  sqrt(v/n)
}

x <- table$a
n <- length(x)
(1/(n-1))
m <- mean(x)
x - m
(x-m)^2
sum((x-m)^2)
(1/(n-1)) * sum((x-m)^2)
var(x)
rm(n,x,m)


variance <- function(x) {
  n <- length(x)
  m <- mean(x)
  (1/(n-1)) * sum((x-m)^2)
}

variance(table$a) == var(table$a)

## My came up as TRUE

## Exercise: function for skewness

skewness01 <- function(x) {
  m <- mean(x)
  med <- median(x)
  stdev <- sd(x)
  n <- length(x)
  third.moment <- sum((x-m)^3) * (1/(n-2))
  third.moment/(var(x)^(3/2))
}
skewness01(x)

sample.skewness <- function(x) {
  m <- mean(x)
  stdev <- sd(x)
  n <- length(x)
  third.moment <- sum((x-m)^3)
  third.moment/stdev^3/n
}
sample.skewness(x)

y <- 1:10

sample.skewness(y)
skewness01(y)

## 5. Write both_na(), a function that takes two vectors of the same length and returns the number of positions that have an NA in both vectors.

a = c(NA,0,1,2,NA,NA,1,2) 
b = c(1,NA,1,2,NA,NA,1,2)
c = 1:8

both_na <- function(x,y) {
  a <- which(is.na(x))
  b <- which(is.na(y))
  tibble::tibble('position.x' = a, 'position.y' = b)
}
both_na(a,b)

## only for vectors with same lengths


## 6. What do the following functions do? Why are they useful even though they are so short?

is_directory <- function(x) file.info(x)$isdir
is_readable <- function(x) file.access(x, 4) == 0

is_directory("Aug_16_2017/")
is_directory("Aug_16_2017/Functions.R") ## tells if it's a directory

is_readable("Aug_16_2017/")
is_readable("Aug_16_2018/") ## tells if it's readable file

##Read the complete lyrics to “Little Bunny Foo Foo”. There’s a lot of duplication in this song. Extend the initial piping example to recreate the complete song, and use functions to reduce the duplication.



## 19.3 
## Rule: Function names are verbs and arguments are nouns

# Never do this! Stick with one style, underscore to separate words or Capital to separate words
# col_mins <- function(x, y) {}
# rowMaxes <- function(y, x) {}

## 19.3.1 Exercises

## Take a function that you’ve written recently and spend 5 minutes brainstorming a better name for it and its arguments.

na.proportion3 <- function(x) {
  a <- sum(is.na(x))
  b <- sum(!is.na(x))
  a / (a + b)
}

na_proportion <- function(x) {
  na_arg <- sum(is.na(x))
  non_na_ar <- sum(!is.na(x))
  na_arg / (na_arg + non_na_arg)
}

## Compare and contrast rnorm() and MASS::mvrnorm(). How could you make them more consistent?

rnorm(10)
## rnorm(N) generates a vector of N pseudo-random normals with mean 0 and variance 1.  N must be a positive integer.

MASS::mvrnorm(10,5,10)
## Multivariate Normal Distribution
## you need to specify mean, sigma

## Make a case for why norm_r(), norm_d() etc would be better than rnorm(), dnorm(). Make a case for the opposite.
