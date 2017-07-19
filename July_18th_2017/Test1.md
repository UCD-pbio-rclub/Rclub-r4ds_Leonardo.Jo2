# Test1
Leonardo Jo  
July 19, 2017  


```r
library(stringr)
library(tidyr)

## 14.4 Tools

x <- c("apple", "banana", "pear")
str_detect(x, "e")
```

```
## [1]  TRUE FALSE  TRUE
```

```r
#> [1]  TRUE FALSE  TRUE

# How many common words start with t?
##LOGIC ARGUMENTS in a numeric context, FALSE = 0 and TRUE = 0
sum(str_detect(words, "^t"))
```

```
## [1] 65
```

```r
# What proportion of common words end with a vowel?
mean(str_detect(words, "[aeiou]$"))
```

```
## [1] 0.2765306
```

```r
#> [1] 0.277

# Find all words containing at least one vowel, and negate
no_vowels_1 <- !str_detect(words, "[aeiou]")
# Find all words consisting only of consonants (non-vowels)
no_vowels_2 <- str_detect(words, "^[^aeiou]+$")
identical(no_vowels_1, no_vowels_2)
```

```
## [1] TRUE
```

```r
words[str_detect(words, "x$")]
```

```
## [1] "box" "sex" "six" "tax"
```

```r
#> [1] "box" "sex" "six" "tax"
str_subset(words, "x$")
```

```
## [1] "box" "sex" "six" "tax"
```

```r
#> [1] "box" "sex" "six" "tax"

df <- tibble(
  word = words, 
  i = seq_along(word)
)
```

```
## Error in eval(expr, envir, enclos): could not find function "tibble"
```

```r
df %>% 
  filter(str_detect(words, "x$")) ##filter find rows having specific values or string patterns
```

```
## Error in ts(x): object is not a matrix
```

```r
x <- c("apple", "banana", "pear")
str_count(x, "a")
```

```
## [1] 1 3 1
```

```r
#> [1] 1 3 1

# On average, how many vowels per word?
mean(str_count(words, "[aeiou]"))
```

```
## [1] 1.991837
```

```r
#> [1] 1.99

df %>% 
  mutate(
    vowels = str_count(word, "[aeiou]"),
    consonants = str_count(word, "[^aeiou]")
  )
```

```
## Error in function_list[[k]](value): could not find function "mutate"
```

```r
str_count("abababa", "aba")
```

```
## [1] 2
```

```r
#> [1] 2
str_view_all("abababa", "aba")
```

<!--html_preserve--><div id="htmlwidget-e11dd4403f1bd38569e4" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-e11dd4403f1bd38569e4">{"x":{"html":"<ul>\n  <li><span class='match'>aba\u003c/span>b<span class='match'>aba\u003c/span>\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
## 14.4.2 Exercises

## 1. For each of the following challenges, try solving it by using both a single regular expression, and a combination of multiple str_detect() calls.

## Find all words that start or end with x.
df %>% filter(str_detect(words, "x$")) # Four Words
```

```
## Error in ts(x): object is not a matrix
```

```r
df %>% filter(str_detect(words, "^x")) # Zero Words
```

```
## Error in ts(x): object is not a matrix
```

```r
df %>% filter(str_detect(words, "^(x)|(x)$")) 
```

```
## Error in ts(x): object is not a matrix
```

```r
## Find all words that start with a vowel and end with a consonant.
df %>% filter(str_detect(words, "^[aeiou].*[^aeiou]$"))
```

```
## Error in ts(x): object is not a matrix
```

```r
## Are there any words that contain at least one of each different vowel?
a <- df %>% filter(str_detect(words, "[a]+"))
```

```
## Error in ts(x): object is not a matrix
```

```r
e <- df %>% filter(str_detect(words, "[e]+"))
```

```
## Error in ts(x): object is not a matrix
```

```r
i <- df %>% filter(str_detect(words, "[i]+"))
```

```
## Error in ts(x): object is not a matrix
```

```r
o <- df %>% filter(str_detect(words, "[o]+"))
```

```
## Error in ts(x): object is not a matrix
```

```r
u <- df %>% filter(str_detect(words, "[u]+"))
```

```
## Error in ts(x): object is not a matrix
```

```r
merge(a,e, by ="word") %>%
  merge(i, by ="word") %>%
  merge(o, by ="word") %>%
  merge(u, by ="word")
```

```
## Error in merge(a, e, by = "word"): object 'a' not found
```

```r
## What word has the highest number of vowels? What word has the highest proportion of vowels? (Hint: what is the denominator?)
df2 <- df %>% 
  mutate(
    vowels = str_count(word, "[aeiou]"),
    letters = str_count(word, "[\\w]"),
    vowels.proportion = vowels/letters)
```

```
## Error in function_list[[k]](value): could not find function "mutate"
```

```r
df2 %>%
  filter(vowels == max(vowels))
```

```
## Error in eval(expr, envir, enclos): object 'df2' not found
```

```r
df2 %>%
  filter(vowels.proportion == max(vowels.proportion))
```

```
## Error in eval(expr, envir, enclos): object 'df2' not found
```

```r
## 14.4.3 Extract matches
length(sentences)
```

```
## [1] 720
```

```r
head(sentences)
```

```
## [1] "The birch canoe slid on the smooth planks." 
## [2] "Glue the sheet to the dark blue background."
## [3] "It's easy to tell the depth of a well."     
## [4] "These days a chicken leg is a rare dish."   
## [5] "Rice is often served in round bowls."       
## [6] "The juice of lemons makes fine punch."
```

```r
## Identifying every sentence that contains a collor
colours <- c("red", "orange", "yellow", "green", "blue", "purple")
colour_match <- str_c(colours, collapse = "|")
colour_match
```

```
## [1] "red|orange|yellow|green|blue|purple"
```

```r
has_colour <- str_subset(sentences, colour_match)
head(has_colour)
```

```
## [1] "Glue the sheet to the dark blue background."
## [2] "Two blue fish swam in the tank."            
## [3] "The colt reared and threw the tall rider."  
## [4] "The wide road shimmered in the hot sun."    
## [5] "See the cat glaring at the scared mouse."   
## [6] "A wisp of cloud hung in the blue air."
```

```r
matches <- str_extract(has_colour, colour_match)
head(matches)
```

```
## [1] "blue" "blue" "red"  "red"  "red"  "blue"
```

```r
more <- sentences[str_count(sentences, colour_match) > 1]
str_count(sentences, colour_match)
```

```
##   [1] 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0
##  [36] 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
##  [71] 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0
## [106] 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
## [141] 0 0 0 0 0 1 0 1 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1
## [176] 0 1 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0
## [211] 0 0 0 0 1 0 2 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
## [246] 0 1 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 1 0
## [281] 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0
## [316] 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0
## [351] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0
## [386] 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
## [421] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0
## [456] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0
## [491] 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0
## [526] 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0
## [561] 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 2 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0
## [596] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
## [631] 1 0 0 0 0 0 0 0 0 0 0 1 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
## [666] 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0
## [701] 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
```

```r
str_view_all(more, colour_match)
```

<!--html_preserve--><div id="htmlwidget-1dcfcb288947c001959a" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-1dcfcb288947c001959a">{"x":{"html":"<ul>\n  <li>It is hard to erase <span class='match'>blue\u003c/span> or <span class='match'>red\u003c/span> ink.\u003c/li>\n  <li>The <span class='match'>green\u003c/span> light in the brown box flicke<span class='match'>red\u003c/span>.\u003c/li>\n  <li>The sky in the west is tinged with <span class='match'>orange\u003c/span> <span class='match'>red\u003c/span>.\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
str_view(more, colour_match) ## Differences?
```

<!--html_preserve--><div id="htmlwidget-370e658f80faf4c327ba" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-370e658f80faf4c327ba">{"x":{"html":"<ul>\n  <li>It is hard to erase <span class='match'>blue\u003c/span> or red ink.\u003c/li>\n  <li>The <span class='match'>green\u003c/span> light in the brown box flickered.\u003c/li>\n  <li>The sky in the west is tinged with <span class='match'>orange\u003c/span> red.\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
str_extract(more, colour_match)
```

```
## [1] "blue"   "green"  "orange"
```

```r
str_extract_all(more, colour_match)
```

```
## [[1]]
## [1] "blue" "red" 
## 
## [[2]]
## [1] "green" "red"  
## 
## [[3]]
## [1] "orange" "red"
```

```r
str_extract_all(more, colour_match, simplify = T)
```

```
##      [,1]     [,2] 
## [1,] "blue"   "red"
## [2,] "green"  "red"
## [3,] "orange" "red"
```

```r
x <- c("a", "a b", "a b c", "d")
str_extract_all(x, "[a-z]", simplify = TRUE)
```

```
##      [,1] [,2] [,3]
## [1,] "a"  ""   ""  
## [2,] "a"  "b"  ""  
## [3,] "a"  "b"  "c" 
## [4,] "d"  ""   ""
```

```r
## 14.4.3.1 Exercises

## 1. In the previous example, you might have noticed that the regular expression matched “flickered”, which is not a colour. Modify the regex to fix the problem.
## adding spaces before each color
colours <- c(" red", " orange", " yellow", " green", " blue", " purple")
colour_match <- str_c(colours, collapse = "|")
more <- sentences[str_count(sentences, colour_match) > 1]
more
```

```
## [1] "It is hard to erase blue or red ink."          
## [2] "The sky in the west is tinged with orange red."
```

```r
##From the Harvard sentences data, extract:
  
##The first word from each sentence.
first.word <- sentences %>%
  str_extract("^[\\w]+")
first.word
```

```
##   [1] "The"        "Glue"       "It"         "These"      "Rice"      
##   [6] "The"        "The"        "The"        "Four"       "Large"     
##  [11] "The"        "A"          "The"        "Kick"       "Help"      
##  [16] "A"          "Smoky"      "The"        "The"        "The"       
##  [21] "The"        "The"        "Press"      "The"        "The"       
##  [26] "Two"        "Her"        "The"        "It"         "Read"      
##  [31] "Hoist"      "Take"       "Note"       "Wipe"       "Mend"      
##  [36] "The"        "The"        "The"        "The"        "What"      
##  [41] "A"          "The"        "Sickness"   "The"        "The"       
##  [46] "Lift"       "The"        "Hop"        "The"        "Mesh"      
##  [51] "The"        "The"        "Adding"     "The"        "A"         
##  [56] "The"        "March"      "A"          "Place"      "Both"      
##  [61] "We"         "Use"        "He"         "The"        "A"         
##  [66] "Cars"       "The"        "This"       "The"        "Those"     
##  [71] "A"          "The"        "The"        "The"        "The"       
##  [76] "A"          "The"        "The"        "The"        "The"       
##  [81] "The"        "See"        "There"      "The"        "The"       
##  [86] "The"        "Cut"        "Men"        "Always"     "He"        
##  [91] "The"        "A"          "A"          "The"        "The"       
##  [96] "Bail"       "The"        "A"          "Ten"        "The"       
## [101] "Oak"        "Cats"       "The"        "Open"       "Add"       
## [106] "Thieves"    "The"        "Act"        "The"        "Move"      
## [111] "The"        "Leaves"     "The"        "Split"      "Burn"      
## [116] "He"         "Weave"      "Hemp"       "A"          "We"        
## [121] "Type"       "The"        "The"        "The"        "Paste"     
## [126] "The"        "It"         "The"        "Feel"       "The"       
## [131] "A"          "He"         "Pluck"      "Two"        "The"       
## [136] "Bring"      "Write"      "Clothes"    "We"         "Port"      
## [141] "The"        "Guess"      "A"          "The"        "These"     
## [146] "Pure"       "The"        "The"        "Mud"        "The"       
## [151] "The"        "A"          "He"         "The"        "The"       
## [156] "The"        "The"        "We"         "She"        "The"       
## [161] "The"        "At"         "Drop"       "A"          "An"        
## [166] "Wood"       "The"        "He"         "A"          "A"         
## [171] "Steam"      "The"        "There"      "The"        "Torn"      
## [176] "Sunday"     "The"        "The"        "They"       "Add"       
## [181] "Acid"       "Fairy"      "Eight"      "The"        "A"         
## [186] "Add"        "We"         "There"      "He"         "She"       
## [191] "The"        "Corn"       "Where"      "The"        "Sell"      
## [196] "The"        "The"        "Bring"      "They"       "Farmers"   
## [201] "The"        "The"        "Float"      "A"          "A"         
## [206] "The"        "After"      "The"        "He"         "Even"      
## [211] "The"        "The"        "The"        "Do"         "Lire"      
## [216] "The"        "It"         "Write"      "The"        "The"       
## [221] "A"          "Coax"       "Schools"    "The"        "They"      
## [226] "The"        "The"        "Jazz"       "Rake"       "Slash"     
## [231] "Try"        "They"       "He"         "They"       "The"       
## [236] "Whitings"   "Some"       "Jerk"       "A"          "Madam"     
## [241] "On"         "The"        "This"       "Add"        "The"       
## [246] "The"        "The"        "To"         "The"        "Jump"      
## [251] "Yell"       "They"       "Both"       "In"         "The"       
## [256] "The"        "Ducks"      "Fruit"      "These"      "Canned"    
## [261] "The"        "Carry"      "The"        "We"         "Gray"      
## [266] "The"        "High"       "Tea"        "A"          "A"         
## [271] "The"        "Find"       "Cut"        "The"        "Look"      
## [276] "The"        "Nine"       "The"        "The"        "Soak"      
## [281] "The"        "A"          "All"        "ii"         "To"        
## [286] "Shape"      "The"        "Hedge"      "Quench"     "Tight"     
## [291] "The"        "The"        "The"        "Watch"      "The"       
## [296] "The"        "Write"      "His"        "The"        "Tin"       
## [301] "Slide"      "The"        "The"        "Pink"       "She"       
## [306] "The"        "It"         "Let"        "The"        "The"       
## [311] "The"        "The"        "The"        "Paper"      "The"       
## [316] "The"        "Screw"      "Time"       "The"        "Men"       
## [321] "Fill"       "He"         "We"         "Pack"       "The"       
## [326] "The"        "Boards"     "The"        "Glass"      "Bathe"     
## [331] "Nine"       "The"        "The"        "The"        "Pages"     
## [336] "Try"        "Women"      "The"        "A"          "Code"      
## [341] "Most"       "He"         "The"        "Mince"      "The"       
## [346] "Let"        "A"          "A"          "Tack"       "Next"      
## [351] "Pour"       "Each"       "The"        "The"        "The"       
## [356] "Just"       "A"          "Our"        "Brass"      "It"        
## [361] "Feed"       "The"        "He"         "The"        "Plead"     
## [366] "Better"     "This"       "The"        "He"         "Tend"      
## [371] "It"         "Mark"       "Take"       "The"        "North"     
## [376] "He"         "Go"         "A"          "Soap"       "That"      
## [381] "He"         "A"          "Grape"      "Roads"      "Fake"      
## [386] "The"        "Smoke"      "Serve"      "Much"       "The"       
## [391] "Heave"      "A"          "It"         "His"        "The"       
## [396] "The"        "It"         "Beef"       "Raise"      "The"       
## [401] "A"          "Jerk"       "No"         "We"         "The"       
## [406] "The"        "Three"      "The"        "No"         "Grace"     
## [411] "Nudge"      "The"        "Once"       "A"          "Fasten"    
## [416] "A"          "He"         "The"        "The"        "There"     
## [421] "Seed"       "Draw"       "The"        "The"        "Hats"      
## [426] "The"        "Beat"       "Say"        "The"        "Screen"    
## [431] "This"       "The"        "He"         "These"      "The"       
## [436] "Twist"      "The"        "The"        "Xew"        "The"       
## [441] "They"       "The"        "A"          "Breakfast"  "Bottles"   
## [446] "The"        "He"         "Drop"       "The"        "Throw"     
## [451] "A"          "The"        "The"        "The"        "The"       
## [456] "Turn"       "The"        "The"        "To"         "The"       
## [461] "The"        "Dispense"   "The"        "He"         "The"       
## [466] "The"        "Fly"        "Thick"      "Birth"      "The"       
## [471] "The"        "A"          "The"        "We"         "The"       
## [476] "The"        "We"         "The"        "Five"       "A"         
## [481] "The"        "Shut"       "The"        "Crack"      "He"        
## [486] "Send"       "A"          "They"       "The"        "In"        
## [491] "A"          "Oats"       "Their"      "The"        "There"     
## [496] "Tuck"       "A"          "We"         "The"        "Take"      
## [501] "Shake"      "She"        "The"        "The"        "We"        
## [506] "Smile"      "A"          "The"        "Take"       "That"      
## [511] "The"        "The"        "Ripe"       "A"          "The"       
## [516] "The"        "The"        "This"       "She"        "The"       
## [521] "Press"      "Neat"       "The"        "The"        "The"       
## [526] "Shake"      "The"        "A"          "His"        "Flax"      
## [531] "Hurdle"     "A"          "Even"       "Peep"       "The"       
## [536] "Cheap"      "A"          "Flood"      "A"          "The"       
## [541] "Those"      "He"         "Dill"       "Down"       "Either"    
## [546] "The"        "If"         "At"         "Read"       "Fill"      
## [551] "The"        "Clams"      "The"        "The"        "Breathe"   
## [556] "It"         "A"          "A"          "A"          "A"         
## [561] "Paint"      "The"        "Bribes"     "Trample"    "The"       
## [566] "A"          "Footprints" "She"        "A"          "Prod"      
## [571] "It"         "The"        "It"         "The"        "Wake"      
## [576] "The"        "The"        "The"        "Hold"       "Next"      
## [581] "Every"      "He"         "They"       "Drive"      "Keep"      
## [586] "Sever"      "Paper"      "Slide"      "Help"       "A"         
## [591] "Stop"       "Jerk"       "Slidc"      "The"        "Light"     
## [596] "Set"        "Dull"       "A"          "Get"        "Choose"    
## [601] "A"          "He"         "There"      "The"        "Greet"     
## [606] "When"       "Sweet"      "A"          "A"          "Lush"      
## [611] "The"        "The"        "The"        "Sit"        "A"         
## [616] "The"        "Green"      "Tea"        "Pitch"      "The"       
## [621] "The"        "The"        "A"          "The"        "She"       
## [626] "The"        "Loop"       "Plead"      "Calves"     "Post"      
## [631] "Tear"       "A"          "A"          "It"         "Crouch"    
## [636] "Pack"       "The"        "Fine"       "Poached"    "Bad"       
## [641] "Ship"       "Dimes"      "They"       "The"        "The"       
## [646] "The"        "The"        "Pile"       "The"        "The"       
## [651] "The"        "The"        "A"          "The"        "The"       
## [656] "To"         "There"      "Cod"        "The"        "Dunk"      
## [661] "Hang"       "Cap"        "The"        "Be"         "Pick"      
## [666] "A"          "The"        "The"        "The"        "You"       
## [671] "Dots"       "Put"        "The"        "The"        "See"       
## [676] "Slide"      "Many"       "We"         "No"         "Dig"       
## [681] "The"        "A"          "Green"      "A"          "The"       
## [686] "A"          "The"        "The"        "Seven"      "Our"       
## [691] "The"        "It"         "One"        "Take"       "The"       
## [696] "The"        "The"        "Stop"       "The"        "The"       
## [701] "Open"       "Fish"       "Dip"        "Will"       "The"       
## [706] "The"        "The"        "He"         "Leave"      "The"       
## [711] "A"          "The"        "She"        "A"          "Small"     
## [716] "The"        "The"        "A"          "She"        "When"
```

```r
##All words ending in ing.

ing <- sentences[str_count(sentences, "[\\w]+ing") >= 1]
ing %>%
  str_extract_all("[\\w]+ing", simplify = T)
```

```
##       [,1]       
##  [1,] "stocking" 
##  [2,] "spring"   
##  [3,] "evening"  
##  [4,] "morning"  
##  [5,] "winding"  
##  [6,] "living"   
##  [7,] "king"     
##  [8,] "Adding"   
##  [9,] "making"   
## [10,] "raging"   
## [11,] "playing"  
## [12,] "sleeping" 
## [13,] "ring"     
## [14,] "glaring"  
## [15,] "sinking"  
## [16,] "thing"    
## [17,] "dying"    
## [18,] "Bring"    
## [19,] "lodging"  
## [20,] "filing"   
## [21,] "making"   
## [22,] "morning"  
## [23,] "wearing"  
## [24,] "Bring"    
## [25,] "wading"   
## [26,] "swing"    
## [27,] "nothing"  
## [28,] "Whiting"  
## [29,] "ring"     
## [30,] "ring"     
## [31,] "morning"  
## [32,] "sing"     
## [33,] "sleeping" 
## [34,] "bring"    
## [35,] "painting" 
## [36,] "king"     
## [37,] "ring"     
## [38,] "walking"  
## [39,] "bring"    
## [40,] "ling"     
## [41,] "bring"    
## [42,] "shipping" 
## [43,] "spring"   
## [44,] "ring"     
## [45,] "winding"  
## [46,] "hing"     
## [47,] "puzzling" 
## [48,] "spring"   
## [49,] "thing"    
## [50,] "landing"  
## [51,] "thing"    
## [52,] "waiting"  
## [53,] "ring"     
## [54,] "whistling"
## [55,] "nothing"  
## [56,] "timing"   
## [57,] "thing"    
## [58,] "spring"   
## [59,] "ting"     
## [60,] "changing" 
## [61,] "drenching"
## [62,] "moving"   
## [63,] "working"  
## [64,] "ring"
```

```r
sentences %>%
  str_subset("[\\w]+ing") %>%
  str_extract_all("[\\w]+ing", simplify = T)
```

```
##       [,1]       
##  [1,] "stocking" 
##  [2,] "spring"   
##  [3,] "evening"  
##  [4,] "morning"  
##  [5,] "winding"  
##  [6,] "living"   
##  [7,] "king"     
##  [8,] "Adding"   
##  [9,] "making"   
## [10,] "raging"   
## [11,] "playing"  
## [12,] "sleeping" 
## [13,] "ring"     
## [14,] "glaring"  
## [15,] "sinking"  
## [16,] "thing"    
## [17,] "dying"    
## [18,] "Bring"    
## [19,] "lodging"  
## [20,] "filing"   
## [21,] "making"   
## [22,] "morning"  
## [23,] "wearing"  
## [24,] "Bring"    
## [25,] "wading"   
## [26,] "swing"    
## [27,] "nothing"  
## [28,] "Whiting"  
## [29,] "ring"     
## [30,] "ring"     
## [31,] "morning"  
## [32,] "sing"     
## [33,] "sleeping" 
## [34,] "bring"    
## [35,] "painting" 
## [36,] "king"     
## [37,] "ring"     
## [38,] "walking"  
## [39,] "bring"    
## [40,] "ling"     
## [41,] "bring"    
## [42,] "shipping" 
## [43,] "spring"   
## [44,] "ring"     
## [45,] "winding"  
## [46,] "hing"     
## [47,] "puzzling" 
## [48,] "spring"   
## [49,] "thing"    
## [50,] "landing"  
## [51,] "thing"    
## [52,] "waiting"  
## [53,] "ring"     
## [54,] "whistling"
## [55,] "nothing"  
## [56,] "timing"   
## [57,] "thing"    
## [58,] "spring"   
## [59,] "ting"     
## [60,] "changing" 
## [61,] "drenching"
## [62,] "moving"   
## [63,] "working"  
## [64,] "ring"
```

```r
##All plurals.
plural <- sentences[str_count(sentences, "[\\w]+s[ ]|[\\w]+s[\\.]") >= 1]
plural %>%
  str_extract_all("[\\w]+s[ ]|[\\w]+s[\\.]", simplify = T)
```

```
##        [,1]          [,2]        [,3]       [,4]      
##   [1,] "planks."     ""          ""         ""        
##   [2,] "days "       "is "       ""         ""        
##   [3,] "is "         "bowls."    ""         ""        
##   [4,] "lemons "     "makes "    ""         ""        
##   [5,] "was "        ""          ""         ""        
##   [6,] "hogs "       ""          ""         ""        
##   [7,] "hours "      "us."       ""         ""        
##   [8,] "stockings "  "is "       ""         ""        
##   [9,] "was "        ""          ""         ""        
##  [10,] "is "         ""          ""         ""        
##  [11,] "is "         ""          ""         ""        
##  [12,] "helps "      "pass "     ""         ""        
##  [13,] "fires "      ""          ""         ""        
##  [14,] "across "     ""          ""         ""        
##  [15,] "bonds."      ""          ""         ""        
##  [16,] "Press "      "pants "    ""         ""        
##  [17,] "was "        ""          ""         ""        
##  [18,] "was "        "useless "  ""         ""        
##  [19,] "gas "        ""          ""         ""        
##  [20,] "his "        ""          ""         ""        
##  [21,] "was "        ""          ""         ""        
##  [22,] "kittens."    ""          ""         ""        
##  [23,] "was "        ""          ""         ""        
##  [24,] "is "         ""          ""         ""        
##  [25,] "days."       ""          ""         ""        
##  [26,] "was "        ""          ""         ""        
##  [27,] "Sickness "   ""          ""         ""        
##  [28,] "grass."      ""          ""         ""        
##  [29,] "books "      ""          ""         ""        
##  [30,] "keeps "      "chicks "   ""         ""        
##  [31,] "leads "      "sums."     ""         ""        
##  [32,] "was "        ""          ""         ""        
##  [33,] "is "         "boards."   ""         ""        
##  [34,] "wheels."     ""          ""         ""        
##  [35,] "soldiers "   ""          ""         ""        
##  [36,] "makes "      ""          ""         ""        
##  [37,] "steps."      ""          ""         ""        
##  [38,] "lives "      ""          ""         ""        
##  [39,] "circus."     ""          ""         ""        
##  [40,] "across "     ""          ""         ""        
##  [41,] "Cars "       "busses "   "drifts."  ""        
##  [42,] "This "       "is "       "hikes "   ""        
##  [43,] "words "      ""          ""         ""        
##  [44,] "was "        ""          ""         ""        
##  [45,] "weeks."      ""          ""         ""        
##  [46,] "makes "      ""          ""         ""        
##  [47,] "strokes."    ""          ""         ""        
##  [48,] "was "        ""          ""         ""        
##  [49,] "was "        "slices."   ""         ""        
##  [50,] "factors "    ""          ""         ""        
##  [51,] "was "        ""          ""         ""        
##  [52,] "his "        ""          ""         ""        
##  [53,] "grass "      ""          ""         ""        
##  [54,] "parts."      ""          ""         ""        
##  [55,] "Always "     ""          ""         ""        
##  [56,] "costs "      "eggs."     ""         ""        
##  [57,] "was "        ""          ""         ""        
##  [58,] "seems "      ""          ""         ""        
##  [59,] "is "         "gifts."    ""         ""        
##  [60,] "pins "       ""          ""         ""        
##  [61,] "as "         ""          ""         ""        
##  [62,] "is "         "gives "    ""         ""        
##  [63,] "Cats "       "dogs "     ""         ""        
##  [64,] "glass."      ""          ""         ""        
##  [65,] "Thieves "    "friends "  ""         ""        
##  [66,] "improves "   ""          ""         ""        
##  [67,] "orders "     ""          ""         ""        
##  [68,] "was "        ""          ""         ""        
##  [69,] "Leaves "     ""          ""         ""        
##  [70,] "logs "       ""          ""         ""        
##  [71,] "is "         "parts "    "tropics." ""        
##  [72,] "his "        ""          ""         ""        
##  [73,] "things."     ""          ""         ""        
##  [74,] "lists "      "orders."   ""         ""        
##  [75,] "less "       ""          ""         ""        
##  [76,] "boss "       ""          ""         ""        
##  [77,] "its "        "contents." ""         ""        
##  [78,] "brass."      ""          ""         ""        
##  [79,] "is "         ""          ""         ""        
##  [80,] "its "        ""          ""         ""        
##  [81,] "is "         ""          ""         ""        
##  [82,] "times."      ""          ""         ""        
##  [83,] "leaves."     ""          ""         ""        
##  [84,] "plus "       "is "       "less "    ""        
##  [85,] "eyes "       ""          ""         ""        
##  [86,] "problems "   ""          ""         ""        
##  [87,] "Clothes "    ""          ""         ""        
##  [88,] "events "     ""          ""         ""        
##  [89,] "is "         ""          ""         ""        
##  [90,] "Guess "      "results "  "scores."  ""        
##  [91,] "tastes "     ""          ""         ""        
##  [92,] "thistles "   ""          ""         ""        
##  [93,] "poodles "    "curls."    ""         ""        
##  [94,] "was "        ""          ""         ""        
##  [95,] "was "        "his "      ""         ""        
##  [96,] "this "       ""          ""         ""        
##  [97,] "is "         ""          ""         ""        
##  [98,] "stories "    "is "       ""         ""        
##  [99,] "pencils "    ""          ""         ""        
## [100,] "pirates "    ""          ""         ""        
## [101,] "is "         ""          ""         ""        
## [102,] "is "         ""          ""         ""        
## [103,] "figures."    ""          ""         ""        
## [104,] "is "         ""          ""         ""        
## [105,] "does "       ""          ""         ""        
## [106,] "is "         "toys "     "blocks."  ""        
## [107,] "was "        ""          ""         ""        
## [108,] "actress."    ""          ""         ""        
## [109,] "pipes."      ""          ""         ""        
## [110,] "was "        "leaves "   ""         ""        
## [111,] "was "        ""          ""         ""        
## [112,] "scraps "     ""          ""         ""        
## [113,] "is "         ""          ""         ""        
## [114,] "pills."      ""          ""         ""        
## [115,] "was "        ""          ""         ""        
## [116,] "burns "      "holes "    ""         ""        
## [117,] "tales "      ""          ""         ""        
## [118,] "miles "      ""          ""         ""        
## [119,] "was "        "players."  ""         ""        
## [120,] "is "         "inches."   ""         ""        
## [121,] "has "        "clothes."  ""         ""        
## [122,] "is "         ""          ""         ""        
## [123,] "cobs "       ""          ""         ""        
## [124,] "is "         "tacks."    ""         ""        
## [125,] "tongs "      ""          ""         ""        
## [126,] "petals "     ""          ""         ""        
## [127,] "compass "    "class."    ""         ""        
## [128,] "Farmers "    ""          ""         ""        
## [129,] "was "        ""          ""         ""        
## [130,] "is "         ""          ""         ""        
## [131,] "is "         ""          ""         ""        
## [132,] "wonders."    ""          ""         ""        
## [133,] "hostess "    ""          ""         ""        
## [134,] "his "        ""          ""         ""        
## [135,] "his "        ""          ""         ""        
## [136,] "loss "       "was "      ""         ""        
## [137,] "its "        ""          ""         ""        
## [138,] "wires "      ""          ""         ""        
## [139,] "taps."       ""          ""         ""        
## [140,] "is "         ""          ""         ""        
## [141,] "was "        "brass."    ""         ""        
## [142,] "writes "     ""          ""         ""        
## [143,] "Schools "    "ladies "   ""         ""        
## [144,] "was "        ""          ""         ""        
## [145,] "fans "       ""          ""         ""        
## [146,] "ribbons."    ""          ""         ""        
## [147,] "his "        "ties "     "groups "  "friends."
## [148,] "backs."      ""          ""         ""        
## [149,] "Whitings "   "nets."     ""         ""        
## [150,] "ads "        "buyers."   ""         ""        
## [151,] "rings "      ""          ""         ""        
## [152,] "makes "      "us "       ""         ""        
## [153,] "this "       "is "       ""         ""        
## [154,] "islands "    "is "       ""         ""        
## [155,] "as "         "as "       ""         ""        
## [156,] "This "       ""          ""         ""        
## [157,] "funds "      "its "      ""         ""        
## [158,] "is "         ""          ""         ""        
## [159,] "gets "       ""          ""         ""        
## [160,] "as "         "slides "   ""         ""        
## [161,] "brothers "   ""          ""         ""        
## [162,] "his "        ""          ""         ""        
## [163,] "houses "     "bricks."   ""         ""        
## [164,] "Ducks "      "compass."  ""         ""        
## [165,] "flavors "    "drinks."   ""         ""        
## [166,] "pills "      "less "     "others."  ""        
## [167,] "pears "      ""          ""         ""        
## [168,] "is "         ""          ""         ""        
## [169,] "miles "      ""          ""         ""        
## [170,] "seats "      "fans."     ""         ""        
## [171,] "is "         ""          ""         ""        
## [172,] "spoils "     ""          ""         ""        
## [173,] "is "         "cross "    ""         ""        
## [174,] "binds "      ""          ""         ""        
## [175,] "ruins."      ""          ""         ""        
## [176,] "shelves "    "crackers." ""         ""        
## [177,] "is "         ""          ""         ""        
## [178,] "his "        "eyes."     ""         ""        
## [179,] "needs "      ""          ""         ""        
## [180,] "is "         ""          ""         ""        
## [181,] "apples "     "hands "    ""         ""        
## [182,] "crackers."   ""          ""         ""        
## [183,] "curls "      "days."     ""         ""        
## [184,] "tones "      ""          ""         ""        
## [185,] "fits "       ""          ""         ""        
## [186,] "was "        ""          ""         ""        
## [187,] "leaves "     "was "      ""         ""        
## [188,] "His "        "was "      "was "     ""        
## [189,] "was "        "hops."     ""         ""        
## [190,] "cans "       "shelves."  ""         ""        
## [191,] "clouds "     ""          ""         ""        
## [192,] "was "        "useless."  ""         ""        
## [193,] "is "         ""          ""         ""        
## [194,] "as "         "chorus."   ""         ""        
## [195,] "minutes."    ""          ""         ""        
## [196,] "walls "      "frocks."   ""         ""        
## [197,] "discuss "    "plans."    ""         ""        
## [198,] "takes "      ""          ""         ""        
## [199,] "is "         ""          ""         ""        
## [200,] "was "        "brass."    ""         ""        
## [201,] "as "         "as "       ""         ""        
## [202,] "brings "     "us "       "changes." ""        
## [203,] "was "        "years "    ""         ""        
## [204,] "sometimes "  ""          ""         ""        
## [205,] "contents."   ""          ""         ""        
## [206,] "mules "      ""          ""         ""        
## [207,] "records "    ""          ""         ""        
## [208,] "was "        ""          ""         ""        
## [209,] "rays."       ""          ""         ""        
## [210,] "Boards "     "unless "   ""         ""        
## [211,] "Glass "      ""          ""         ""        
## [212,] "grass."      ""          ""         ""        
## [213,] "rows "       "soldiers " ""         ""        
## [214,] "is "         ""          ""         ""        
## [215,] "is "         "edges "    ""         ""        
## [216,] "Pages "      ""          ""         ""        
## [217,] "lines "      ""          ""         ""        
## [218,] "less "       ""          ""         ""        
## [219,] "zones "      ""          ""         ""        
## [220,] "needs "      ""          ""         ""        
## [221,] "is "         "secrets "  ""         ""        
## [222,] "is "         "us "       ""         ""        
## [223,] "brass "      "objects."  ""         ""        
## [224,] "is "         ""          ""         ""        
## [225,] "gives "      "us "       ""         ""        
## [226,] "fails "      ""          ""         ""        
## [227,] "us."         ""          ""         ""        
## [228,] "woods "      "sticks."   ""         ""        
## [229,] "piles "      "lines "    ""         ""        
## [230,] "logs "       ""          ""         ""        
## [231,] "is "         ""          ""         ""        
## [232,] "plans "      ""          ""         ""        
## [233,] "Brass "      "rings "    "natives." ""        
## [234,] "takes "      ""          ""         ""        
## [235,] "seeds."      ""          ""         ""        
## [236,] "is "         ""          ""         ""        
## [237,] "This "       "was "      ""         ""        
## [238,] "wanders."    ""          ""         ""        
## [239,] "takes "      ""          ""         ""        
## [240,] "shares "     "as "       ""         ""        
## [241,] "cats "       "goes "     "names."   ""        
## [242,] "winds "      "colds "    "fevers."  ""        
## [243,] "asks "       ""          ""         ""        
## [244,] "dress."      ""          ""         ""        
## [245,] "means "      "is "       ""         ""        
## [246,] "items."      ""          ""         ""        
## [247,] "Roads "      ""          ""         ""        
## [248,] "ones "       ""          ""         ""        
## [249,] "heroes."     ""          ""         ""        
## [250,] "makes "      ""          ""         ""        
## [251,] "cuts "       "trims "    ""         ""        
## [252,] "ways."       ""          ""         ""        
## [253,] "His "        ""          ""         ""        
## [254,] "lingers."    ""          ""         ""        
## [255,] "was "        ""          ""         ""        
## [256,] "takes "      ""          ""         ""        
## [257,] "is "         ""          ""         ""        
## [258,] "costs "      "cents "    "Mondays." ""        
## [259,] "is "         "peas "     "always "  ""        
## [260,] "names "      "is "       ""         ""        
## [261,] "is "         ""          ""         ""        
## [262,] "makes "      ""          ""         ""        
## [263,] "news "       "restless " "minds."   ""        
## [264,] "pins "       ""          ""         ""        
## [265,] "restores "   ""          ""         ""        
## [266,] "takes "      ""          ""         ""        
## [267,] "drifts "     ""          ""         ""        
## [268,] "was "        ""          ""         ""        
## [269,] "is "         ""          ""         ""        
## [270,] "is "         ""          ""         ""        
## [271,] "lines."      ""          ""         ""        
## [272,] "his "        "cents."    ""         ""        
## [273,] "was "        ""          ""         ""        
## [274,] "Hats "       ""          ""         ""        
## [275,] "robins."     ""          ""         ""        
## [276,] "mats."       ""          ""         ""        
## [277,] "This "       "his "      ""         ""        
## [278,] "protects "   ""          ""         ""        
## [279,] "coins "      "his "      ""         ""        
## [280,] "rags "       "itches "   ""         ""        
## [281,] "pants "      "cuffs "    "pockets." ""        
## [282,] "lasts "      "days."     ""         ""        
## [283,] "buns "       ""          ""         ""        
## [284,] "Bottles "    "kinds "    ""         ""        
## [285,] "his "        ""          ""         ""        
## [286,] "ashes "      ""          ""         ""        
## [287,] "chairs "     ""          ""         ""        
## [288,] "means "      ""          ""         ""        
## [289,] "drapes "     ""          ""         ""        
## [290,] "stems "      "glasses "  ""         ""        
## [291,] "clothes "    ""          ""         ""        
## [292,] "gives "      "us "       ""         ""        
## [293,] "bills "      ""          ""         ""        
## [294,] "is "         ""          ""         ""        
## [295,] "is "         ""          ""         ""        
## [296,] "this."       ""          ""         ""        
## [297,] "grapes "     "was "      ""         ""        
## [298,] "cherries."   ""          ""         ""        
## [299,] "sparks."     ""          ""         ""        
## [300,] "glasses "    ""          ""         ""        
## [301,] "limits "     ""          ""         ""        
## [302,] "is "         ""          ""         ""        
## [303,] "priceless "  "stones."   ""         ""        
## [304,] "was "        ""          ""         ""        
## [305,] "lanterns "   ""          ""         ""        
## [306,] "years "      ""          ""         ""        
## [307,] "cuts "       ""          ""         ""        
## [308,] "is "         ""          ""         ""        
## [309,] "waves "      ""          ""         ""        
## [310,] "makes "      "hearts "   ""         ""        
## [311,] "is "         ""          ""         ""        
## [312,] "tales "      ""          ""         ""        
## [313,] "was "        ""          ""         ""        
## [314,] "was "        ""          ""         ""        
## [315,] "Oats "       ""          ""         ""        
## [316,] "eyelids "    ""          ""         ""        
## [317,] "revives "    "his "      ""         ""        
## [318,] "ways "       "things."   ""         ""        
## [319,] "is "         ""          ""         ""        
## [320,] "was "        ""          ""         ""        
## [321,] "was "        ""          ""         ""        
## [322,] "dress "      "days."     ""         ""        
## [323,] "words."      ""          ""         ""        
## [324,] "is "         ""          ""         ""        
## [325,] "this "       "is "       ""         ""        
## [326,] "this "       ""          ""         ""        
## [327,] "is "         "books."    ""         ""        
## [328,] "tales "      ""          ""         ""        
## [329,] "was "        "as "       ""         ""        
## [330,] "pears "      ""          ""         ""        
## [331,] "was "        ""          ""         ""        
## [332,] "hours "      ""          ""         ""        
## [333,] "was "        ""          ""         ""        
## [334,] "This "       ""          ""         ""        
## [335,] "Press "      ""          ""         ""        
## [336,] "plans "      ""          ""         ""        
## [337,] "was "        ""          ""         ""        
## [338,] "hands "      "this "     ""         ""        
## [339,] "is "         "this "     ""         ""        
## [340,] "His "        "friends."  ""         ""        
## [341,] "makes "      ""          ""         ""        
## [342,] "needs "      ""          ""         ""        
## [343,] "clowns."     ""          ""         ""        
## [344,] "drifts "     ""          ""         ""        
## [345,] "clothes "    ""          ""         ""        
## [346,] "mails "      "requests " "this "    ""        
## [347,] "was "        "ends."     ""         ""        
## [348,] "words "      ""          ""         ""        
## [349,] "his "        ""          ""         ""        
## [350,] "pickles "    ""          ""         ""        
## [351,] "is "         ""          ""         ""        
## [352,] "times."      ""          ""         ""        
## [353,] "is "         "clips."    ""         ""        
## [354,] "says."       ""          ""         ""        
## [355,] "trinkets "   ""          ""         ""        
## [356,] "Clams "      ""          ""         ""        
## [357,] "its "        "blades "   ""         ""        
## [358,] "edges "      "was "      ""         ""        
## [359,] "matters "    "reads "    "words "   ""        
## [360,] "its "        ""          ""         ""        
## [361,] "goes "       "shoes."    ""         ""        
## [362,] "sockets "    ""          ""         ""        
## [363,] "grass."      ""          ""         ""        
## [364,] "Bribes "     ""          ""         ""        
## [365,] "flames "     ""          ""         ""        
## [366,] "was "        "designs."  ""         ""        
## [367,] "was "        ""          ""         ""        
## [368,] "Footprints " ""          ""         ""        
## [369,] "was "        ""          ""         ""        
## [370,] "is "         "inches "   ""         ""        
## [371,] "was "        "mass "     "leaves "  "shrubs." 
## [372,] "was "        ""          ""         ""        
## [373,] "outdoors."   ""          ""         ""        
## [374,] "brass "      ""          ""         ""        
## [375,] "lobes "      "ears "     "rings."   ""        
## [376,] "is "         ""          ""         ""        
## [377,] "speaks "     "is "       ""         ""        
## [378,] "his "        ""          ""         ""        
## [379,] "kids "       ""          ""         ""        
## [380,] "gets "       "friends."  ""         ""        
## [381,] "boys "       ""          ""         ""        
## [382,] "tumbles "    ""          ""         ""        
## [383,] "across "     "glass "    ""         ""        
## [384,] "was "        ""          ""         ""        
## [385,] "makes "      ""          ""         ""        
## [386,] "stories "    ""          ""         ""        
## [387,] "funds "      "seems "    ""         ""        
## [388,] "his "        ""          ""         ""        
## [389,] "is "         ""          ""         ""        
## [390,] "guests "     ""          ""         ""        
## [391,] "has "        "is "       ""         ""        
## [392,] "words "      ""          ""         ""        
## [393,] "runs "       ""          ""         ""        
## [394,] "comes "      ""          ""         ""        
## [395,] "rocks."      ""          ""         ""        
## [396,] "looks "      ""          ""         ""        
## [397,] "his "        ""          ""         ""        
## [398,] "others "     ""          ""         ""        
## [399,] "is "         ""          ""         ""        
## [400,] "moves "      ""          ""         ""        
## [401,] "moss "       "grows "    ""         ""        
## [402,] "has "        ""          ""         ""        
## [403,] "was "        ""          ""         ""        
## [404,] "is "         "dishes."   ""         ""        
## [405,] "facts "      "always "   "is "      ""        
## [406,] "flaps "      "as "       "parades " ""        
## [407,] "loss "       "was "      ""         ""        
## [408,] "Calves "     "grass."    ""         ""        
## [409,] "bills "      "this "     ""         ""        
## [410,] "waters "     "is "       ""         ""        
## [411,] "was "        ""          ""         ""        
## [412,] "miss "       ""          ""         ""        
## [413,] "kits "       ""          ""         ""        
## [414,] "saves "      ""          ""         ""        
## [415,] "eggs "       ""          ""         ""        
## [416,] "nerves "     ""          ""         ""        
## [417,] "maps "       "planes."   ""         ""        
## [418,] "Dimes "      "sides."    ""         ""        
## [419,] "tunes "      ""          ""         ""        
## [420,] "is "         ""          ""         ""        
## [421,] "pods "       "peas "     "fields."  ""        
## [422,] "is "         ""          ""         ""        
## [423,] "was "        "its "      ""         ""        
## [424,] "comes "      ""          ""         ""        
## [425,] "is "         ""          ""         ""        
## [426,] "is "         ""          ""         ""        
## [427,] "amounts "    "is "       ""         ""        
## [428,] "is "         ""          ""         ""        
## [429,] "is "         "business " ""         ""        
## [430,] "was "        "blocks "   ""         ""        
## [431,] "biscuits "   ""          ""         ""        
## [432,] "branches."   ""          ""         ""        
## [433,] "brass "      ""          ""         ""        
## [434,] "needs "      ""          ""         ""        
## [435,] "informs "    ""          ""         ""        
## [436,] "comes "      "batches "  ""         ""        
## [437,] "Dots "       ""          ""         ""        
## [438,] "leaves."     ""          ""         ""        
## [439,] "hands "      ""          ""         ""        
## [440,] "faults."     ""          ""         ""        
## [441,] "blows."      ""          ""         ""        
## [442,] "is "         ""          ""         ""        
## [443,] "takes "      "less "     ""         ""        
## [444,] "needs "      ""          ""         ""        
## [445,] "fits "       ""          ""         ""        
## [446,] "gloss "      ""          ""         ""        
## [447,] "grass."      ""          ""         ""        
## [448,] "seals "      "sheets."   ""         ""        
## [449,] "troops "     "blows."    ""         ""        
## [450,] "was "        ""          ""         ""        
## [451,] "was "        ""          ""         ""        
## [452,] "contents "   ""          ""         ""        
## [453,] "puts "       "his "      "his "     ""        
## [454,] "bombs "      "ruins."    ""         ""        
## [455,] "streets "    "turns."    ""         ""        
## [456,] "as "         ""          ""         ""        
## [457,] "was "        ""          ""         ""        
## [458,] "was "        ""          ""         ""        
## [459,] "was "        ""          ""         ""        
## [460,] "grass "      "bushes "   ""         ""        
## [461,] "his "        "coins."    ""         ""        
## [462,] "his "        "times."    ""         ""
```

```r
sentences %>%
  str_subset("[\\w]+es[ ]|[\\w]+es[\\.]") %>%
  str_extract_all("[\\w]+es[ ]|[\\w]+es[\\.]", simplify = T)
```

```
##        [,1]         [,2]      
##   [1,] "makes "     ""        
##   [2,] "fires "     ""        
##   [3,] "makes "     ""        
##   [4,] "lives "     ""        
##   [5,] "busses "    ""        
##   [6,] "hikes "     ""        
##   [7,] "makes "     ""        
##   [8,] "strokes."   ""        
##   [9,] "slices."    ""        
##  [10,] "gives "     ""        
##  [11,] "Thieves "   ""        
##  [12,] "improves "  ""        
##  [13,] "Leaves "    ""        
##  [14,] "times."     ""        
##  [15,] "leaves."    ""        
##  [16,] "eyes "      ""        
##  [17,] "Clothes "   ""        
##  [18,] "scores."    ""        
##  [19,] "tastes "    ""        
##  [20,] "thistles "  ""        
##  [21,] "poodles "   ""        
##  [22,] "stories "   ""        
##  [23,] "pirates "   ""        
##  [24,] "figures."   ""        
##  [25,] "does "      ""        
##  [26,] "pipes."     ""        
##  [27,] "leaves "    ""        
##  [28,] "holes "     ""        
##  [29,] "tales "     ""        
##  [30,] "miles "     ""        
##  [31,] "inches."    ""        
##  [32,] "clothes."   ""        
##  [33,] "wires "     ""        
##  [34,] "writes "    ""        
##  [35,] "ladies "    ""        
##  [36,] "ties "      ""        
##  [37,] "makes "     ""        
##  [38,] "slides "    ""        
##  [39,] "houses "    ""        
##  [40,] "miles "     ""        
##  [41,] "shelves "   ""        
##  [42,] "eyes."      ""        
##  [43,] "apples "    ""        
##  [44,] "tones "     ""        
##  [45,] "leaves "    ""        
##  [46,] "shelves."   ""        
##  [47,] "minutes."   ""        
##  [48,] "takes "     ""        
##  [49,] "changes."   ""        
##  [50,] "sometimes " ""        
##  [51,] "mules "     ""        
##  [52,] "edges "     ""        
##  [53,] "Pages "     ""        
##  [54,] "lines "     ""        
##  [55,] "zones "     ""        
##  [56,] "gives "     ""        
##  [57,] "piles "     "lines "  
##  [58,] "natives."   ""        
##  [59,] "takes "     ""        
##  [60,] "takes "     ""        
##  [61,] "shares "    ""        
##  [62,] "goes "      "names."  
##  [63,] "ones "      ""        
##  [64,] "heroes."    ""        
##  [65,] "makes "     ""        
##  [66,] "takes "     ""        
##  [67,] "names "     ""        
##  [68,] "makes "     ""        
##  [69,] "restores "  ""        
##  [70,] "takes "     ""        
##  [71,] "lines."     ""        
##  [72,] "itches "    ""        
##  [73,] "Bottles "   ""        
##  [74,] "ashes "     ""        
##  [75,] "drapes "    ""        
##  [76,] "glasses "   ""        
##  [77,] "clothes "   ""        
##  [78,] "gives "     ""        
##  [79,] "grapes "    ""        
##  [80,] "cherries."  ""        
##  [81,] "glasses "   ""        
##  [82,] "stones."    ""        
##  [83,] "waves "     ""        
##  [84,] "makes "     ""        
##  [85,] "tales "     ""        
##  [86,] "revives "   ""        
##  [87,] "tales "     ""        
##  [88,] "makes "     ""        
##  [89,] "clothes "   ""        
##  [90,] "pickles "   ""        
##  [91,] "times."     ""        
##  [92,] "blades "    ""        
##  [93,] "edges "     ""        
##  [94,] "goes "      "shoes."  
##  [95,] "Bribes "    ""        
##  [96,] "flames "    ""        
##  [97,] "inches "    ""        
##  [98,] "leaves "    ""        
##  [99,] "lobes "     ""        
## [100,] "tumbles "   ""        
## [101,] "makes "     ""        
## [102,] "stories "   ""        
## [103,] "comes "     ""        
## [104,] "moves "     ""        
## [105,] "dishes."    ""        
## [106,] "parades "   ""        
## [107,] "Calves "    ""        
## [108,] "saves "     ""        
## [109,] "nerves "    ""        
## [110,] "planes."    ""        
## [111,] "Dimes "     "sides."  
## [112,] "tunes "     ""        
## [113,] "comes "     ""        
## [114,] "branches."  ""        
## [115,] "comes "     "batches "
## [116,] "leaves."    ""        
## [117,] "takes "     ""        
## [118,] "bushes "    ""        
## [119,] "times."     ""
```

```r
## 14.4.4 Grouped matches
noun <- "(a|the) ([^ ]+)" ## what is ([^ ]+) 

has_noun <- sentences %>%
  str_subset(noun) %>%
  head(10)
has_noun
```

```
##  [1] "The birch canoe slid on the smooth planks."       
##  [2] "Glue the sheet to the dark blue background."      
##  [3] "It's easy to tell the depth of a well."           
##  [4] "These days a chicken leg is a rare dish."         
##  [5] "The box was thrown beside the parked truck."      
##  [6] "The boy was there when the sun rose."             
##  [7] "The source of the huge river is the clear spring."
##  [8] "Kick the ball straight and follow through."       
##  [9] "Help the woman get back to her feet."             
## [10] "A pot of tea helps to pass the evening."
```

```r
has_noun %>% 
  str_extract(noun)
```

```
##  [1] "the smooth" "the sheet"  "the depth"  "a chicken"  "the parked"
##  [6] "the sun"    "the huge"   "the ball"   "the woman"  "a helps"
```

```r
has_noun %>% str_match(noun) 
```

```
##       [,1]         [,2]  [,3]     
##  [1,] "the smooth" "the" "smooth" 
##  [2,] "the sheet"  "the" "sheet"  
##  [3,] "the depth"  "the" "depth"  
##  [4,] "a chicken"  "a"   "chicken"
##  [5,] "the parked" "the" "parked" 
##  [6,] "the sun"    "the" "sun"    
##  [7,] "the huge"   "the" "huge"   
##  [8,] "the ball"   "the" "ball"   
##  [9,] "the woman"  "the" "woman"  
## [10,] "a helps"    "a"   "helps"
```

```r
tibble(sentence = sentences) %>% 
  tidyr::extract(
    sentence, c("article", "noun"), "(a|the) ([^ ]+)", 
    remove = FALSE
  )
```

```
## Error in eval(expr, envir, enclos): could not find function "tibble"
```

```r
## 14.4.4.1 Exercises

## 1. Find all words that come after a “number” like “one”, “two”, “three” etc. Pull out both the number and the word.
number <- "(one|two|three|four|five|six|seven|eight|nine) ([^ ]+)" ## what is ([^ ]+) 

has_number <- sentences %>%
  str_subset(number)
has_number
```

```
##  [1] "Lift the square stone over the fence."       
##  [2] "The rope will bind the seven books at once." 
##  [3] "The two met while playing on the sand."      
##  [4] "There are more than two factors here."       
##  [5] "He lay prone and hardly moved a limb."       
##  [6] "Type out three lists of orders."             
##  [7] "Two plus seven is less than ten."            
##  [8] "Drop the two when you add the figures."      
##  [9] "Torn scraps littered the stone floor."       
## [10] "The lamp shone with a steady green flame."   
## [11] "We are sure that one war is enough."         
## [12] "His shirt was clean but one button was gone."
## [13] "The fight will end in just six minutes."     
## [14] "The copper bowl shone in the sun's rays."    
## [15] "Each penny shone like new."                  
## [16] "Take two shares as a fair profit."           
## [17] "It's a dense crowd in two distinct ways."    
## [18] "The cone costs five cents on Mondays."       
## [19] "Fasten two pins on each side."               
## [20] "The straw nest housed five robins."          
## [21] "Bottles hold four kinds of rum."             
## [22] "The wall phone rang loud and often."         
## [23] "The three story house was built of stone."   
## [24] "The dusty bench stood by the stone wall."    
## [25] "It is a band of steel three inches wide."    
## [26] "A six comes up more often than a ten."       
## [27] "It was done before the boy could see it."    
## [28] "The mail comes in three batches per day."    
## [29] "Slide the bill between the two leaves."
```

```r
has_number %>% 
  str_extract(number)
```

```
##  [1] "one over"      "seven books"   "two met"       "two factors"  
##  [5] "one and"       "three lists"   "seven is"      "two when"     
##  [9] "one floor."    "one with"      "one war"       "one button"   
## [13] "six minutes."  "one in"        "one like"      "two shares"   
## [17] "two distinct"  "one costs"     "two pins"      "five robins." 
## [21] "four kinds"    "one rang"      "three story"   "one wall."    
## [25] "three inches"  "six comes"     "one before"    "three batches"
## [29] "two leaves."
```

```r
has_number %>% str_match(number) 
```

```
##       [,1]            [,2]    [,3]      
##  [1,] "one over"      "one"   "over"    
##  [2,] "seven books"   "seven" "books"   
##  [3,] "two met"       "two"   "met"     
##  [4,] "two factors"   "two"   "factors" 
##  [5,] "one and"       "one"   "and"     
##  [6,] "three lists"   "three" "lists"   
##  [7,] "seven is"      "seven" "is"      
##  [8,] "two when"      "two"   "when"    
##  [9,] "one floor."    "one"   "floor."  
## [10,] "one with"      "one"   "with"    
## [11,] "one war"       "one"   "war"     
## [12,] "one button"    "one"   "button"  
## [13,] "six minutes."  "six"   "minutes."
## [14,] "one in"        "one"   "in"      
## [15,] "one like"      "one"   "like"    
## [16,] "two shares"    "two"   "shares"  
## [17,] "two distinct"  "two"   "distinct"
## [18,] "one costs"     "one"   "costs"   
## [19,] "two pins"      "two"   "pins"    
## [20,] "five robins."  "five"  "robins." 
## [21,] "four kinds"    "four"  "kinds"   
## [22,] "one rang"      "one"   "rang"    
## [23,] "three story"   "three" "story"   
## [24,] "one wall."     "one"   "wall."   
## [25,] "three inches"  "three" "inches"  
## [26,] "six comes"     "six"   "comes"   
## [27,] "one before"    "one"   "before"  
## [28,] "three batches" "three" "batches" 
## [29,] "two leaves."   "two"   "leaves."
```

```r
## 2. Find all contractions. Separate out the pieces before and after the apostrophe.
contractions <- "([^ ]+)(\\')([^ ]+)"
has_contractions <- sentences %>%
  str_subset(contractions)
has_contractions
```

```
##  [1] "It's easy to tell the depth of a well."      
##  [2] "The soft cushion broke the man's fall."      
##  [3] "Open the crate but don't break the glass."   
##  [4] "Add the store's account to the last cent."   
##  [5] "The beam dropped down on the workmen's head."
##  [6] "Let's all join as we sing the last chorus."  
##  [7] "The copper bowl shone in the sun's rays."    
##  [8] "A child's wit saved the day for us."         
##  [9] "A ripe plum is fit for a king's palate."     
## [10] "It's a dense crowd in two distinct ways."    
## [11] "We don't get much money but we have fun."    
## [12] "Ripe pears are fit for a queen's table."     
## [13] "We don't like to admit our small faults."    
## [14] "Dig deep in the earth for pirate's gold."    
## [15] "She saw a cat in the neighbor's house."
```

```r
has_contractions %>% str_match(contractions) 
```

```
##       [,1]         [,2]       [,3] [,4]
##  [1,] "It's"       "It"       "'"  "s" 
##  [2,] "man's"      "man"      "'"  "s" 
##  [3,] "don't"      "don"      "'"  "t" 
##  [4,] "store's"    "store"    "'"  "s" 
##  [5,] "workmen's"  "workmen"  "'"  "s" 
##  [6,] "Let's"      "Let"      "'"  "s" 
##  [7,] "sun's"      "sun"      "'"  "s" 
##  [8,] "child's"    "child"    "'"  "s" 
##  [9,] "king's"     "king"     "'"  "s" 
## [10,] "It's"       "It"       "'"  "s" 
## [11,] "don't"      "don"      "'"  "t" 
## [12,] "queen's"    "queen"    "'"  "s" 
## [13,] "don't"      "don"      "'"  "t" 
## [14,] "pirate's"   "pirate"   "'"  "s" 
## [15,] "neighbor's" "neighbor" "'"  "s"
```

```r
## 14.4.5 Replacing matches
x <- c("apple", "pear", "banana")
str_replace(x, "[aeiou]", "-") ## Only changes one letter
```

```
## [1] "-pple"  "p-ar"   "b-nana"
```

```r
str_replace_all(x, "[aeiou]", "-") ## Changes all the letters
```

```
## [1] "-ppl-"  "p--r"   "b-n-n-"
```

```r
x <- c("1 house", "2 cars", "3 people")
str_replace_all(x, c("1" = "one", "2" = "two", "3" = "three"))
```

```
## [1] "one house"    "two cars"     "three people"
```

```r
sentences %>% 
  str_replace("([^ ]+) ([^ ]+) ([^ ]+)", "\\1 \\3 \\2") %>% 
  head(5)
```

```
## [1] "The canoe birch slid on the smooth planks." 
## [2] "Glue sheet the to the dark blue background."
## [3] "It's to easy tell the depth of a well."     
## [4] "These a days chicken leg is a rare dish."   
## [5] "Rice often is served in round bowls."
```

```r
## 14.4.5.1 Exercises

## Replace all forward slashes in a string with backslashes.
a <- c("a/b","a/b/c", "a/b/c/d")
a %>% 
  str_replace_all("/","\\\\") %>%
  writeLines()
```

```
## a\b
## a\b\c
## a\b\c\d
```

```r
## Implement a simple version of str_to_lower() using replace_all().

first.letter <- sentences %>%
  str_extract("^[\\w]")
lower.letter <- tolower(first.letter)
sentences %>% 
  str_replace_all("^[\\w]", lower.letter) %>% 
  head(5)
```

```
## [1] "the birch canoe slid on the smooth planks." 
## [2] "glue the sheet to the dark blue background."
## [3] "it's easy to tell the depth of a well."     
## [4] "these days a chicken leg is a rare dish."   
## [5] "rice is often served in round bowls."
```

```r
## Switch the first and last letters in words. Which of those strings are still words?

words %>% 
  str_replace_all("^[\\w]", "[\\w]$") %>% 
  head(5) ## Don't Work!
```

```
## [1] "[w]$"        "[w]$ble"     "[w]$bout"    "[w]$bsolute" "[w]$ccept"
```

```r
words %>% 
  str_replace_all("(^[\\w]) ([\\w]$) ", "\\2 \\1") %>% 
  head(5) ## Don't Work!
```

```
## [1] "a"        "able"     "about"    "absolute" "accept"
```

```r
last.letter <- words %>% 
  str_extract("[\\w]$")
last.letter
```

```
##   [1] "a" "e" "t" "e" "t" "t" "e" "s" "t" "e" "l" "d" "s" "t" "e" "t" "d"
##  [18] "r" "n" "n" "t" "e" "t" "o" "e" "r" "l" "w" "t" "g" "y" "t" "o" "h"
##  [35] "s" "a" "t" "d" "r" "r" "y" "t" "t" "r" "y" "t" "h" "e" "a" "e" "m"
##  [52] "d" "e" "t" "s" "k" "e" "e" "t" "d" "y" "e" "e" "y" "l" "y" "k" "d"
##  [69] "g" "e" "l" "k" "r" "e" "s" "e" "r" "t" "y" "e" "e" "d" "e" "n" "d"
##  [86] "e" "t" "t" "t" "n" "g" "l" "h" "t" "k" "e" "d" "w" "e" "d" "t" "y"
## [103] "k" "h" "r" "e" "m" "x" "y" "k" "f" "t" "g" "n" "r" "t" "d" "s" "s"
## [120] "y" "t" "y" "y" "e" "l" "n" "r" "d" "e" "y" "e" "t" "h" "e" "t" "e"
## [137] "n" "r" "n" "e" "e" "p" "r" "e" "p" "k" "d" "e" "e" "t" "s" "h" "y"
## [154] "m" "s" "n" "r" "t" "k" "e" "s" "e" "b" "e" "d" "e" "t" "e" "r" "e"
## [171] "t" "t" "e" "n" "y" "y" "e" "e" "e" "n" "n" "r" "r" "t" "t" "e" "t"
## [188] "l" "e" "k" "y" "r" "t" "t" "d" "l" "t" "y" "y" "e" "e" "t" "r" "e"
## [205] "s" "p" "t" "t" "d" "r" "e" "y" "d" "l" "r" "e" "e" "n" "p" "e" "e"
## [222] "t" "d" "e" "n" "l" "p" "e" "e" "t" "r" "t" "s" "t" "e" "o" "r" "t"
## [239] "g" "r" "e" "t" "n" "w" "s" "k" "e" "p" "y" "e" "g" "h" "y" "t" "y"
## [256] "t" "y" "e" "t" "g" "t" "r" "t" "c" "n" "e" "y" "e" "d" "e" "h" "y"
## [273] "h" "r" "t" "l" "l" "e" "n" "g" "r" "y" "e" "t" "e" "t" "e" "e" "t"
## [290] "t" "e" "e" "n" "s" "a" "e" "e" "t" "r" "l" "y" "r" "m" "t" "r" "r"
## [307] "d" "l" "w" "d" "t" "e" "e" "l" "m" "l" "e" "d" "e" "h" "e" "t" "h"
## [324] "t" "e" "t" "r" "y" "w" "d" "t" "r" "e" "t" "m" "e" "d" "r" "e" "e"
## [341] "y" "d" "m" "t" "l" "n" "n" "d" "r" "e" "e" "n" "s" "l" "y" "t" "l"
## [358] "e" "s" "o" "d" "d" "e" "n" "d" "t" "t" "n" "d" "p" "w" "s" "y" "r"
## [375] "f" "l" "d" "g" "n" "y" "d" "e" "e" "e" "d" "h" "r" "t" "t" "y" "l"
## [392] "p" "e" "h" "y" "t" "d" "y" "e" "t" "e" "e" "l" "t" "r" "e" "w" "r"
## [409] "o" "d" "d" "a" "y" "f" "e" "t" "e" "n" "e" "e" "e" "d" "l" "y" "m"
## [426] "e" "d" "e" "t" "o" "e" "t" "e" "e" "t" "m" "s" "b" "n" "e" "p" "t"
## [443] "p" "y" "d" "l" "d" "g" "n" "k" "w" "r" "d" "y" "d" "e" "e" "t" "e"
## [460] "h" "w" "y" "d" "n" "e" "t" "g" "s" "t" "r" "l" "e" "e" "t" "e" "y"
## [477] "t" "e" "k" "t" "n" "e" "e" "d" "l" "k" "n" "g" "k" "d" "e" "t" "e"
## [494] "w" "k" "h" "e" "n" "r" "e" "n" "e" "y" "k" "t" "y" "h" "r" "y" "e"
## [511] "n" "g" "e" "t" "r" "n" "e" "t" "e" "k" "n" "d" "r" "s" "e" "s" "r"
## [528] "t" "y" "y" "h" "e" "g" "t" "r" "n" "e" "s" "h" "c" "t" "e" "n" "e"
## [545] "r" "y" "d" "r" "w" "s" "t" "e" "t" "e" "o" "n" "e" "l" "h" "t" "e"
## [562] "e" "w" "r" "s" "n" "d" "f" "f" "r" "e" "n" "y" "d" "n" "e" "e" "y"
## [579] "n" "e" "y" "e" "r" "r" "e" "l" "r" "e" "t" "t" "r" "n" "k" "e" "t"
## [596] "r" "r" "h" "n" "t" "k" "t" "r" "y" "s" "t" "y" "e" "n" "e" "r" "t"
## [613] "t" "s" "d" "n" "h" "k" "e" "e" "e" "n" "y" "e" "s" "t" "e" "y" "c"
## [630] "r" "n" "e" "e" "t" "d" "r" "e" "e" "t" "s" "e" "e" "y" "s" "e" "t"
## [647] "e" "e" "m" "d" "s" "e" "t" "e" "t" "r" "e" "t" "e" "c" "l" "e" "h"
## [664] "t" "y" "r" "n" "k" "d" "t" "e" "o" "l" "e" "e" "e" "r" "d" "y" "l"
## [681] "e" "y" "n" "e" "t" "n" "e" "d" "d" "d" "e" "r" "d" "n" "n" "r" "t"
## [698] "t" "e" "h" "e" "t" "e" "t" "t" "n" "d" "t" "g" "e" "d" "e" "l" "m"
## [715] "d" "e" "n" "e" "e" "e" "y" "e" "y" "e" "l" "e" "e" "d" "t" "d" "y"
## [732] "n" "e" "e" "m" "f" "l" "d" "e" "e" "s" "e" "e" "t" "e" "n" "x" "l"
## [749] "e" "e" "t" "e" "t" "p" "t" "d" "w" "t" "k" "e" "n" "r" "e" "e" "g"
## [766] "e" "r" "r" "t" "e" "e" "x" "e" "p" "t" "w" "l" "e" "o" "l" "y" "e"
## [783] "n" "n" "y" "t" "d" "h" "e" "k" "l" "c" "d" "l" "d" "e" "f" "e" "s"
## [800] "d" "d" "t" "e" "n" "y" "p" "k" "l" "p" "y" "t" "y" "t" "e" "g" "e"
## [817] "t" "y" "f" "d" "t" "d" "h" "n" "t" "t" "r" "n" "y" "y" "t" "e" "e"
## [834] "e" "h" "m" "e" "e" "k" "e" "x" "a" "h" "m" "e" "n" "l" "n" "d" "m"
## [851] "e" "t" "n" "k" "e" "n" "e" "e" "y" "g" "k" "n" "y" "s" "u" "h" "d"
## [868] "e" "h" "w" "y" "e" "e" "o" "y" "r" "w" "t" "o" "p" "l" "h" "d" "n"
## [885] "e" "c" "n" "t" "l" "t" "e" "e" "e" "t" "y" "y" "n" "e" "y" "o" "e"
## [902] "r" "d" "n" "t" "e" "y" "s" "l" "p" "n" "e" "l" "e" "s" "y" "o" "w"
## [919] "e" "t" "e" "e" "t" "k" "l" "t" "r" "m" "h" "e" "h" "r" "y" "e" "r"
## [936] "y" "e" "k" "h" "e" "l" "t" "t" "n" "e" "r" "h" "e" "e" "o" "e" "y"
## [953] "e" "e" "l" "n" "d" "w" "h" "h" "n" "t" "n" "r" "d" "d" "k" "d" "y"
## [970] "e" "h" "d" "e" "g" "r" "s" "y" "t" "u" "g"
```

```r
first.letter <- words %>%
  str_extract("^[\\w]")
first.letter
```

```
##   [1] "a" "a" "a" "a" "a" "a" "a" "a" "a" "a" "a" "a" "a" "a" "a" "a" "a"
##  [18] "a" "a" "a" "a" "a" "a" "a" "a" "a" "a" "a" "a" "a" "a" "a" "a" "a"
##  [35] "a" "a" "a" "a" "a" "a" "a" "a" "a" "a" "a" "a" "a" "a" "a" "a" "a"
##  [52] "a" "a" "a" "a" "a" "a" "a" "a" "a" "a" "a" "a" "a" "a" "b" "b" "b"
##  [69] "b" "b" "b" "b" "b" "b" "b" "b" "b" "b" "b" "b" "b" "b" "b" "b" "b"
##  [86] "b" "b" "b" "b" "b" "b" "b" "b" "b" "b" "b" "b" "b" "b" "b" "b" "b"
## [103] "b" "b" "b" "b" "b" "b" "b" "b" "b" "b" "b" "b" "b" "b" "b" "b" "b"
## [120] "b" "b" "b" "b" "c" "c" "c" "c" "c" "c" "c" "c" "c" "c" "c" "c" "c"
## [137] "c" "c" "c" "c" "c" "c" "c" "c" "c" "c" "c" "c" "c" "C" "C" "c" "c"
## [154] "c" "c" "c" "c" "c" "c" "c" "c" "c" "c" "c" "c" "c" "c" "c" "c" "c"
## [171] "c" "c" "c" "c" "c" "c" "c" "c" "c" "c" "c" "c" "c" "c" "c" "c" "c"
## [188] "c" "c" "c" "c" "c" "c" "c" "c" "c" "c" "c" "c" "c" "c" "c" "c" "c"
## [205] "c" "c" "c" "c" "d" "d" "d" "d" "d" "d" "d" "d" "d" "d" "d" "d" "d"
## [222] "d" "d" "d" "d" "d" "d" "d" "d" "d" "d" "d" "d" "d" "d" "d" "d" "d"
## [239] "d" "d" "d" "d" "d" "d" "d" "d" "d" "d" "d" "d" "d" "e" "e" "e" "e"
## [256] "e" "e" "e" "e" "e" "e" "e" "e" "e" "e" "e" "e" "e" "e" "e" "e" "e"
## [273] "e" "e" "e" "e" "e" "e" "e" "e" "e" "e" "e" "e" "e" "e" "e" "e" "e"
## [290] "e" "e" "e" "e" "e" "e" "e" "f" "f" "f" "f" "f" "f" "f" "f" "f" "f"
## [307] "f" "f" "f" "f" "f" "f" "f" "f" "f" "f" "f" "f" "f" "f" "f" "f" "f"
## [324] "f" "f" "f" "f" "f" "f" "f" "f" "f" "f" "f" "f" "f" "f" "f" "f" "f"
## [341] "f" "f" "f" "f" "f" "f" "f" "f" "f" "f" "g" "g" "g" "g" "g" "g" "g"
## [358] "g" "g" "g" "g" "g" "g" "g" "g" "g" "g" "g" "g" "g" "g" "g" "g" "h"
## [375] "h" "h" "h" "h" "h" "h" "h" "h" "h" "h" "h" "h" "h" "h" "h" "h" "h"
## [392] "h" "h" "h" "h" "h" "h" "h" "h" "h" "h" "h" "h" "h" "h" "h" "h" "h"
## [409] "h" "h" "h" "i" "i" "i" "i" "i" "i" "i" "i" "i" "i" "i" "i" "i" "i"
## [426] "i" "i" "i" "i" "i" "i" "i" "i" "i" "i" "i" "j" "j" "j" "j" "j" "j"
## [443] "k" "k" "k" "k" "k" "k" "k" "k" "k" "l" "l" "l" "l" "l" "l" "l" "l"
## [460] "l" "l" "l" "l" "l" "l" "l" "l" "l" "l" "l" "l" "l" "l" "l" "l" "l"
## [477] "l" "l" "l" "l" "l" "l" "l" "l" "l" "l" "l" "l" "l" "l" "l" "l" "l"
## [494] "l" "l" "l" "m" "m" "m" "m" "m" "m" "m" "m" "m" "m" "m" "m" "m" "m"
## [511] "m" "m" "m" "m" "m" "m" "m" "m" "m" "m" "m" "m" "m" "m" "m" "m" "m"
## [528] "m" "m" "m" "m" "m" "m" "m" "m" "m" "m" "m" "m" "m" "m" "n" "n" "n"
## [545] "n" "n" "n" "n" "n" "n" "n" "n" "n" "n" "n" "n" "n" "n" "n" "n" "n"
## [562] "n" "n" "n" "o" "o" "o" "o" "o" "o" "o" "o" "o" "o" "o" "o" "o" "o"
## [579] "o" "o" "o" "o" "o" "o" "o" "o" "o" "o" "o" "o" "o" "o" "p" "p" "p"
## [596] "p" "p" "p" "p" "p" "p" "p" "p" "p" "p" "p" "p" "p" "p" "p" "p" "p"
## [613] "p" "p" "p" "p" "p" "p" "p" "p" "p" "p" "p" "p" "p" "p" "p" "p" "p"
## [630] "p" "p" "p" "p" "p" "p" "p" "p" "p" "p" "p" "p" "p" "p" "p" "p" "p"
## [647] "p" "p" "p" "p" "p" "p" "p" "p" "p" "p" "p" "p" "p" "p" "p" "p" "p"
## [664] "p" "q" "q" "q" "q" "q" "q" "q" "r" "r" "r" "r" "r" "r" "r" "r" "r"
## [681] "r" "r" "r" "r" "r" "r" "r" "r" "r" "r" "r" "r" "r" "r" "r" "r" "r"
## [698] "r" "r" "r" "r" "r" "r" "r" "r" "r" "r" "r" "r" "r" "r" "r" "r" "r"
## [715] "r" "r" "r" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s"
## [732] "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s"
## [749] "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s"
## [766] "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s"
## [783] "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s"
## [800] "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s"
## [817] "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s" "s"
## [834] "s" "s" "s" "t" "t" "t" "t" "t" "t" "t" "t" "t" "t" "t" "t" "t" "t"
## [851] "t" "t" "t" "t" "t" "t" "t" "t" "t" "t" "t" "t" "t" "t" "t" "t" "t"
## [868] "t" "t" "t" "t" "t" "t" "t" "t" "t" "t" "t" "t" "t" "t" "t" "t" "t"
## [885] "t" "t" "t" "t" "t" "t" "t" "t" "t" "t" "t" "t" "t" "t" "t" "t" "t"
## [902] "u" "u" "u" "u" "u" "u" "u" "u" "u" "u" "u" "u" "v" "v" "v" "v" "v"
## [919] "v" "v" "v" "w" "w" "w" "w" "w" "w" "w" "w" "w" "w" "w" "w" "w" "w"
## [936] "w" "w" "w" "w" "w" "w" "w" "w" "w" "w" "w" "w" "w" "w" "w" "w" "w"
## [953] "w" "w" "w" "w" "w" "w" "w" "w" "w" "w" "w" "w" "w" "w" "w" "w" "w"
## [970] "w" "w" "w" "w" "w" "y" "y" "y" "y" "y" "y"
```

```r
words %>% 
  str_replace_all("(^[\\w])", last.letter) %>%
  str_replace_all("([\\w]$)", first.letter)
```

```
##   [1] "a"           "ebla"        "tboua"       "ebsoluta"    "tccepa"     
##   [6] "tccouna"     "echieva"     "scrosa"      "tca"         "ectiva"     
##  [11] "lctuaa"      "dda"         "sddresa"     "tdmia"       "edvertisa"  
##  [16] "tffeca"      "dffora"      "rftea"       "nfternooa"   "ngaia"      
##  [21] "tgainsa"     "ega"         "tgena"       "oga"         "egrea"      
##  [26] "ria"         "lla"         "wlloa"       "tlmosa"      "glona"      
##  [31] "ylreada"     "tlrigha"     "olsa"        "hlthouga"    "slwaya"     
##  [36] "america"     "tmouna"      "dna"         "rnothea"     "rnswea"     
##  [41] "yna"         "tpara"       "tpparena"    "rppeaa"      "yppla"      
##  [46] "tppoina"     "hpproaca"    "eppropriata" "area"        "ergua"      
##  [51] "mra"         "drouna"      "erranga"     "tra"         "sa"         
##  [56] "ksa"         "essociata"   "essuma"      "ta"          "dttena"     
##  [61] "yuthorita"   "evailabla"   "ewara"       "ywaa"        "lwfua"      
##  [66] "yabb"        "kacb"        "dab"         "gab"         "ealancb"    
##  [71] "lalb"        "kanb"        "rab"         "easb"        "sasib"      
##  [76] "eb"          "reab"        "teab"        "yeautb"      "eecausb"    
##  [81] "eecomb"      "deb"         "eeforb"      "negib"       "dehinb"     
##  [86] "eelievb"     "tenefib"     "tesb"        "teb"         "netweeb"    
##  [91] "gib"         "lilb"        "hirtb"       "tib"         "klacb"      
##  [96] "elokb"       "dloob"       "wlob"        "elub"        "doarb"      
## [101] "toab"        "yodb"        "koob"        "hotb"        "rotheb"     
## [106] "eottlb"      "mottob"      "xob"         "yob"         "kreab"      
## [111] "frieb"       "trillianb"   "grinb"       "nritaib"     "rrotheb"    
## [116] "tudgeb"      "duilb"       "sub"         "susinesb"    "yusb"       
## [121] "tub"         "yub"         "yb"          "eakc"        "lalc"       
## [126] "nac"         "rac"         "darc"        "earc"        "yarrc"      
## [131] "easc"        "tac"         "hatcc"       "eausc"       "tenc"       
## [136] "eentrc"      "nertaic"     "rhaic"       "nhairmac"    "ehancc"     
## [141] "ehangc"      "phac"        "rharactec"   "ehargc"      "pheac"      
## [146] "khecc"       "dhilc"       "ehoicc"      "ehoosc"      "thrisC"     
## [151] "shristmaC"   "hhurcc"      "yitc"        "mlaic"       "slasc"      
## [156] "nleac"       "rleac"       "tlienc"      "klocc"       "elosc"      
## [161] "slosec"      "elothc"      "bluc"        "eoffec"      "dolc"       
## [166] "eolleaguc"   "tollecc"     "eollegc"     "rolouc"      "eomc"       
## [171] "tommenc"     "tommic"      "eommittec"   "nommoc"      "yommunitc"  
## [176] "yompanc"     "eomparc"     "eompletc"    "eomputc"     "noncerc"    
## [181] "nonditioc"   "ronfec"      "ronsidec"    "tonsulc"     "tontacc"    
## [186] "eontinuc"    "tontracc"    "lontroc"     "eonversc"    "kooc"       
## [191] "yopc"        "rornec"      "torrecc"     "tosc"        "doulc"      
## [196] "louncic"     "tounc"       "yountrc"     "yountc"      "eouplc"     
## [201] "eoursc"      "tourc"       "rovec"       "ereatc"      "srosc"      
## [206] "puc"         "turrenc"     "tuc"         "dad"         "ranged"     
## [211] "eatd"        "yad"         "dead"        "lead"        "read"       
## [216] "eebatd"      "eecidd"      "necisiod"    "peed"        "eefinitd"   
## [221] "eegred"      "tepartmend"  "depend"      "eescribd"    "nesigd"     
## [226] "letaid"      "pevelod"     "eid"         "eifferencd"  "tifficuld"  
## [231] "rinned"      "tirecd"      "siscusd"     "tistricd"    "eividd"     
## [236] "od"          "roctod"      "tocumend"    "god"         "rood"       
## [241] "eoubld"      "toubd"       "nowd"        "wrad"        "sresd"      
## [246] "krind"       "erivd"       "prod"        "yrd"         "eud"        
## [251] "gurind"      "hace"        "yarle"       "tase"        "yase"       
## [256] "tae"         "yconome"     "educate"     "tffece"      "gge"        
## [261] "tighe"       "rithee"      "tlece"       "clectrie"    "nlevee"     
## [266] "else"        "ymploe"      "encourage"   "dne"         "engine"     
## [271] "hnglise"     "ynjoe"       "hnouge"      "rntee"       "tnvironmene"
## [276] "lquae"       "lspeciae"    "europe"      "nvee"        "gvenine"    
## [281] "rvee"        "yvere"       "evidence"    "txace"       "example"    
## [286] "txcepe"      "excuse"      "exercise"    "txise"       "txpece"     
## [291] "expense"     "experience"  "nxplaie"     "sxprese"     "axtre"      
## [296] "eye"         "eacf"        "tacf"        "raif"        "lalf"       
## [301] "yamilf"      "raf"         "marf"        "tasf"        "rathef"     
## [306] "ravouf"      "deef"        "leef"        "wef"         "dielf"      
## [311] "tighf"       "eigurf"      "eilf"        "lilf"        "milf"       
## [316] "linaf"       "einancf"     "dinf"        "einf"        "hinisf"     
## [321] "eirf"        "tirsf"       "hisf"        "tif"         "eivf"       
## [326] "tlaf"        "rloof"       "ylf"         "wollof"      "doof"       
## [331] "toof"        "rof"         "eorcf"       "torgef"      "morf"       
## [336] "eortunf"     "dorwarf"     "rouf"        "erancf"      "eref"       
## [341] "yridaf"      "drienf"      "mrof"        "tronf"       "lulf"       
## [346] "nuf"         "nunctiof"    "dunf"        "rurthef"     "euturf"     
## [351] "eamg"        "nardeg"      "sag"         "lenerag"     "yermang"    
## [356] "teg"         "lirg"        "eivg"        "slasg"       "og"         
## [361] "dog"         "doog"        "eoodbyg"     "noverg"      "drang"      
## [366] "trang"       "treag"       "nreeg"       "droung"      "proug"      
## [371] "wrog"        "suesg"       "yug"         "raih"        "falh"       
## [376] "lalh"        "danh"        "ganh"        "nappeh"      "yapph"      
## [381] "darh"        "eath"        "eavh"        "eh"          "deah"       
## [386] "health"      "reah"        "tearh"       "teah"        "yeavh"      
## [391] "lelh"        "pelh"        "eerh"        "high"        "yistorh"    
## [396] "tih"         "dolh"        "yolidah"     "eomh"        "tonesh"     
## [401] "eoph"        "eorsh"       "lospitah"    "toh"         "rouh"       
## [406] "eoush"       "woh"         "roweveh"     "oullh"       "dundreh"    
## [411] "dusbanh"     "adei"        "ydentifi"    "fi"          "emagini"    
## [416] "tmportani"   "emprovi"     "ni"          "encludi"     "encomi"     
## [421] "encreasi"    "dndeei"      "lndividuai"  "yndustri"    "mnfori"     
## [426] "ensidi"      "dnsteai"     "ensuri"      "tnteresi"    "onti"       
## [431] "entroduci"   "tnvesi"      "envolvi"     "essui"       "ti"         
## [436] "mtei"        "sesuj"       "boj"         "noij"        "eudgj"      
## [441] "pumj"        "tusj"        "peek"        "yek"         "dik"        
## [446] "lilk"        "dink"        "gink"        "nitchek"     "knock"      
## [451] "wnok"        "raboul"      "dal"         "yadl"        "danl"       
## [456] "eanguagl"    "eargl"       "tasl"        "eatl"        "haugl"      
## [461] "wal"         "yal"         "deal"        "nearl"       "eeavl"      
## [466] "tefl"        "gel"         "sesl"        "tel"         "rettel"     
## [471] "level"       "eil"         "eifl"        "tighl"       "eikl"       
## [476] "yikell"      "timil"       "einl"        "kinl"        "tisl"       
## [481] "nistel"      "eittll"      "eivl"        "doal"        "local"      
## [486] "kocl"        "nondol"      "gonl"        "kool"        "dorl"       
## [491] "eosl"        "tol"         "eovl"        "wol"         "kucl"       
## [496] "huncl"       "eachinm"     "naim"        "rajom"       "eakm"       
## [501] "nam"         "eanagm"      "yanm"        "karm"        "tarkem"     
## [506] "yarrm"       "hatcm"       "rattem"      "yam"         "eaybm"      
## [511] "neam"        "geaninm"     "eeasurm"     "teem"        "rembem"     
## [516] "nentiom"     "eiddlm"      "tighm"       "eilm"        "kilm"       
## [521] "nilliom"     "dinm"        "rinistem"    "sinum"       "einutm"     
## [526] "sism"        "ristem"      "tomenm"      "yondam"      "yonem"      
## [531] "hontm"       "eorm"        "gorninm"     "tosm"        "rothem"     
## [536] "notiom"      "eovm"        "srm"         "hucm"        "cusim"      
## [541] "tusm"        "eamn"        "nation"      "eaturn"      "rean"       
## [546] "yecessarn"   "deen"        "reven"       "wen"         "sewn"       
## [551] "texn"        "eicn"        "tighn"       "einn"        "on"         
## [556] "non"         "eonn"        "lorman"      "hortn"       "ton"        
## [561] "eotn"        "eoticn"      "won"         "rumben"      "sbviouo"    
## [566] "nccasioo"    "ddo"         "fo"          "ffo"         "rffeo"      
## [571] "effico"      "nfteo"       "ykao"        "dlo"         "no"         
## [576] "enco"        "eno"         "ynlo"        "npeo"        "eperato"    
## [581] "ypportunito" "epposo"      "ro"          "rrdeo"       "erganizo"   
## [586] "lriginao"    "rtheo"       "etherwiso"   "tugho"       "tuo"        
## [591] "rveo"        "nwo"         "kacp"        "eagp"        "tainp"      
## [596] "raip"        "rapep"       "haragrapp"   "nardop"      "tarenp"     
## [601] "karp"        "tarp"        "rarticulap"  "yartp"       "sasp"       
## [606] "tasp"        "yap"         "eencp"       "nensiop"     "eeoplp"     
## [611] "rep"         "tercenp"     "terfecp"     "serhapp"     "deriop"     
## [616] "nersop"      "hhotograpp"  "kicp"        "eicturp"     "eiecp"      
## [621] "elacp"       "nlap"        "ylap"        "eleasp"      "slup"       
## [626] "toinp"       "eolicp"      "yolicp"      "colitip"     "roop"       
## [631] "nositiop"    "eositivp"    "eossiblp"    "tosp"        "dounp"      
## [636] "rowep"       "eractisp"    "ereparp"     "tresenp"     "sresp"      
## [641] "eressurp"    "eresump"     "yrettp"      "srevioup"    "ericp"      
## [646] "trinp"       "erivatp"     "erobablp"    "mroblep"     "droceep"    
## [651] "srocesp"     "eroducp"     "troducp"     "erogrammp"   "trojecp"    
## [656] "rropep"      "eroposp"     "trotecp"     "erovidp"     "cublip"     
## [661] "lulp"        "eurposp"     "husp"        "tup"         "yualitq"    
## [666] "ruarteq"     "nuestioq"    "kuicq"       "duiq"        "tuieq"      
## [671] "euitq"       "oadir"       "lair"        "eaisr"       "eangr"      
## [676] "eatr"        "rather"      "dear"        "yeadr"       "lear"       
## [681] "eealisr"     "yeallr"      "neasor"      "eeceivr"     "tecenr"     
## [686] "neckor"      "eecognizr"   "decommenr"   "decorr"      "der"        
## [691] "eeducr"      "refer"       "degarr"      "negior"      "nelatior"   
## [696] "remember"    "teporr"      "tepresenr"   "eequirr"     "hesearcr"   
## [701] "eesourcr"    "tespecr"     "eesponsiblr" "tesr"        "tesulr"     
## [706] "neturr"      "dir"         "tighr"       "ginr"        "eisr"       
## [711] "doar"        "eolr"        "lolr"        "moor"        "dounr"      
## [716] "eulr"        "nur"         "eafs"        "eals"        "eams"       
## [721] "yaturdas"    "eavs"        "yas"         "echems"      "lchoos"     
## [726] "eciencs"     "ecors"       "dcotlans"    "teas"        "decons"     
## [731] "yecretars"   "nectios"     "eecurs"      "ees"         "mees"       
## [736] "fels"        "lels"        "dens"        "eenss"       "eeparats"   
## [741] "serious"     "eervs"       "eervics"     "tes"         "eettls"     
## [746] "neves"       "xes"         "lhals"       "ehars"       "ehs"        
## [751] "thees"       "ehos"        "thoos"       "phos"        "thors"      
## [756] "dhouls"      "whos"        "thus"        "kics"        "eids"       
## [761] "nigs"        "rimilas"     "eimpls"      "eincs"       "gins"       
## [766] "eingls"      "ris"         "ristes"      "tis"         "eits"       
## [771] "eituats"     "xis"         "eizs"        "plees"       "tlighs"     
## [776] "wlos"        "lmals"       "emoks"       "os"          "locias"     
## [781] "yociets"     "eoms"        "nos"         "noos"        "yorrs"      
## [786] "tors"        "douns"       "houts"       "epacs"       "kpeas"      
## [791] "lpecias"     "cpecifis"    "dpees"       "lpels"       "dpens"      
## [796] "equars"      "ftafs"       "etags"       "stairs"      "dtans"      
## [801] "dtandars"    "ttars"       "etats"       "ntatios"     "ytas"       
## [806] "ptes"        "ktics"       "ltils"       "ptos"        "ytors"      
## [811] "ttraighs"    "ytrategs"    "ttrees"      "etriks"      "gtrons"     
## [816] "etructurs"   "ttudens"     "ytuds"       "ftufs"       "dtupis"     
## [821] "tubjecs"     "duccees"     "hucs"        "nuddes"      "tuggess"    
## [826] "tuis"        "rummes"      "nus"         "yundas"      "yuppls"     
## [831] "tuppors"     "eupposs"     "eurs"        "eurpriss"    "hwitcs"     
## [836] "mystes"      "eablt"       "eakt"        "kalt"        "eapt"       
## [841] "xat"         "aet"         "heact"       "meat"        "eelephont"  
## [846] "nelevisiot"  "lelt"        "net"         "dent"        "mert"       
## [851] "eerriblt"    "test"        "nhat"        "khant"       "eht"        
## [856] "nhet"        "ehert"       "eherefort"   "yhet"        "ghint"      
## [861] "khint"       "nhirteet"    "yhirtt"      "shit"        "uhot"       
## [866] "hhougt"      "dhousant"    "ehret"       "hhrougt"     "whrot"      
## [871] "yhursdat"    "eit"         "eimt"        "ot"          "yodat"      
## [876] "rogethet"    "womorrot"    "tonight"     "oot"         "pot"        
## [881] "lotat"       "houct"       "dowart"      "nowt"        "eradt"      
## [886] "craffit"     "nrait"       "transport"   "lravet"      "treat"      
## [891] "eret"        "eroublt"     "erut"        "trust"       "yrt"        
## [896] "yuesdat"     "nurt"        "ewelvt"      "ywentt"      "owt"        
## [901] "eypt"        "rndeu"       "dnderstanu"  "nniou"       "tniu"       
## [906] "enitu"       "yniversitu"  "snlesu"      "lntiu"       "pu"         
## [911] "npou"        "esu"         "lsuau"       "ealuv"       "sariouv"    
## [916] "yerv"        "oidev"       "wiev"        "eillagv"     "tisiv"      
## [921] "eotv"        "eagw"        "taiw"        "kalw"        "lalw"       
## [926] "tanw"        "raw"         "marw"        "hasw"        "eastw"      
## [931] "hatcw"       "ratew"       "yaw"         "ew"          "reaw"       
## [936] "yednesdaw"   "eew"         "keew"        "heigw"       "eelcomw"    
## [941] "lelw"        "tesw"        "thaw"        "nhew"        "eherw"      
## [946] "rhethew"     "hhicw"       "ehilw"       "ehitw"       "ohw"        
## [951] "eholw"       "yhw"         "eidw"        "eifw"        "lilw"       
## [956] "niw"         "dinw"        "window"      "hisw"        "hitw"       
## [961] "nithiw"      "tithouw"     "nomaw"       "rondew"      "doow"       
## [966] "dorw"        "korw"        "dorlw"       "yorrw"       "eorsw"      
## [971] "hortw"       "doulw"       "eritw"       "gronw"       "reay"       
## [976] "sey"         "yesterday"   "tey"         "uoy"         "gouny"
```

## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:


```r
summary(cars)
```

```
##      speed           dist       
##  Min.   : 4.0   Min.   :  2.00  
##  1st Qu.:12.0   1st Qu.: 26.00  
##  Median :15.0   Median : 36.00  
##  Mean   :15.4   Mean   : 42.98  
##  3rd Qu.:19.0   3rd Qu.: 56.00  
##  Max.   :25.0   Max.   :120.00
```

## Including Plots

You can also embed plots, for example:

![](Test1_files/figure-html/pressure-1.png)<!-- -->

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
