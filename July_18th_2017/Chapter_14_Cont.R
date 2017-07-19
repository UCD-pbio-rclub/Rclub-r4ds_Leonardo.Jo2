library(tidyverse)
library(stringr)


## 14.3 Matching patterns with regular expressions

x <- c("apple", "banana", "pear")
str_view(x, "an")

str_view(x, ".a.")
dot <- "\\."
dot
writeLines(dot)

str_view(c("abc", "a.c", "bef"), "a\\.c")

x <- "a\\b"
writeLines(x)
str_view(x, "\\\\")


## 14.3.1.1 Exercises
## Explain why each of these strings don’t match a \: "\", "\\", "\\\"
a <- c("\\", "\\\\\\", "\\\\")
str_view(a,"\\\\")
a
writeLines(a)


## 14.3.2 Anchors

x <- c("apple", "banana", "pear")
str_view(x, "[na]{4}")

x <- c("apple pie", "apple", "apple cake")
str_view(x, "apple")

str_view(x, "^apple$")

## Exercise 14.3.2.1
## How would you match the literal string "$^$"?
a <- "$^$"
b <- c("$^$", "$^$.", "$^$..")
str_view(b, "\\$\\^\\$")
writeLines(a)

## Given the corpus of common words in stringr::words, create regular expressions that find all words that:
a <- stringr::words
##Start with “y”.
str_view(a, "^y", match = T)
##End with “x”
str_view(a, "x$", match = T)
str_view(a, "^y.+y$", match = T)
##Are exactly three letters long. (Don’t cheat by using str_length()!)
str_view(a, "^.{3}$", match = T)
##Have seven letters or more.
str_view(a, "^.{7}+", match = T)
##Since this list is long, you might want to use the match argument to str_view() to show only the matching or non-matching words.


## 14.3.3 Character classes and alternatives
str_view(c("grey", "gray"), "gr(e|a)y") ## | or

##  14.3.3.1 Exercises
## Create regular expressions to find all words that:
## Start with a vowel.
str_view(a, "^[aeiou]", match = T)
## That only contain consonants. (Hint: thinking about matching “not”-vowels.)
str_view(a, "^[^aeiou]+$", match = T)
## End with ed, but not with eed.
str_view(a, "ed+$", match = T)
str_view(a, "[^e]ed+$", match = T)
## End with ing or ise
str_view(a, "(ing$|ise$)", match = T)

## Empirically verify the rule “i before e except after c”.
a <- stringr::words
a
str_view(a, "[c][i]e", match = T)

## Is “q” always followed by a “u”?

str_view(a, "[q]+", match = T)
str_view(a, "[q][^u]+", match = T)

## Write a regular expression that matches a word if it’s probably written in British English, not American English.

## Create a regular expression that will match telephone numbers as commonly written in your country.       
a <- c("000-000-0000","000-0000-0000")
str_view(a, "[\\d]{3}-[\\d]{3}-[\\d]{4}")


## 14.3.4 Repetition

x <- "1888 is the longest year in Roman numerals: MDCCCLXXXVIII"
str_view(x, "CC?")
str_view(x, "CC+")
str_view(x, "CC*")
str_view(x, 'C[LX]+')
str_view(x, "C{2,3}")

str_view(x, 'C{2,3}?')

## 14.3.4.1 Exercises

## 1. Describe the equivalents of ?, +, * in {m,n} form.
str_view(x, "1?")
str_view(x, "1{0,1}")
str_view(x, "X+")
str_view(x, "X{1,10000}")
str_view(x, "1*")
str_view(x, "1{0,10000}")

## 2. Describe in words what these regular expressions match: (read carefully to see if I’m using a regular expression or a string that defines a regular expression.)

## ^.*$ ANY string that start with character and finishes as a character
str_view(x, "^.*$")

##  "\\{.+\\}"
a <- "{aa}bb"
str_view(a, "\\{.+\\}") ## \\ to specifiy that {} are characters

##\d{4}-\d{2}-\d{2}
b <- "1234-22-33"
str_view(b, "\\d{4}-\\d{2}-\\d{2}")

## "\\\\{4}"
c <- "\\\\\\\\\\\\\\\\"
str_view(c, "\\\\{4}")

## 3. Create regular expressions to find all words that:
a <- stringr::words

##Start with three consonants.
a %>%
  str_view("^[^aeiou]{3}", match = T)

##Have three or more vowels in a row.
a %>%
  str_view("[aeiou]{3}", match = T)

##Have two or more vowel-consonant pairs in a row.
a %>%
  str_view("([aeiou][^aeiou]){2,100}", match = T)

##Solve the beginner regexp crosswords at https://regexcrossword.com/challenges/beginner.


## 14.3.5 Grouping and backreferences

str_view(fruit, "(..)\\1", match = TRUE)


## 14.3.5.1 Exercises

## 1. Describe, in words, what these expressions will match:

##(.)\1\1 
a <- c("aaaaddddcccc","bb")
str_view(a, "(.)\\1\\1\\1")

## "(.)(.)\\2\\1"
str_view(a, "(.)(.)\\2\\1")
## (..)\1
## "(.).\\1.\\1"
## "(.)(.)(.).*\\3\\2\\1"

## Didn't really get this part

## Construct regular expressions to match words that:
a <- stringr::words
## Start and end with the same character.
str_view(a, "^(.).+(.)\\1$", match = T)
## Contain a repeated pair of letters (e.g. “church” contains “ch” repeated twice.)
str_view(a, "(..)", match = T)

## 14.4 Tools

x <- c("apple", "banana", "pear")
str_detect(x, "e")
#> [1]  TRUE FALSE  TRUE

# How many common words start with t?
##LOGIC ARGUMENTS in a numeric context, FALSE = 0 and TRUE = 0
sum(str_detect(words, "^t"))

# What proportion of common words end with a vowel?
mean(str_detect(words, "[aeiou]$"))
#> [1] 0.277

# Find all words containing at least one vowel, and negate
no_vowels_1 <- !str_detect(words, "[aeiou]")
# Find all words consisting only of consonants (non-vowels)
no_vowels_2 <- str_detect(words, "^[^aeiou]+$")
identical(no_vowels_1, no_vowels_2)

words[str_detect(words, "x$")]
#> [1] "box" "sex" "six" "tax"
str_subset(words, "x$")
#> [1] "box" "sex" "six" "tax"

df <- tibble(
  word = words, 
  i = seq_along(word)
)


df %>% 
  filter(str_detect(words, "x$")) ##filter find rows having specific values or string patterns

x <- c("apple", "banana", "pear")
str_count(x, "a")
#> [1] 1 3 1

# On average, how many vowels per word?
mean(str_count(words, "[aeiou]"))
#> [1] 1.99

df %>% 
  mutate(
    vowels = str_count(word, "[aeiou]"),
    consonants = str_count(word, "[^aeiou]")
  )

str_count("abababa", "aba")
#> [1] 2
str_view_all("abababa", "aba")

## 14.4.2 Exercises

## 1. For each of the following challenges, try solving it by using both a single regular expression, and a combination of multiple str_detect() calls.

## Find all words that start or end with x.
df %>% filter(str_detect(words, "x$")) # Four Words
df %>% filter(str_detect(words, "^x")) # Zero Words
df %>% filter(str_detect(words, "^(x)|(x)$")) 

## Find all words that start with a vowel and end with a consonant.
df %>% filter(str_detect(words, "^[aeiou].*[^aeiou]$"))

## Are there any words that contain at least one of each different vowel?
a <- df %>% filter(str_detect(words, "[a]+"))
e <- df %>% filter(str_detect(words, "[e]+"))
i <- df %>% filter(str_detect(words, "[i]+"))
o <- df %>% filter(str_detect(words, "[o]+"))
u <- df %>% filter(str_detect(words, "[u]+"))
merge(a,e, by ="word") %>%
  merge(i, by ="word") %>%
  merge(o, by ="word") %>%
  merge(u, by ="word")

## What word has the highest number of vowels? What word has the highest proportion of vowels? (Hint: what is the denominator?)
df2 <- df %>% 
  mutate(
    vowels = str_count(word, "[aeiou]"),
    letters = str_count(word, "[\\w]"),
    vowels.proportion = vowels/letters)

df2 %>%
  filter(vowels == max(vowels))

df2 %>%
  filter(vowels.proportion == max(vowels.proportion))



