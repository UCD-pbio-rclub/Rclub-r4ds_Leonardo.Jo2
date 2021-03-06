## 12 Tidy Data
### 12.1 Introduction
library(tidyverse)
### 12.2 Tidy data
table1
table2
table3
table4a
table4b

# Compute rate per 10,000
table1 %>% 
  mutate(rate = cases / population * 10000)

table1 %>% 
  count(year, wt = cases)

table1 %>% 
  count(country, wt = cases)

# Visualise changes over time
library(ggplot2)
ggplot(table1, aes(year, cases)) + 
  geom_line(aes(group = country), colour = "grey50") + 
  geom_point(aes(colour = country))

### 12.2.1 Exercises

#### Using prose, describe how the variables and observations are organised in each of the sample tables.

table1

table2

table3

table4a

table4b

table5


#### Compute the rate for table2, and table4a + table4b. You will need to perform four operations:
  
##PART1
####  Extract the number of TB cases per country per year.
cases <- table2 %>%
  filter(type == "cases") %>%
  transmute(cases = count)
####  Extract the matching population per country per year.
population <- table2 %>%
  filter(type == "population") %>%
  transmute(population = count)
####  Divide cases by population, and multiply by 10000.
rate <- cases/population*10000

####  Store back in the appropriate place.
table2 %>%
  filter(type == "cases") %>%
  select(country, year) %>%
  mutate(Cases = unlist(cases)) %>%
  mutate(Population = unlist(population)) %>%
  mutate(rate = unlist(rate))


####  Which representation is easiest to work with? Which is hardest? Why?

#### 3. Recreate the plot showing change in cases over time using table2 instead of table1. What do you need to do first?

table2 %>%
  filter(type == "cases") %>%
  select(country, year) %>%
  mutate(Cases = unlist(cases)) %>%
  mutate(Population = unlist(population)) %>%
  mutate(rate = unlist(rate)) %>%
  ggplot(aes(year, Cases)) + geom_line(aes(group = country), colour = "grey50") + 
  geom_point(aes(colour = country))

#### 12.3 Spreading and gathering

table4a
table4a %>% 
  gather(`1999`, `2000`, key = "year", value = "cases")

table4b %>% 
  gather(`1999`, `2000`, key = "year", value = "population")

tidy4a <- table4a %>% 
  gather(`1999`, `2000`, key = "year", value = "cases")
tidy4b <- table4b %>% 
  gather(`1999`, `2000`, key = "year", value = "population")
left_join(tidy4a, tidy4b)

#### 12.3.2 Spreading

table2
table2 %>%
  spread(key = type, value = count)

spread(table2, key = type, value = count)


#### 12.3.3 Exercises

#### 1. Why are gather() and spread() not perfectly symmetrical?
#### Carefully consider the following example:
  
stocks <- tibble(
    year   = c(2015, 2015, 2016, 2016),
    half  = c(   1,    2,     1,    2),
    return = c(1.88, 0.59, 0.92, 0.17)
  )

stocks
stocks %>% 
  spread(year, return) 

stocks %>% 
  spread(half, return) 

stocks %>% 
  spread(half, return) %>%
  gather(`1`,`2`, key = "half", value = "return")

## Answer: Spread reduces the number of rows by combining variables

#### 2. Why does this code fail?

table4a %>% 
  gather(1999, 2000, key = "year", value = "cases")
#> Error in combine_vars(vars, ind_list): Position must be between 0 and n

table4a

table4a %>% 
  gather(`1999`, `2000`, key = "year", value = "cases")
## Answer: you need to add `` between names

### 4. Why does spreading this tibble fail? How could you add a new column to fix the problem?

people <- tribble(
  ~name,             ~key,    ~value,
  #-----------------|--------|------
  "Phillip Woods",   "age",       45,
  "Phillip Woods",   "height",   186,
  "Phillip Woods",   "age",       50,
  "Jessica Cordero", "age",       37,
  "Jessica Cordero", "height",   156
)

people
people %>%
  spread(key = key, value = value)

## Answer: Error: Duplicate identifiers for rows (1, 3)

people2 <- tribble(
  ~name,             ~key,    ~value,
  #-----------------|--------|------
  "Phillip Woods",   "age",       45,
  "Phillip Woods",   "height",   186,
  "Jessica Cordero", "age",       37,
  "Jessica Cordero", "height",   156
)
people2
people2 %>%
  spread(key = key, value = value)

### Tidy the simple tibble below. Do you need to spread or gather it? What are the variables?

preg <- tribble(
  ~pregnant, ~male, ~female,
  "yes",     NA,    10,
  "no",      20,    12
)
preg
preg %>%
  gather(male,female, key = "gender", value = "cases")

### 12.4 Separating and uniting
#### 12.4.1 Separate

table3 ## Rate variable contain two variables

table3 %>% 
  separate(rate, into = c("cases", "population")) ## Will separate numbers before and after nun-numerical character

table3 %>% 
  separate(rate, into = c("cases", "population"), sep = "/") ## You can input separator

table3 %>% 
  separate(rate, into = c("cases", "population"), convert = TRUE) ## Convert into

table3 %>% 
  separate(year, into = c("century", "year"), sep = 2) ## numbers will separate the last digit

table3 %>% 
  separate(year, into = c("century", "year"), sep = 3) ## numbers will separate the last digit

### 12.4.2 Unite

table5

table5 %>% 
  unite(new, century, year) #unite columns century and year into new column called new

table5 %>% 
  unite(new, century, year, sep ="") #specifies separation between two arguments

### 12.4.3 Exercises

### 1. What do the extra and fill arguments do in separate()? Experiment with the various options for the following two toy datasets.
?separate()
##Extra = too many pieces
tibble(x = c("a,b,c", "d,e,f,g", "h,i,j")) %>% 
  separate(x, c("one", "two", "three"))

tibble(x = c("a,b,c", "d,e,f,g", "h,i,j")) %>% 
  separate(x, c("one", "two", "three"), extra = "drop")

##Fill = Missing pieces
tibble(x = c("a,b,c", "d,e", "f,g,i")) %>% 
  separate(x, c("one", "two", "three"))

tibble(x = c("a,b,c", "d,e", "f,g,i")) %>% 
  separate(x, c("one", "two", "three"), fill = "right")

### 2. Both unite() and separate() have a remove argument. What does it do? Why would you set it to FALSE?

tibble(x = c("a,b,c", "d,e,f", "f,g,i")) %>% 
  separate(x, c("one", "two", "three"), remove = F) ## Remove the original tibble, default = T


### 3. Compare and contrast separate() and extract(). Why are there three variations of separation (by position, by separator, and with groups), but only one unite?
?extract()
table3

table3 %>% 
  separate(rate, into = c("cases", "population"))


