# Functions
Leonardo Jo  
August 16, 2017  


```r
knitr::opts_chunk$set(echo = TRUE)
# 19 Functions
library(tidyverse)
```

```
## Warning: package 'tidyverse' was built under R version 3.3.3
```

```
## Loading tidyverse: ggplot2
## Loading tidyverse: tibble
## Loading tidyverse: tidyr
## Loading tidyverse: readr
## Loading tidyverse: purrr
## Loading tidyverse: dplyr
```

```
## Warning: package 'ggplot2' was built under R version 3.3.3
```

```
## Warning: package 'tibble' was built under R version 3.3.3
```

```
## Warning: package 'tidyr' was built under R version 3.3.3
```

```
## Warning: package 'readr' was built under R version 3.3.3
```

```
## Warning: package 'purrr' was built under R version 3.3.3
```

```
## Warning: package 'dplyr' was built under R version 3.3.3
```

```
## Conflicts with tidy packages ----------------------------------------------
```

```
## filter(): dplyr, stats
## lag():    dplyr, stats
```

```r
### 19.2

df <- tibble::tibble(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)

df
```

```
## # A tibble: 10 x 4
##             a           b          c             d
##         <dbl>       <dbl>      <dbl>         <dbl>
##  1  1.1636709 -1.46820951 -0.4991321 -0.6675717202
##  2  2.2265017 -0.87780995  1.2453068 -0.2580654563
##  3 -1.7200597  0.24694821  1.2189372 -0.0765423547
##  4 -0.2426434  0.59968294  0.4749725 -1.0958563467
##  5 -0.3546144  0.94813701  0.2612997  0.3467830000
##  6 -0.1543708 -0.90695406  0.9303836  1.3327932065
##  7  0.3975685 -0.08156478 -2.3615311 -0.0008715528
##  8  0.1813326  0.56102348 -1.7393192  0.1542440060
##  9 -0.5098905 -0.57941075 -0.8051667 -3.3920819767
## 10 -0.5935678  0.66142641 -0.7073090 -1.1315627358
```

```r
df$a <- (df$a - min(df$a, na.rm = TRUE)) / 
  (max(df$a, na.rm = TRUE) - min(df$a, na.rm = TRUE))
df$b <- (df$b - min(df$b, na.rm = TRUE)) / 
  (max(df$b, na.rm = TRUE) - min(df$a, na.rm = TRUE))
df$c <- (df$c - min(df$c, na.rm = TRUE)) / 
  (max(df$c, na.rm = TRUE) - min(df$c, na.rm = TRUE))
df$d <- (df$d - min(df$d, na.rm = TRUE)) / 
  (max(df$d, na.rm = TRUE) - min(df$d, na.rm = TRUE))

df
```

```
## # A tibble: 10 x 4
##            a         b         c         d
##        <dbl>     <dbl>     <dbl>     <dbl>
##  1 0.7306945 0.0000000 0.5163523 0.5766312
##  2 1.0000000 0.6226944 1.0000000 0.6633014
##  3 0.0000000 1.8089767 0.9926890 0.7017200
##  4 0.3743553 2.1810059 0.7864239 0.4859865
##  5 0.3459835 2.5485204 0.7271829 0.7913151
##  6 0.3967223 0.5919561 0.9126872 1.0000000
##  7 0.5365755 1.4624941 0.0000000 0.7177355
##  8 0.4817845 2.1402318 0.1725090 0.7505650
##  9 0.3066389 0.9374160 0.4315038 0.0000000
## 10 0.2854363 2.2461268 0.4586350 0.4784294
```

```r
x <- df$a
(x - min(x, na.rm = TRUE)) / (max(x, na.rm = TRUE) - min(x, na.rm = TRUE))
```

```
##  [1] 0.7306945 1.0000000 0.0000000 0.3743553 0.3459835 0.3967223 0.5365755
##  [8] 0.4817845 0.3066389 0.2854363
```

```r
x
```

```
##  [1] 0.7306945 1.0000000 0.0000000 0.3743553 0.3459835 0.3967223 0.5365755
##  [8] 0.4817845 0.3066389 0.2854363
```

```r
rng <- range(x, na.rm = TRUE)
(x - rng[1]) / (rng[2] - rng[1])
```

```
##  [1] 0.7306945 1.0000000 0.0000000 0.3743553 0.3459835 0.3967223 0.5365755
##  [8] 0.4817845 0.3066389 0.2854363
```

```r
rng
```

```
## [1] 0 1
```

```r
rescale01 <- function(x) {
  rng <- range(x, na.rm = TRUE)
  (x - rng[1]) / (rng[2] - rng[1])
}
rescale01(c(0, 5, 10))
```

```
## [1] 0.0 0.5 1.0
```

```r
rescale01(df)
```

```
##            a         b          c         d
## 1  0.2867132 0.0000000 0.20260865 0.2262611
## 2  0.3923845 0.2443356 0.39238454 0.2602692
## 3  0.0000000 0.7098145 0.38951581 0.2753441
## 4  0.1468912 0.8557930 0.30858058 0.1906936
## 5  0.1357586 1.0000000 0.28533532 0.3104998
## 6  0.1556677 0.2322744 0.35812433 0.3923845
## 7  0.2105439 0.5738600 0.00000000 0.2816283
## 8  0.1890448 0.8397939 0.06768986 0.2945101
## 9  0.1203204 0.3678275 0.16931544 0.0000000
## 10 0.1120008 0.8813454 0.17996129 0.1877283
```

```r
rescale01(c(-10, 0, 10))
```

```
## [1] 0.0 0.5 1.0
```

```r
rescale01(c(1, 2, 3, NA, 5))
```

```
## [1] 0.00 0.25 0.50   NA 1.00
```

```r
range(c(0,2,10))
```

```
## [1]  0 10
```

```r
df$a <- rescale01(df$a)
df$b <- rescale01(df$b)
df$c <- rescale01(df$c)
df$d <- rescale01(df$d)


x <- c(1:10, Inf)
rescale01(x)
```

```
##  [1]   0   0   0   0   0   0   0   0   0   0 NaN
```

```r
rescale01 <- function(x) {
  rng <- range(x, na.rm = TRUE, finite = TRUE)
  (x - rng[1]) / (rng[2] - rng[1])
}
rescale01(x)
```

```
##  [1] 0.0000000 0.1111111 0.2222222 0.3333333 0.4444444 0.5555556 0.6666667
##  [8] 0.7777778 0.8888889 1.0000000       Inf
```

```r
## 19.2.1 Practice

## 1. Why is TRUE not a parameter to rescale01()? What would happen if x contained a single missing value, and na.rm was FALSE?
rescale02 <- function(x) {
  rng <- range(x, na.rm = FALSE)
  (x - rng[1]) / (rng[2] - rng[1])
}
x <- c(0:100,NA)
x
```

```
##   [1]   0   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16
##  [18]  17  18  19  20  21  22  23  24  25  26  27  28  29  30  31  32  33
##  [35]  34  35  36  37  38  39  40  41  42  43  44  45  46  47  48  49  50
##  [52]  51  52  53  54  55  56  57  58  59  60  61  62  63  64  65  66  67
##  [69]  68  69  70  71  72  73  74  75  76  77  78  79  80  81  82  83  84
##  [86]  85  86  87  88  89  90  91  92  93  94  95  96  97  98  99 100  NA
```

```r
rescale01(x)
```

```
##   [1] 0.00 0.01 0.02 0.03 0.04 0.05 0.06 0.07 0.08 0.09 0.10 0.11 0.12 0.13
##  [15] 0.14 0.15 0.16 0.17 0.18 0.19 0.20 0.21 0.22 0.23 0.24 0.25 0.26 0.27
##  [29] 0.28 0.29 0.30 0.31 0.32 0.33 0.34 0.35 0.36 0.37 0.38 0.39 0.40 0.41
##  [43] 0.42 0.43 0.44 0.45 0.46 0.47 0.48 0.49 0.50 0.51 0.52 0.53 0.54 0.55
##  [57] 0.56 0.57 0.58 0.59 0.60 0.61 0.62 0.63 0.64 0.65 0.66 0.67 0.68 0.69
##  [71] 0.70 0.71 0.72 0.73 0.74 0.75 0.76 0.77 0.78 0.79 0.80 0.81 0.82 0.83
##  [85] 0.84 0.85 0.86 0.87 0.88 0.89 0.90 0.91 0.92 0.93 0.94 0.95 0.96 0.97
##  [99] 0.98 0.99 1.00   NA
```

```r
rescale02(x)
```

```
##   [1] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
##  [24] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
##  [47] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
##  [70] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
##  [93] NA NA NA NA NA NA NA NA NA NA
```

```r
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
```

```
##  [1] 0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0 1.0 0.0
```

```r
## 3. Practice turning the following code snippets into functions. Think about what each function does. What would you call it? How many arguments does it need? Can you rewrite it to be more expressive or less duplicative?
## -------------------------------------------------------------------
y <- c(NA,NA,1,2,NA,NA,1,2)
mean(is.na(x))
```

```
## [1] 0
```

```r
na.proportion1 <- function(x) {
  a <- sum(is.na(x))
  b <- length(x)
  a / b
}

na.proportion2 <- function(x) {
  mean(is.na(x))
}

na.proportion1(y)
```

```
## [1] 0.5
```

```r
na.proportion2(y)
```

```
## [1] 0.5
```

```r
x <- tibble::tibble(a = c(NA,NA,1,2,NA,NA,1,2), b = c(NA,NA,1,2,NA,NA,1,2), c = 1:8)

na.proportion1(x)
```

```
## [1] 2.666667
```

```r
na.proportion2(x)
```

```
## [1] 0.3333333
```

```r
## Doens't work equally for tables and vectors, reason -> length of tables are total number of columns

na.proportion3 <- function(x) {
  a <- sum(is.na(x))
  b <- sum(!is.na(x))
  a / (a + b)
}

na.proportion1(x)
```

```
## [1] 2.666667
```

```r
na.proportion2(x)
```

```
## [1] 0.3333333
```

```r
na.proportion3(x)
```

```
## [1] 0.3333333
```

```r
## worked!
## -------------------------------------------------------------------

x / sum(x, na.rm = TRUE)
```

```
##            a          b          c
## 1         NA         NA 0.02083333
## 2         NA         NA 0.04166667
## 3 0.02083333 0.02083333 0.06250000
## 4 0.04166667 0.04166667 0.08333333
## 5         NA         NA 0.10416667
## 6         NA         NA 0.12500000
## 7 0.02083333 0.02083333 0.14583333
## 8 0.04166667 0.04166667 0.16666667
```

```r
percentage <- function(x){
  a <- x
  b <- sum(x, na.rm = TRUE)
  a / b
}

percentage(x)
```

```
##            a          b          c
## 1         NA         NA 0.02083333
## 2         NA         NA 0.04166667
## 3 0.02083333 0.02083333 0.06250000
## 4 0.04166667 0.04166667 0.08333333
## 5         NA         NA 0.10416667
## 6         NA         NA 0.12500000
## 7 0.02083333 0.02083333 0.14583333
## 8 0.04166667 0.04166667 0.16666667
```

```r
percentage(y)
```

```
## [1]        NA        NA 0.1666667 0.3333333        NA        NA 0.1666667
## [8] 0.3333333
```

```r
## -------------------------------------------------------------------
##

sd(x, na.rm = TRUE) / mean(x, na.rm = TRUE)
```

```
## Error in is.data.frame(x): (list) object cannot be coerced to type 'double'
```

```r
cvar <- function(x){
  a <- sd(x, na.rm = TRUE)
  b <- mean(x, na.rm = TRUE)
  a / b
}

cvar(y)
```

```
## [1] 0.3849002
```

```r
## cvar(x) doesnt work with tables!

## 4. Follow http://nicercode.github.io/intro/writing-functions.html to write your own functions to compute the variance and skew of a numeric vector.

table <- tibble::tibble(a = c(10,5,1,2,4,33,1,2), b = c(2,3,1,2,5,1,1,2), c = 1:8)

mean(table$a)
```

```
## [1] 7.25
```

```r
var(table$a)
```

```
## [1] 117.0714
```

```r
length(table$a)
```

```
## [1] 8
```

```r
## Standard error
sqrt(var(table$a)/length(table$a))
```

```
## [1] 3.825432
```

```r
sqrt(var(table$b)/length(table$b))
```

```
## [1] 0.4794901
```

```r
## Function

standard.error <- function(x) {
  sqrt(var(x)/length(x))
}

standard.error(table$b)
```

```
## [1] 0.4794901
```

```r
standard.error(table$a)
```

```
## [1] 3.825432
```

```r
x <- 1:100 

standard.error(table$a) ## same answer 
```

```
## [1] 3.825432
```

```r
standard.error <- function(x) {
  v <- var(x)
  n <- length(x)
  sqrt(v/n)
}

x <- table$a
n <- length(x)
(1/(n-1))
```

```
## [1] 0.1428571
```

```r
m <- mean(x)
x - m
```

```
## [1]  2.75 -2.25 -6.25 -5.25 -3.25 25.75 -6.25 -5.25
```

```r
(x-m)^2
```

```
## [1]   7.5625   5.0625  39.0625  27.5625  10.5625 663.0625  39.0625  27.5625
```

```r
sum((x-m)^2)
```

```
## [1] 819.5
```

```r
(1/(n-1)) * sum((x-m)^2)
```

```
## [1] 117.0714
```

```r
var(x)
```

```
## [1] 117.0714
```

```r
rm(n,x,m)


variance <- function(x) {
  n <- length(x)
  m <- mean(x)
  (1/(n-1)) * sum((x-m)^2)
}

variance(table$a) == var(table$a)
```

```
## [1] TRUE
```

```r
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
```

```
## Error in mean(x): object 'x' not found
```

```r
sample.skewness <- function(x) {
  m <- mean(x)
  stdev <- sd(x)
  n <- length(x)
  third.moment <- sum((x-m)^3)
  third.moment/stdev^3/n
}
sample.skewness(x)
```

```
## Error in mean(x): object 'x' not found
```

```r
y <- 1:10

sample.skewness(y)
```

```
## [1] 0
```

```r
skewness01(y)
```

```
## [1] 0
```

```r
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
```

```
## # A tibble: 3 x 2
##   position.x position.y
##        <int>      <int>
## 1          1          2
## 2          5          5
## 3          6          6
```

```r
## only for vectors with same lengths


## 6. What do the following functions do? Why are they useful even though they are so short?

is_directory <- function(x) file.info(x)$isdir
is_readable <- function(x) file.access(x, 4) == 0

is_directory("Aug_16_2017/")
```

```
## [1] NA
```

```r
is_directory("Aug_16_2017/Functions.R") ## tells if it's a directory
```

```
## [1] NA
```

```r
is_readable("Aug_16_2017/")
```

```
## Aug_16_2017/ 
##        FALSE
```

```r
is_readable("Aug_16_2018/") ## tells if it's readable file
```

```
## Aug_16_2018/ 
##        FALSE
```

```r
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
```

```
##  [1] -0.2551291 -0.4256502 -0.9235610  0.1865917 -1.7016740  0.2852301
##  [7] -1.6843172 -0.1678978  0.5432061 -1.5908609
```

```r
## rnorm(N) generates a vector of N pseudo-random normals with mean 0 and variance 1.  N must be a positive integer.

MASS::mvrnorm(10,5,10)
```

```
##            [,1]
##  [1,]  1.480775
##  [2,]  5.728152
##  [3,]  3.459962
##  [4,]  6.931389
##  [5,]  6.037553
##  [6,]  7.228154
##  [7,]  7.616929
##  [8,]  3.170085
##  [9,]  2.895127
## [10,] 11.660832
```

```r
## Multivariate Normal Distribution
## you need to specify mean, sigma

## Make a case for why norm_r(), norm_d() etc would be better than rnorm(), dnorm(). Make a case for the opposite.
```

