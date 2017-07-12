# 14 Strings

## 14.1 Introduction
library(tidyverse)
library(stringr)


string1 <- "This is a string"
string2 <- 'If I want to include a "quote" inside a string, I use single quotes'

double_quote <- "\"" # or '"'
single_quote <- '\'' # or "'"


string3 <- " \"This is a string\" "
string3

x <- c("\"", "\\")
x

writeLines(x)

x <- "\u00b5"
x

c("one", "two", "three")


str_length(c("a", "R for data science", NA))
str_c("x", "y")
str_c("x", "y","z")

str_c("x", "y", sep = ", ")


x <- c("abc", NA)
str_c("|-", x, "-|")
str_c("|-", str_replace_na(x), "-|")


str_c("prefix-", c("a", "b", "c"), "-suffix")

name <- "Hadley"
time_of_day <- "morning"
birthday <- TRUE

str_c(
  "Good ", time_of_day, " ", name,
  if (birthday) " and HAPPY BIRTHDAY",
  "."
)

print(str_c(
  "Good ", time_of_day, " ", name,
  if (birthday) " and HAPPY BIRTHDAY",
  "."
)
)

x <- c("Apple", "Banana", "Pear")
str_sub(x, 1, 3)
str_sub(x, -3, -1)

str_sub(x, 1, 1) <- str_to_upper(str_sub(x, 1, 3))
x

str_to_upper(c("i", "I"))
str_to_upper(c("i", "l"), locale = "tr")

x <- c("apple", "eggplant", "banana")

str_sort(x, locale = "en")  # English


### 14.2.5 Exercises

### 1. In code that doesn’t use stringr, you’ll often see paste() and paste0(). 
### What’s the difference between the two functions? What stringr function are they equivalent to? 
### How do the functions differ in their handling of NA?

paste("a","b","C", sep ="")
paste0("a","b","C") ## paste0 equals paste(,sep="")

paste("a","b",NA,"d", sep ="") #paste consider NA as character
str_c("a","b",NA,"d") #stringR consider NA as missing value, any opperations with NA will result in NA

### 2. In your own words, describe the difference between the sep and collapse arguments to str_c().
x <- c("a","b","c","d")
d <- c("1","2","3","4")

str_c(x,d, collapse=" ") ## one string
length(str_c(x,d, collapse=" "))

str_c(x,d, sep=" ")
length(str_c(x,d, sep=" ")) ## multiple strings in vector


### 3. Use str_length() and str_sub() to extract the middle character from a string. What will you do if the string has an even number of characters?
a <- "abcde"
str_sub(a,str_length(a)/2 + 0.5,str_length(a)/2 + 0.5) <- ""
a

a <- "abcdef"
str_sub(a,str_length(a)/2,str_length(a)/2 + 1) <- ""
a

a <- "abcdef"
if(str_length(a) %% 2 == 0) {
  str_sub(a,str_length(a)/2,str_length(a)/2 + 1) <- ""
} else {
  str_sub(a,str_length(a)/2 + 0.5,str_length(a)/2 + 0.5) <- ""
}
a

### 4. What does str_wrap() do? When might you want to use it?

a <- str_c(
  "First Line ",
  "Second Line ",
  "Third Line ",
  "Last Line. "
)  
a
str_wrap(a, width = 10, indent = 0, exdent = 4)
## You can use str_wrap() to modify existing whitespace in order to wrap a paragraph of text so that the length of each line as a similar as possible.

### 5. What does str_trim() do? What’s the opposite of str_trim()?
a
str_trim(a, side ="right")
str_pad(a, width = 1, side="right")

### 6. Write a function that turns (e.g.) a vector c("a", "b", "c") into the string a, b, and c. Think carefully about what it should do if given a vector of length 0, 1, or 2.

x <- c("a","b","c")
str_c(x[1],", ",x[2],", and ",x[3])

