library(magrittr)
install.packages("magrittr")
install.packages("pipefittr")
library(pipefittr)
library(pryr)

foo_foo <- little_bunny()
diamonds <- ggplot2::diamonds
diamonds2 <- diamonds %>% 
  dplyr::mutate(price_per_carat = price / carat)

pryr::object_size(diamonds)
pryr::object_size(diamonds2)
pryr::object_size(diamonds, diamonds2)

diamonds$carat[1] <- NA

pryr::object_size(diamonds)
pryr::object_size(diamonds2)
pryr::object_size(diamonds, diamonds2)


assign("x", 10)
x
#> [1] 10

"x" %>% assign(100)
x
#> [1] 10


env <- environment()
"x" %>% assign(100, envir = env)
x


tryCatch(stop("!"), error = function(e) "An error")


rnorm(100) %>%
  matrix(ncol = 2) %>%
  plot() %>%
  str()

rnorm(100) %>%
  matrix(ncol = 2) %T>%
  plot() %>%
  str()

mtcars %$%
  cor(disp, mpg)

mtcars <- mtcars %>% 
  transform(cyl = cyl * 2)
mtcars2 <- mtcars
mtcars2 %<>% transform(cyl = cyl * 2)
