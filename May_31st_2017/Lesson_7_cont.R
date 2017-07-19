# 7.6 Patterns and models

library(tidyverse)
library(dplyr)

ggplot(data = faithful) + 
  geom_point(mapping = aes(x = eruptions, y = waiting))

faithful
summary(faithful)

library(modelr)

mod <- lm(log(price) ~ log(carat), data = diamonds)

diamonds2 <- diamonds %>% 
  add_residuals(mod) %>% 
  mutate(resid = exp(resid))

ggplot(data = diamonds2) + 
  geom_point(mapping = aes(x = carat, y = resid))

ggplot(data = diamonds2) + 
  geom_boxplot(mapping = aes(x = cut, y = resid))

#7.7 ggplot2 calls

ggplot(data = faithful, mapping = aes(x = eruptions)) + 
  geom_freqpoly(binwidth = 0.25)

ggplot(faithful, aes(eruptions,..density..)) + 
  geom_freqpoly(binwidth = 0.25)

diamonds %>% 
  count(cut, clarity) %>% 
  ggplot(aes(clarity, cut, fill = n)) + 
  geom_tile()

# 10 Tibbles
## 10.1 Introduction
as_tibble(iris)
as_tibble(faithful)

tibble(
  x = 1:5,
  y=1,
  z= x^2 + y
)

tb <- tibble(
  `:)` = "smile", 
  ` ` = "space",
  `2000` = "number"
)
tb

tribble(
  ~x, ~y, ~z,
  #--|--|----
  "a", 2, 3.6,
  "b", 1, 8.5
)



tibble(
  a = lubridate::now() + runif(1e3) * 86400,
  b = lubridate::today() + runif(1e3) * 30,
  c = 1:1e3,
  d = runif(1e3),
  e = sample(letters, 1e3, replace = TRUE)
)


nycflights13::flights %>% 
  print(n = 10, width = Inf)

options(tibble.width = Inf)

nycflights13::flights

nycflights13::flights %>% 
  View()


df <- tibble(
  x = runif(5),
  y = rnorm(5)
)
df
df$x
df[[1]]
df[1]
as.vector(df[1])
df %>% .$x
df %>% .[["x"]]

class(as.data.frame(tb))
class(tb)


## 10.5 Exercises

### 1. How can you tell if an object is a tibble?

mtcars
class(mtcars)[1]
class(as_tibble(mtcars))[1]

### 2. Compare and contrast the following operations on a data.frame and equivalent tibble. What is different? Why might the default data frame behaviours cause you frustration?

df <- data.frame(abc = 1, xyz = "a")
df
df$xyz
df$xy
df[, "xyz"]
df[, c("abc", "xyz")]
#data.frame treats columns like factors

df <- tibble(abc = 1, xyz ="a")
df
df$xyz
df[, "xyz"]
#tibble don't treat columns like factors

var <- "mpg"
df <- tibble(`abc` = c(1,2), `xyz` = c("mpg","xxx"))
df

df %>% as_tibble() %>%
  filter(`xyz`, `xyz` == var)

get(df, var)

mpg[var]

subset(df, xyz == var)

annoying <- tibble(
  `1` = 1:10,
  `2` = `1` * 2 + rnorm(length(`1`))
)

## Practice referring to non-syntactic names in the following data frame by:
## Extracting the variable called 1.

annoying %>% filter(`1`, `1` == 1)

annoying[["`1"]]

## Plotting a scatterplot of 1 vs 2.

ggplot(annoying) +
  geom_point(aes(`1`,`2`))

## Creating a new column called 3 which is 2 divided by 1.

annoying <- annoying %>% 
  mutate(`3`= `2`/`1`)

annoying
## Renaming the columns to one, two and three.

annoying %>%
  rename("one" = `1`)

names(annoying) <- c("one", "two", "three")

write.table(annoying, "annoying.txt", sep="\t", col.names = T, row.names = F)

annoying


## 5. What does tibble::enframe() do? When might you use it?
  
## Creates a tibble from atomic vectors of two clomuns 
??enframe
tibble::enframe(annoying, c("name","value","mean"))

enframe(1:3)
enframe(c(a = 5, b = 7))
enframe(annoying)
enframe(c(a = 1+1,b = 2+2))

## What option controls how many additional column names are printed at the footer of a tibble?

annoying
