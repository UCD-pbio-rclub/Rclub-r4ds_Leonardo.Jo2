# Strings
Leonardo Jo  
July 12, 2017  



```r
# 14 Strings

## 14.1 Introduction
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
library(stringr)
```

```
## Warning: package 'stringr' was built under R version 3.3.3
```

```r
string1 <- "This is a string"
string2 <- 'If I want to include a "quote" inside a string, I use single quotes'

double_quote <- "\"" # or '"'
single_quote <- '\'' # or "'"


string3 <- " \"This is a string\" "
string3
```

```
## [1] " \"This is a string\" "
```

```r
x <- c("\"", "\\")
x
```

```
## [1] "\"" "\\"
```

```r
writeLines(x)
```

```
## "
## \
```

```r
x <- "\u00b5"
x
```

```
## [1] "µ"
```

```r
c("one", "two", "three")
```

```
## [1] "one"   "two"   "three"
```

```r
str_length(c("a", "R for data science", NA))
```

```
## [1]  1 18 NA
```

```r
str_c("x", "y")
```

```
## [1] "xy"
```

```r
str_c("x", "y","z")
```

```
## [1] "xyz"
```

```r
str_c("x", "y", sep = ", ")
```

```
## [1] "x, y"
```

```r
x <- c("abc", NA)
str_c("|-", x, "-|")
```

```
## [1] "|-abc-|" NA
```

```r
str_c("|-", str_replace_na(x), "-|")
```

```
## [1] "|-abc-|" "|-NA-|"
```

```r
str_c("prefix-", c("a", "b", "c"), "-suffix")
```

```
## [1] "prefix-a-suffix" "prefix-b-suffix" "prefix-c-suffix"
```

```r
name <- "Hadley"
time_of_day <- "morning"
birthday <- TRUE

str_c(
  "Good ", time_of_day, " ", name,
  if (birthday) " and HAPPY BIRTHDAY",
  "."
)
```

```
## [1] "Good morning Hadley and HAPPY BIRTHDAY."
```

```r
print(str_c(
  "Good ", time_of_day, " ", name,
  if (birthday) " and HAPPY BIRTHDAY",
  "."
)
)
```

```
## [1] "Good morning Hadley and HAPPY BIRTHDAY."
```

```r
x <- c("Apple", "Banana", "Pear")
str_sub(x, 1, 3)
```

```
## [1] "App" "Ban" "Pea"
```

```r
str_sub(x, -3, -1)
```

```
## [1] "ple" "ana" "ear"
```

```r
str_sub(x, 1, 1) <- str_to_upper(str_sub(x, 1, 3))
x
```

```
## [1] "APPpple"  "BANanana" "PEAear"
```

```r
str_to_upper(c("i", "I"))
```

```
## [1] "I" "I"
```

```r
str_to_upper(c("i", "l"), locale = "tr")
```

```
## [1] "I" "L"
```

```r
x <- c("apple", "eggplant", "banana")

str_sort(x, locale = "en")  # English
```

```
## [1] "apple"    "banana"   "eggplant"
```

```r
### 14.2.5 Exercises

### 1. In code that doesn’t use stringr, you’ll often see paste() and paste0(). 
### What’s the difference between the two functions? What stringr function are they equivalent to? 
### How do the functions differ in their handling of NA?

paste("a","b","C", sep ="")
```

```
## [1] "abC"
```

```r
paste0("a","b","C") ## paste0 equals paste(,sep="")
```

```
## [1] "abC"
```

```r
paste("a","b",NA,"d", sep ="") #paste consider NA as character
```

```
## [1] "abNAd"
```

```r
str_c("a","b",NA,"d") #stringR consider NA as missing value, any opperations with NA will result in NA
```

```
## [1] NA
```

```r
### 2. In your own words, describe the difference between the sep and collapse arguments to str_c().
x <- c("a","b","c","d")
d <- c("1","2","3","4")

str_c(x,d, collapse=" ") ## one string
```

```
## [1] "a1 b2 c3 d4"
```

```r
length(str_c(x,d, collapse=" "))
```

```
## [1] 1
```

```r
str_c(x,d, sep=" ")
```

```
## [1] "a 1" "b 2" "c 3" "d 4"
```

```r
length(str_c(x,d, sep=" ")) ## multiple strings in vector
```

```
## [1] 4
```

```r
### 3. Use str_length() and str_sub() to extract the middle character from a string. What will you do if the string has an even number of characters?
a <- "abcde"
str_sub(a,str_length(a)/2 + 0.5,str_length(a)/2 + 0.5) <- ""
a
```

```
## [1] "abde"
```

```r
a <- "abcdef"
str_sub(a,str_length(a)/2,str_length(a)/2 + 1) <- ""
a
```

```
## [1] "abef"
```

```r
a <- "abcdef"
if(str_length(a) %% 2 == 0) {
  str_sub(a,str_length(a)/2,str_length(a)/2 + 1) <- ""
} else {
  str_sub(a,str_length(a)/2 + 0.5,str_length(a)/2 + 0.5) <- ""
}
a
```

```
## [1] "abef"
```

```r
### 4. What does str_wrap() do? When might you want to use it?

a <- str_c(
  "First Line ",
  "Second Line ",
  "Third Line ",
  "Last Line. "
)  
a
```

```
## [1] "First Line Second Line Third Line Last Line. "
```

```r
str_wrap(a, width = 10, indent = 0, exdent = 4)
```

```
## [1] "First Line\n    Second\n    Line Third\n    Line Last\n    Line."
```

```r
## You can use str_wrap() to modify existing whitespace in order to wrap a paragraph of text so that the length of each line as a similar as possible.

### 5. What does str_trim() do? What’s the opposite of str_trim()?
a
```

```
## [1] "First Line Second Line Third Line Last Line. "
```

```r
str_trim(a, side ="right")
```

```
## [1] "First Line Second Line Third Line Last Line."
```

```r
str_pad(a, width = 1, side="right")
```

```
## [1] "First Line Second Line Third Line Last Line. "
```

```r
### 6. Write a function that turns (e.g.) a vector c("a", "b", "c") into the string a, b, and c. Think carefully about what it should do if given a vector of length 0, 1, or 2.

x <- c("a","b","c")
str_c(x[1],", ",x[2],", and ",x[3])
```

```
## [1] "a, b, and c"
```

```r
### Regex One
## Lesson 1: abc

## Lesson 1½ : 1\d3

## Lesson 2: ...\.

## Lesson 3: [cmf]an

## Lesson 4: [^b]og

## Lesson 5: [A-C]..

## Lesson 6: z{2,3}

## Lesson 7: [a]+[b]*[c]+found\?

## Lesson 8: found\?

## Lesson 9: [1-3][.][ ]*[\t]*

## Lesson 10: ^Mission: successful$

## Lesson 11: (file_[.]+[_]*[.]+\.pdf) -> Wrong
## Lesson 11: (file_[\w]+\.pdf) -> wrong
## Lesson 11: ^(file_[\w]+) -> Correct!

## Lesson 12: [[JAM][\w][\w]]*[ ]*[0-9]+ -> Wrong!
## Lesson 12: ^^([[JAM][\w][\w]]*[ ]*([0-9]+)) -> Correct

##  Lesson 13: (\w{4})[x](\w{3,4})?
```

