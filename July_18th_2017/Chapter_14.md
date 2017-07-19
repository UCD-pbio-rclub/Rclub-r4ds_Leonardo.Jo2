# Chapter_14
Leonardo Jo  
July 19, 2017  


```r
knitr::opts_chunk$set(echo = TRUE)

## 14.3 Matching patterns with regular expressions

x <- c("apple", "banana", "pear")
str_view(x, "an")
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
str_view(x, ".a.")
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
dot <- "\\."
dot
```

```
## [1] "\\."
```

```r
writeLines(dot)
```

```
## \.
```

```r
str_view(c("abc", "a.c", "bef"), "a\\.c")
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
x <- "a\\b"
writeLines(x)
```

```
## a\b
```

```r
str_view(x, "\\\\")
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
## 14.3.1.1 Exercises
## Explain why each of these strings don’t match a \: "\", "\\", "\\\"
a <- c("\\", "\\\\\\", "\\\\")
str_view(a,"\\\\")
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
a
```

```
## [1] "\\"     "\\\\\\" "\\\\"
```

```r
writeLines(a)
```

```
## \
## \\\
## \\
```

```r
## 14.3.2 Anchors

x <- c("apple", "banana", "pear")
str_view(x, "[na]{4}")
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
x <- c("apple pie", "apple", "apple cake")
str_view(x, "apple")
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
str_view(x, "^apple$")
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
## Exercise 14.3.2.1
## How would you match the literal string "$^$"?
a <- "$^$"
b <- c("$^$", "$^$.", "$^$..")
str_view(b, "\\$\\^\\$")
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
writeLines(a)
```

```
## $^$
```

```r
## Given the corpus of common words in stringr::words, create regular expressions that find all words that:
a <- stringr::words
##Start with “y”.
str_view(a, "^y", match = T)
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
##End with “x”
str_view(a, "x$", match = T)
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
str_view(a, "^y.+y$", match = T)
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
##Are exactly three letters long. (Don’t cheat by using str_length()!)
str_view(a, "^.{3}$", match = T)
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
##Have seven letters or more.
str_view(a, "^.{7}+", match = T)
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
##Since this list is long, you might want to use the match argument to str_view() to show only the matching or non-matching words.


## 14.3.3 Character classes and alternatives
str_view(c("grey", "gray"), "gr(e|a)y") ## | or
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
##  14.3.3.1 Exercises
## Create regular expressions to find all words that:
## Start with a vowel.
str_view(a, "^[aeiou]", match = T)
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
## That only contain consonants. (Hint: thinking about matching “not”-vowels.)
str_view(a, "^[^aeiou]+$", match = T)
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
## End with ed, but not with eed.
str_view(a, "ed+$", match = T)
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
str_view(a, "[^e]ed+$", match = T)
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
## End with ing or ise
str_view(a, "(ing$|ise$)", match = T)
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
## Empirically verify the rule “i before e except after c”.
a <- stringr::words
a
```

```
##   [1] "a"           "able"        "about"       "absolute"    "accept"     
##   [6] "account"     "achieve"     "across"      "act"         "active"     
##  [11] "actual"      "add"         "address"     "admit"       "advertise"  
##  [16] "affect"      "afford"      "after"       "afternoon"   "again"      
##  [21] "against"     "age"         "agent"       "ago"         "agree"      
##  [26] "air"         "all"         "allow"       "almost"      "along"      
##  [31] "already"     "alright"     "also"        "although"    "always"     
##  [36] "america"     "amount"      "and"         "another"     "answer"     
##  [41] "any"         "apart"       "apparent"    "appear"      "apply"      
##  [46] "appoint"     "approach"    "appropriate" "area"        "argue"      
##  [51] "arm"         "around"      "arrange"     "art"         "as"         
##  [56] "ask"         "associate"   "assume"      "at"          "attend"     
##  [61] "authority"   "available"   "aware"       "away"        "awful"      
##  [66] "baby"        "back"        "bad"         "bag"         "balance"    
##  [71] "ball"        "bank"        "bar"         "base"        "basis"      
##  [76] "be"          "bear"        "beat"        "beauty"      "because"    
##  [81] "become"      "bed"         "before"      "begin"       "behind"     
##  [86] "believe"     "benefit"     "best"        "bet"         "between"    
##  [91] "big"         "bill"        "birth"       "bit"         "black"      
##  [96] "bloke"       "blood"       "blow"        "blue"        "board"      
## [101] "boat"        "body"        "book"        "both"        "bother"     
## [106] "bottle"      "bottom"      "box"         "boy"         "break"      
## [111] "brief"       "brilliant"   "bring"       "britain"     "brother"    
## [116] "budget"      "build"       "bus"         "business"    "busy"       
## [121] "but"         "buy"         "by"          "cake"        "call"       
## [126] "can"         "car"         "card"        "care"        "carry"      
## [131] "case"        "cat"         "catch"       "cause"       "cent"       
## [136] "centre"      "certain"     "chair"       "chairman"    "chance"     
## [141] "change"      "chap"        "character"   "charge"      "cheap"      
## [146] "check"       "child"       "choice"      "choose"      "Christ"     
## [151] "Christmas"   "church"      "city"        "claim"       "class"      
## [156] "clean"       "clear"       "client"      "clock"       "close"      
## [161] "closes"      "clothe"      "club"        "coffee"      "cold"       
## [166] "colleague"   "collect"     "college"     "colour"      "come"       
## [171] "comment"     "commit"      "committee"   "common"      "community"  
## [176] "company"     "compare"     "complete"    "compute"     "concern"    
## [181] "condition"   "confer"      "consider"    "consult"     "contact"    
## [186] "continue"    "contract"    "control"     "converse"    "cook"       
## [191] "copy"        "corner"      "correct"     "cost"        "could"      
## [196] "council"     "count"       "country"     "county"      "couple"     
## [201] "course"      "court"       "cover"       "create"      "cross"      
## [206] "cup"         "current"     "cut"         "dad"         "danger"     
## [211] "date"        "day"         "dead"        "deal"        "dear"       
## [216] "debate"      "decide"      "decision"    "deep"        "definite"   
## [221] "degree"      "department"  "depend"      "describe"    "design"     
## [226] "detail"      "develop"     "die"         "difference"  "difficult"  
## [231] "dinner"      "direct"      "discuss"     "district"    "divide"     
## [236] "do"          "doctor"      "document"    "dog"         "door"       
## [241] "double"      "doubt"       "down"        "draw"        "dress"      
## [246] "drink"       "drive"       "drop"        "dry"         "due"        
## [251] "during"      "each"        "early"       "east"        "easy"       
## [256] "eat"         "economy"     "educate"     "effect"      "egg"        
## [261] "eight"       "either"      "elect"       "electric"    "eleven"     
## [266] "else"        "employ"      "encourage"   "end"         "engine"     
## [271] "english"     "enjoy"       "enough"      "enter"       "environment"
## [276] "equal"       "especial"    "europe"      "even"        "evening"    
## [281] "ever"        "every"       "evidence"    "exact"       "example"    
## [286] "except"      "excuse"      "exercise"    "exist"       "expect"     
## [291] "expense"     "experience"  "explain"     "express"     "extra"      
## [296] "eye"         "face"        "fact"        "fair"        "fall"       
## [301] "family"      "far"         "farm"        "fast"        "father"     
## [306] "favour"      "feed"        "feel"        "few"         "field"      
## [311] "fight"       "figure"      "file"        "fill"        "film"       
## [316] "final"       "finance"     "find"        "fine"        "finish"     
## [321] "fire"        "first"       "fish"        "fit"         "five"       
## [326] "flat"        "floor"       "fly"         "follow"      "food"       
## [331] "foot"        "for"         "force"       "forget"      "form"       
## [336] "fortune"     "forward"     "four"        "france"      "free"       
## [341] "friday"      "friend"      "from"        "front"       "full"       
## [346] "fun"         "function"    "fund"        "further"     "future"     
## [351] "game"        "garden"      "gas"         "general"     "germany"    
## [356] "get"         "girl"        "give"        "glass"       "go"         
## [361] "god"         "good"        "goodbye"     "govern"      "grand"      
## [366] "grant"       "great"       "green"       "ground"      "group"      
## [371] "grow"        "guess"       "guy"         "hair"        "half"       
## [376] "hall"        "hand"        "hang"        "happen"      "happy"      
## [381] "hard"        "hate"        "have"        "he"          "head"       
## [386] "health"      "hear"        "heart"       "heat"        "heavy"      
## [391] "hell"        "help"        "here"        "high"        "history"    
## [396] "hit"         "hold"        "holiday"     "home"        "honest"     
## [401] "hope"        "horse"       "hospital"    "hot"         "hour"       
## [406] "house"       "how"         "however"     "hullo"       "hundred"    
## [411] "husband"     "idea"        "identify"    "if"          "imagine"    
## [416] "important"   "improve"     "in"          "include"     "income"     
## [421] "increase"    "indeed"      "individual"  "industry"    "inform"     
## [426] "inside"      "instead"     "insure"      "interest"    "into"       
## [431] "introduce"   "invest"      "involve"     "issue"       "it"         
## [436] "item"        "jesus"       "job"         "join"        "judge"      
## [441] "jump"        "just"        "keep"        "key"         "kid"        
## [446] "kill"        "kind"        "king"        "kitchen"     "knock"      
## [451] "know"        "labour"      "lad"         "lady"        "land"       
## [456] "language"    "large"       "last"        "late"        "laugh"      
## [461] "law"         "lay"         "lead"        "learn"       "leave"      
## [466] "left"        "leg"         "less"        "let"         "letter"     
## [471] "level"       "lie"         "life"        "light"       "like"       
## [476] "likely"      "limit"       "line"        "link"        "list"       
## [481] "listen"      "little"      "live"        "load"        "local"      
## [486] "lock"        "london"      "long"        "look"        "lord"       
## [491] "lose"        "lot"         "love"        "low"         "luck"       
## [496] "lunch"       "machine"     "main"        "major"       "make"       
## [501] "man"         "manage"      "many"        "mark"        "market"     
## [506] "marry"       "match"       "matter"      "may"         "maybe"      
## [511] "mean"        "meaning"     "measure"     "meet"        "member"     
## [516] "mention"     "middle"      "might"       "mile"        "milk"       
## [521] "million"     "mind"        "minister"    "minus"       "minute"     
## [526] "miss"        "mister"      "moment"      "monday"      "money"      
## [531] "month"       "more"        "morning"     "most"        "mother"     
## [536] "motion"      "move"        "mrs"         "much"        "music"      
## [541] "must"        "name"        "nation"      "nature"      "near"       
## [546] "necessary"   "need"        "never"       "new"         "news"       
## [551] "next"        "nice"        "night"       "nine"        "no"         
## [556] "non"         "none"        "normal"      "north"       "not"        
## [561] "note"        "notice"      "now"         "number"      "obvious"    
## [566] "occasion"    "odd"         "of"          "off"         "offer"      
## [571] "office"      "often"       "okay"        "old"         "on"         
## [576] "once"        "one"         "only"        "open"        "operate"    
## [581] "opportunity" "oppose"      "or"          "order"       "organize"   
## [586] "original"    "other"       "otherwise"   "ought"       "out"        
## [591] "over"        "own"         "pack"        "page"        "paint"      
## [596] "pair"        "paper"       "paragraph"   "pardon"      "parent"     
## [601] "park"        "part"        "particular"  "party"       "pass"       
## [606] "past"        "pay"         "pence"       "pension"     "people"     
## [611] "per"         "percent"     "perfect"     "perhaps"     "period"     
## [616] "person"      "photograph"  "pick"        "picture"     "piece"      
## [621] "place"       "plan"        "play"        "please"      "plus"       
## [626] "point"       "police"      "policy"      "politic"     "poor"       
## [631] "position"    "positive"    "possible"    "post"        "pound"      
## [636] "power"       "practise"    "prepare"     "present"     "press"      
## [641] "pressure"    "presume"     "pretty"      "previous"    "price"      
## [646] "print"       "private"     "probable"    "problem"     "proceed"    
## [651] "process"     "produce"     "product"     "programme"   "project"    
## [656] "proper"      "propose"     "protect"     "provide"     "public"     
## [661] "pull"        "purpose"     "push"        "put"         "quality"    
## [666] "quarter"     "question"    "quick"       "quid"        "quiet"      
## [671] "quite"       "radio"       "rail"        "raise"       "range"      
## [676] "rate"        "rather"      "read"        "ready"       "real"       
## [681] "realise"     "really"      "reason"      "receive"     "recent"     
## [686] "reckon"      "recognize"   "recommend"   "record"      "red"        
## [691] "reduce"      "refer"       "regard"      "region"      "relation"   
## [696] "remember"    "report"      "represent"   "require"     "research"   
## [701] "resource"    "respect"     "responsible" "rest"        "result"     
## [706] "return"      "rid"         "right"       "ring"        "rise"       
## [711] "road"        "role"        "roll"        "room"        "round"      
## [716] "rule"        "run"         "safe"        "sale"        "same"       
## [721] "saturday"    "save"        "say"         "scheme"      "school"     
## [726] "science"     "score"       "scotland"    "seat"        "second"     
## [731] "secretary"   "section"     "secure"      "see"         "seem"       
## [736] "self"        "sell"        "send"        "sense"       "separate"   
## [741] "serious"     "serve"       "service"     "set"         "settle"     
## [746] "seven"       "sex"         "shall"       "share"       "she"        
## [751] "sheet"       "shoe"        "shoot"       "shop"        "short"      
## [756] "should"      "show"        "shut"        "sick"        "side"       
## [761] "sign"        "similar"     "simple"      "since"       "sing"       
## [766] "single"      "sir"         "sister"      "sit"         "site"       
## [771] "situate"     "six"         "size"        "sleep"       "slight"     
## [776] "slow"        "small"       "smoke"       "so"          "social"     
## [781] "society"     "some"        "son"         "soon"        "sorry"      
## [786] "sort"        "sound"       "south"       "space"       "speak"      
## [791] "special"     "specific"    "speed"       "spell"       "spend"      
## [796] "square"      "staff"       "stage"       "stairs"      "stand"      
## [801] "standard"    "start"       "state"       "station"     "stay"       
## [806] "step"        "stick"       "still"       "stop"        "story"      
## [811] "straight"    "strategy"    "street"      "strike"      "strong"     
## [816] "structure"   "student"     "study"       "stuff"       "stupid"     
## [821] "subject"     "succeed"     "such"        "sudden"      "suggest"    
## [826] "suit"        "summer"      "sun"         "sunday"      "supply"     
## [831] "support"     "suppose"     "sure"        "surprise"    "switch"     
## [836] "system"      "table"       "take"        "talk"        "tape"       
## [841] "tax"         "tea"         "teach"       "team"        "telephone"  
## [846] "television"  "tell"        "ten"         "tend"        "term"       
## [851] "terrible"    "test"        "than"        "thank"       "the"        
## [856] "then"        "there"       "therefore"   "they"        "thing"      
## [861] "think"       "thirteen"    "thirty"      "this"        "thou"       
## [866] "though"      "thousand"    "three"       "through"     "throw"      
## [871] "thursday"    "tie"         "time"        "to"          "today"      
## [876] "together"    "tomorrow"    "tonight"     "too"         "top"        
## [881] "total"       "touch"       "toward"      "town"        "trade"      
## [886] "traffic"     "train"       "transport"   "travel"      "treat"      
## [891] "tree"        "trouble"     "true"        "trust"       "try"        
## [896] "tuesday"     "turn"        "twelve"      "twenty"      "two"        
## [901] "type"        "under"       "understand"  "union"       "unit"       
## [906] "unite"       "university"  "unless"      "until"       "up"         
## [911] "upon"        "use"         "usual"       "value"       "various"    
## [916] "very"        "video"       "view"        "village"     "visit"      
## [921] "vote"        "wage"        "wait"        "walk"        "wall"       
## [926] "want"        "war"         "warm"        "wash"        "waste"      
## [931] "watch"       "water"       "way"         "we"          "wear"       
## [936] "wednesday"   "wee"         "week"        "weigh"       "welcome"    
## [941] "well"        "west"        "what"        "when"        "where"      
## [946] "whether"     "which"       "while"       "white"       "who"        
## [951] "whole"       "why"         "wide"        "wife"        "will"       
## [956] "win"         "wind"        "window"      "wish"        "with"       
## [961] "within"      "without"     "woman"       "wonder"      "wood"       
## [966] "word"        "work"        "world"       "worry"       "worse"      
## [971] "worth"       "would"       "write"       "wrong"       "year"       
## [976] "yes"         "yesterday"   "yet"         "you"         "young"
```

```r
str_view(a, "[c][i]e", match = T)
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
## Is “q” always followed by a “u”?

str_view(a, "[q]+", match = T)
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
str_view(a, "[q][^u]+", match = T)
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
## Write a regular expression that matches a word if it’s probably written in British English, not American English.

## Create a regular expression that will match telephone numbers as commonly written in your country.       
a <- c("000-000-0000","000-0000-0000")
str_view(a, "[\\d]{3}-[\\d]{3}-[\\d]{4}")
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
## 14.3.4 Repetition

x <- "1888 is the longest year in Roman numerals: MDCCCLXXXVIII"
str_view(x, "CC?")
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
str_view(x, "CC+")
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
str_view(x, "CC*")
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
str_view(x, 'C[LX]+')
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
str_view(x, "C{2,3}")
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
str_view(x, 'C{2,3}?')
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
## 14.3.4.1 Exercises

## 1. Describe the equivalents of ?, +, * in {m,n} form.
str_view(x, "1?")
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
str_view(x, "1{0,1}")
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
str_view(x, "X+")
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
str_view(x, "X{1,10000}")
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
str_view(x, "1*")
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
str_view(x, "1{0,10000}")
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
## 2. Describe in words what these regular expressions match: (read carefully to see if I’m using a regular expression or a string that defines a regular expression.)

## ^.*$ ANY string that start with character and finishes as a character
str_view(x, "^.*$")
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
##  "\\{.+\\}"
a <- "{aa}bb"
str_view(a, "\\{.+\\}") ## \\ to specifiy that {} are characters
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
##\d{4}-\d{2}-\d{2}
b <- "1234-22-33"
str_view(b, "\\d{4}-\\d{2}-\\d{2}")
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
## "\\\\{4}"
c <- "\\\\\\\\\\\\\\\\"
str_view(c, "\\\\{4}")
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
## 3. Create regular expressions to find all words that:
a <- stringr::words

##Start with three consonants.
a %>%
  str_view("^[^aeiou]{3}", match = T)
```

```
## Error in eval(expr, envir, enclos): could not find function "%>%"
```

```r
##Have three or more vowels in a row.
a %>%
  str_view("[aeiou]{3}", match = T)
```

```
## Error in eval(expr, envir, enclos): could not find function "%>%"
```

```r
##Have two or more vowel-consonant pairs in a row.
a %>%
  str_view("([aeiou][^aeiou]){2,100}", match = T)
```

```
## Error in eval(expr, envir, enclos): could not find function "%>%"
```

```r
##Solve the beginner regexp crosswords at https://regexcrossword.com/challenges/beginner.


## 14.3.5 Grouping and backreferences

str_view(fruit, "(..)\\1", match = TRUE)
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
## 14.3.5.1 Exercises

## 1. Describe, in words, what these expressions will match:

##(.)\1\1 
a <- c("aaaaddddcccc","bb")
str_view(a, "(.)\\1\\1\\1")
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
## "(.)(.)\\2\\1"
str_view(a, "(.)(.)\\2\\1")
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
## (..)\1
## "(.).\\1.\\1"
## "(.)(.)(.).*\\3\\2\\1"

## Didn't really get this part

## Construct regular expressions to match words that:
a <- stringr::words
## Start and end with the same character.
str_view(a, "^(.).+(.)\\1$", match = T)
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
## Contain a repeated pair of letters (e.g. “church” contains “ch” repeated twice.)
str_view(a, "(..)", match = T)
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
## 14.4 Tools

x <- c("apple", "banana", "pear")
str_detect(x, "e")
```

```
## Error in eval(expr, envir, enclos): could not find function "str_detect"
```

```r
#> [1]  TRUE FALSE  TRUE

# How many common words start with t?
##LOGIC ARGUMENTS in a numeric context, FALSE = 0 and TRUE = 0
sum(str_detect(words, "^t"))
```

```
## Error in eval(expr, envir, enclos): could not find function "str_detect"
```

```r
# What proportion of common words end with a vowel?
mean(str_detect(words, "[aeiou]$"))
```

```
## Error in mean(str_detect(words, "[aeiou]$")): could not find function "str_detect"
```

```r
#> [1] 0.277

# Find all words containing at least one vowel, and negate
no_vowels_1 <- !str_detect(words, "[aeiou]")
```

```
## Error in eval(expr, envir, enclos): could not find function "str_detect"
```

```r
# Find all words consisting only of consonants (non-vowels)
no_vowels_2 <- str_detect(words, "^[^aeiou]+$")
```

```
## Error in eval(expr, envir, enclos): could not find function "str_detect"
```

```r
identical(no_vowels_1, no_vowels_2)
```

```
## Error in identical(no_vowels_1, no_vowels_2): object 'no_vowels_1' not found
```

```r
words[str_detect(words, "x$")]
```

```
## Error in eval(expr, envir, enclos): object 'words' not found
```

```r
#> [1] "box" "sex" "six" "tax"
str_subset(words, "x$")
```

```
## Error in eval(expr, envir, enclos): could not find function "str_subset"
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
## Error in eval(expr, envir, enclos): could not find function "%>%"
```

```r
x <- c("apple", "banana", "pear")
str_count(x, "a")
```

```
## Error in eval(expr, envir, enclos): could not find function "str_count"
```

```r
#> [1] 1 3 1

# On average, how many vowels per word?
mean(str_count(words, "[aeiou]"))
```

```
## Error in mean(str_count(words, "[aeiou]")): could not find function "str_count"
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
## Error in eval(expr, envir, enclos): could not find function "%>%"
```

```r
str_count("abababa", "aba")
```

```
## Error in eval(expr, envir, enclos): could not find function "str_count"
```

```r
#> [1] 2
str_view_all("abababa", "aba")
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view_all"
```

```r
## 14.4.2 Exercises

## 1. For each of the following challenges, try solving it by using both a single regular expression, and a combination of multiple str_detect() calls.

## Find all words that start or end with x.
df %>% filter(str_detect(words, "x$")) # Four Words
```

```
## Error in eval(expr, envir, enclos): could not find function "%>%"
```

```r
df %>% filter(str_detect(words, "^x")) # Zero Words
```

```
## Error in eval(expr, envir, enclos): could not find function "%>%"
```

```r
df %>% filter(str_detect(words, "^(x)|(x)$")) 
```

```
## Error in eval(expr, envir, enclos): could not find function "%>%"
```

```r
## Find all words that start with a vowel and end with a consonant.
df %>% filter(str_detect(words, "^[aeiou].*[^aeiou]$"))
```

```
## Error in eval(expr, envir, enclos): could not find function "%>%"
```

```r
## Are there any words that contain at least one of each different vowel?
a <- df %>% filter(str_detect(words, "[a]+"))
```

```
## Error in eval(expr, envir, enclos): could not find function "%>%"
```

```r
e <- df %>% filter(str_detect(words, "[e]+"))
```

```
## Error in eval(expr, envir, enclos): could not find function "%>%"
```

```r
i <- df %>% filter(str_detect(words, "[i]+"))
```

```
## Error in eval(expr, envir, enclos): could not find function "%>%"
```

```r
o <- df %>% filter(str_detect(words, "[o]+"))
```

```
## Error in eval(expr, envir, enclos): could not find function "%>%"
```

```r
u <- df %>% filter(str_detect(words, "[u]+"))
```

```
## Error in eval(expr, envir, enclos): could not find function "%>%"
```

```r
merge(a,e, by ="word") %>%
  merge(i, by ="word") %>%
  merge(o, by ="word") %>%
  merge(u, by ="word")
```

```
## Error in eval(expr, envir, enclos): could not find function "%>%"
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
## Error in eval(expr, envir, enclos): could not find function "%>%"
```

```r
df2 %>%
  filter(vowels == max(vowels))
```

```
## Error in eval(expr, envir, enclos): could not find function "%>%"
```

```r
df2 %>%
  filter(vowels.proportion == max(vowels.proportion))
```

```
## Error in eval(expr, envir, enclos): could not find function "%>%"
```

```r
## 14.4.3 Extract matches
length(sentences)
```

```
## Error in eval(expr, envir, enclos): object 'sentences' not found
```

```r
head(sentences)
```

```
## Error in head(sentences): object 'sentences' not found
```

```r
## Identifying every sentence that contains a collor
colours <- c("red", "orange", "yellow", "green", "blue", "purple")
colour_match <- str_c(colours, collapse = "|")
```

```
## Error in eval(expr, envir, enclos): could not find function "str_c"
```

```r
colour_match
```

```
## Error in eval(expr, envir, enclos): object 'colour_match' not found
```

```r
has_colour <- str_subset(sentences, colour_match)
```

```
## Error in eval(expr, envir, enclos): could not find function "str_subset"
```

```r
head(has_colour)
```

```
## Error in head(has_colour): object 'has_colour' not found
```

```r
matches <- str_extract(has_colour, colour_match)
```

```
## Error in eval(expr, envir, enclos): could not find function "str_extract"
```

```r
head(matches)
```

```
## Error in head(matches): object 'matches' not found
```

```r
more <- sentences[str_count(sentences, colour_match) > 1]
```

```
## Error in eval(expr, envir, enclos): object 'sentences' not found
```

```r
str_count(sentences, colour_match)
```

```
## Error in eval(expr, envir, enclos): could not find function "str_count"
```

```r
str_view_all(more, colour_match)
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view_all"
```

```r
str_view(more, colour_match) ## Differences?
```

```
## Error in eval(expr, envir, enclos): could not find function "str_view"
```

```r
str_extract(more, colour_match)
```

```
## Error in eval(expr, envir, enclos): could not find function "str_extract"
```

```r
str_extract_all(more, colour_match)
```

```
## Error in eval(expr, envir, enclos): could not find function "str_extract_all"
```

```r
str_extract_all(more, colour_match, simplify = T)
```

```
## Error in eval(expr, envir, enclos): could not find function "str_extract_all"
```

```r
x <- c("a", "a b", "a b c", "d")
str_extract_all(x, "[a-z]", simplify = TRUE)
```

```
## Error in eval(expr, envir, enclos): could not find function "str_extract_all"
```

```r
## 14.4.3.1 Exercises

## 1. In the previous example, you might have noticed that the regular expression matched “flickered”, which is not a colour. Modify the regex to fix the problem.
## adding spaces before each color
colours <- c(" red", " orange", " yellow", " green", " blue", " purple")
colour_match <- str_c(colours, collapse = "|")
```

```
## Error in eval(expr, envir, enclos): could not find function "str_c"
```

```r
more <- sentences[str_count(sentences, colour_match) > 1]
```

```
## Error in eval(expr, envir, enclos): object 'sentences' not found
```

```r
more
```

```
## Error in eval(expr, envir, enclos): object 'more' not found
```

```r
##From the Harvard sentences data, extract:
  
##The first word from each sentence.
first.word <- sentences %>%
  str_extract("^[\\w]+")
```

```
## Error in eval(expr, envir, enclos): could not find function "%>%"
```

```r
first.word
```

```
## Error in eval(expr, envir, enclos): object 'first.word' not found
```

```r
##All words ending in ing.

ing <- sentences[str_count(sentences, "[\\w]+ing") >= 1]
```

```
## Error in eval(expr, envir, enclos): object 'sentences' not found
```

```r
ing %>%
  str_extract_all("[\\w]+ing", simplify = T)
```

```
## Error in eval(expr, envir, enclos): could not find function "%>%"
```

```r
sentences %>%
  str_subset("[\\w]+ing") %>%
  str_extract_all("[\\w]+ing", simplify = T)
```

```
## Error in eval(expr, envir, enclos): could not find function "%>%"
```

```r
##All plurals.
plural <- sentences[str_count(sentences, "[\\w]+s[ ]|[\\w]+s[\\.]") >= 1]
```

```
## Error in eval(expr, envir, enclos): object 'sentences' not found
```

```r
plural %>%
  str_extract_all("[\\w]+s[ ]|[\\w]+s[\\.]", simplify = T)
```

```
## Error in eval(expr, envir, enclos): could not find function "%>%"
```

```r
sentences %>%
  str_subset("[\\w]+es[ ]|[\\w]+es[\\.]") %>%
  str_extract_all("[\\w]+es[ ]|[\\w]+es[\\.]", simplify = T)
```

```
## Error in eval(expr, envir, enclos): could not find function "%>%"
```

```r
## 14.4.4 Grouped matches
noun <- "(a|the) ([^ ]+)" ## what is ([^ ]+) 

has_noun <- sentences %>%
  str_subset(noun) %>%
  head(10)
```

```
## Error in eval(expr, envir, enclos): could not find function "%>%"
```

```r
has_noun
```

```
## Error in eval(expr, envir, enclos): object 'has_noun' not found
```

```r
has_noun %>% 
  str_extract(noun)
```

```
## Error in eval(expr, envir, enclos): could not find function "%>%"
```

```r
has_noun %>% str_match(noun) 
```

```
## Error in eval(expr, envir, enclos): could not find function "%>%"
```

```r
tibble(sentence = sentences) %>% 
  tidyr::extract(
    sentence, c("article", "noun"), "(a|the) ([^ ]+)", 
    remove = FALSE
  )
```

```
## Error in eval(expr, envir, enclos): could not find function "%>%"
```

```r
## 14.4.4.1 Exercises

## 1. Find all words that come after a “number” like “one”, “two”, “three” etc. Pull out both the number and the word.
number <- "(one|two|three|four|five|six|seven|eight|nine) ([^ ]+)" ## what is ([^ ]+) 

has_number <- sentences %>%
  str_subset(number)
```

```
## Error in eval(expr, envir, enclos): could not find function "%>%"
```

```r
has_number
```

```
## Error in eval(expr, envir, enclos): object 'has_number' not found
```

```r
has_number %>% 
  str_extract(number)
```

```
## Error in eval(expr, envir, enclos): could not find function "%>%"
```

```r
has_number %>% str_match(number) 
```

```
## Error in eval(expr, envir, enclos): could not find function "%>%"
```

```r
## 2. Find all contractions. Separate out the pieces before and after the apostrophe.
contractions <- "([^ ]+)(\\')([^ ]+)"
has_contractions <- sentences %>%
  str_subset(contractions)
```

```
## Error in eval(expr, envir, enclos): could not find function "%>%"
```

```r
has_contractions
```

```
## Error in eval(expr, envir, enclos): object 'has_contractions' not found
```

```r
has_contractions %>% str_match(contractions) 
```

```
## Error in eval(expr, envir, enclos): could not find function "%>%"
```

```r
## 14.4.5 Replacing matches
x <- c("apple", "pear", "banana")
str_replace(x, "[aeiou]", "-") ## Only changes one letter
```

```
## Error in eval(expr, envir, enclos): could not find function "str_replace"
```

```r
str_replace_all(x, "[aeiou]", "-") ## Changes all the letters
```

```
## Error in eval(expr, envir, enclos): could not find function "str_replace_all"
```

```r
x <- c("1 house", "2 cars", "3 people")
str_replace_all(x, c("1" = "one", "2" = "two", "3" = "three"))
```

```
## Error in eval(expr, envir, enclos): could not find function "str_replace_all"
```

```r
sentences %>% 
  str_replace("([^ ]+) ([^ ]+) ([^ ]+)", "\\1 \\3 \\2") %>% 
  head(5)
```

```
## Error in eval(expr, envir, enclos): could not find function "%>%"
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
## Error in eval(expr, envir, enclos): could not find function "%>%"
```

```r
## Implement a simple version of str_to_lower() using replace_all().

first.letter <- sentences %>%
  str_extract("^[\\w]")
```

```
## Error in eval(expr, envir, enclos): could not find function "%>%"
```

```r
lower.letter <- tolower(first.letter)
```

```
## Error in tolower(first.letter): object 'first.letter' not found
```

```r
sentences %>% 
  str_replace_all("^[\\w]", lower.letter) %>% 
  head(5)
```

```
## Error in eval(expr, envir, enclos): could not find function "%>%"
```

```r
## Switch the first and last letters in words. Which of those strings are still words?

words %>% 
  str_replace_all("^[\\w]", "[\\w]$") %>% 
  head(5) ## Don't Work!
```

```
## Error in eval(expr, envir, enclos): could not find function "%>%"
```

```r
words %>% 
  str_replace_all("(^[\\w]) ([\\w]$) ", "\\2 \\1") %>% 
  head(5) ## Don't Work!
```

```
## Error in eval(expr, envir, enclos): could not find function "%>%"
```

```r
last.letter <- words %>% 
  str_extract("[\\w]$")
```

```
## Error in eval(expr, envir, enclos): could not find function "%>%"
```

```r
last.letter
```

```
## Error in eval(expr, envir, enclos): object 'last.letter' not found
```

```r
first.letter <- words %>%
  str_extract("^[\\w]")
```

```
## Error in eval(expr, envir, enclos): could not find function "%>%"
```

```r
first.letter
```

```
## Error in eval(expr, envir, enclos): object 'first.letter' not found
```

```r
words %>% 
  str_replace_all("(^[\\w])", last.letter) %>%
  str_replace_all("([\\w]$)", first.letter)
```

```
## Error in eval(expr, envir, enclos): could not find function "%>%"
```

