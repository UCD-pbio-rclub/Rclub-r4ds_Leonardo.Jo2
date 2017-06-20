## 12.5 Missing values
library(tidyverse)
stocks <- tibble(
  year   = c(2015, 2015, 2015, 2015, 2016, 2016, 2016),
  qtr    = c(   1,    2,    3,    4,    2,    3,    4),
  return = c(1.88, 0.59, 0.35,   NA, 0.92, 0.17, 2.66)
)
stocks

stocks %>% 
  spread(year, return)

stocks %>% 
  spread(year, return) %>% 
  gather(year, return, `2015`:`2016`, na.rm = TRUE)

na.omit(
  stocks %>% 
  spread(year, return) %>% 
  gather(year, return, `2015`:`2016`)
)

stocks

stocks %>% 
  complete(year, qtr)
 

treatment <- tribble(
  ~ person,           ~ treatment, ~response,
  "Derrick Whitmore", 1,           7,
  NA,                 2,           10,
  NA,                 3,           9,
  "Katherine Burke",  1,           4
)


treatment

treatment %>% 
  fill(person)

treatment %>% 
  fill(person) %>%
  complete(person, treatment) %>%
  fill(response)

list(4,4)
### 12.5.1 Exercises

### 1. Compare and contrast the fill arguments to spread() and complete().
?fill() ## Replace missing values by above or below value
?spread() ## Create new table and add implicit missing values
?complete() ## Add implicit missing values, fill will replace NAs by a list of vectors

treatment %>% 
  fill(person) %>%
  complete(person, treatment, fill = list(4)) ## Didn't work, why?

### 2. What does the direction argument to fill() do?

?fill() ## Replace missing values by above or below value

treatment %>% 
  fill(person, .direction = c("up"))

### 12.6 Case Study
who

who1 <- who %>% 
  gather(new_sp_m014:newrel_f65, key = "key", value = "cases", na.rm = TRUE)

who1

who1 %>% 
  count(key)

who2 <- who1 %>% 
  mutate(key = stringr::str_replace(key, "newrel", "new_rel"))

who2

who3 <- who2 %>% 
  separate(key, c("new", "type", "sexage"), sep = "_")

who3

who3 %>% 
  count(new)

who4 <- who3 %>% 
  select(-new, -iso2, -iso3)

who4

who5 <- who4 %>% 
  separate(sexage, c("sex", "age"), sep = 1)


who %>%
  gather(code, value, new_sp_m014:newrel_f65, na.rm = TRUE) %>% 
  mutate(code = stringr::str_replace(code, "newrel", "new_rel")) %>%
  separate(code, c("new", "var", "sexage")) %>% 
  select(-new, -iso2, -iso3) %>% 
  separate(sexage, c("sex", "age"), sep = 1) %>%
  complete(country, year,var,age,sex)



who5 %>%
  filter(year > 1990 & cases > 10000)

who5 %>%
  na.omit() %>%
  ggplot() +
  geom_col(aes(year,cases, fill = sex))

## 12.6.1 Exercises

## In this case study I set na.rm = TRUE just to make it easier to check that we had the correct values. Is this reasonable? Think about how missing values are represented in this dataset. Are there implicit missing values? What’s the difference between an NA and zero?

who %>%
  gather(code, value, new_sp_m014:newrel_f65) %>% 
  mutate(code = stringr::str_replace(code, "newrel", "new_rel")) %>%
  separate(code, c("new", "var", "sexage")) %>% 
  select(-new, -iso2, -iso3) %>% 
  separate(sexage, c("sex", "age"), sep = 1)

who %>%
  gather(code, value, new_sp_m014:newrel_f65, na.rm = T) %>% 
  mutate(code = stringr::str_replace(code, "newrel", "new_rel")) %>%
  separate(code, c("new", "var", "sexage")) %>% 
  select(-new, -iso2, -iso3) %>% 
  separate(sexage, c("sex", "age"), sep = 1) %>%
  complete(country, year,var,age,sex)
  
## Why different?!

who %>%
  gather(code, value, new_sp_m014:newrel_f65) %>% 
  mutate(code = stringr::str_replace(code, "newrel", "new_rel")) %>%
  separate(code, c("new", "var", "sexage")) %>% 
  select(-new, -iso2, -iso3) %>% 
  separate(sexage, c("sex", "age"), sep = 1) %>%
  complete(country, year,var,age,sex)

## 2. What happens if you neglect the mutate() step? (mutate(key = stringr::str_replace(key, "newrel", "new_rel")))

who %>%
  gather(code, value, new_sp_m014:newrel_f65, na.rm = T) %>%
  separate(code, c("new", "var", "sexage")) %>% 
  select(-new, -iso2, -iso3) %>% 
  separate(sexage, c("sex", "age"), sep = 1)
