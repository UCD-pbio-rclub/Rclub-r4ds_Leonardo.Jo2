# test
Leonardo Jo  
July 19, 2017  


```r
knitr::opts_chunk$set(echo = TRUE)

library(tidyverse)
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
## Conflicts with tidy packages ----------------------------------------------
```

```
## filter(): dplyr, stats
## lag():    dplyr, stats
```

```r
library(stringr)

## 14.3 Matching patterns with regular expressions

x <- c("apple", "banana", "pear")
str_view(x, "an")
```

<!--html_preserve--><div id="htmlwidget-845c20c6378324c469a2" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-845c20c6378324c469a2">{"x":{"html":"<ul>\n  <li>apple\u003c/li>\n  <li>b<span class='match'>an\u003c/span>ana\u003c/li>\n  <li>pear\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
str_view(x, ".a.")
```

<!--html_preserve--><div id="htmlwidget-37f6f9d7b871b79d5de9" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-37f6f9d7b871b79d5de9">{"x":{"html":"<ul>\n  <li>apple\u003c/li>\n  <li><span class='match'>ban\u003c/span>ana\u003c/li>\n  <li>p<span class='match'>ear\u003c/span>\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

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

<!--html_preserve--><div id="htmlwidget-7152ac51f46e764bc40b" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-7152ac51f46e764bc40b">{"x":{"html":"<ul>\n  <li>abc\u003c/li>\n  <li><span class='match'>a.c\u003c/span>\u003c/li>\n  <li>bef\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

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

<!--html_preserve--><div id="htmlwidget-c0bd242eeaf233aab760" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-c0bd242eeaf233aab760">{"x":{"html":"<ul>\n  <li>a<span class='match'>\\\u003c/span>b\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
## 14.3.1.1 Exercises
## Explain why each of these strings don’t match a \: "\", "\\", "\\\"
a <- c("\\", "\\\\\\", "\\\\")
str_view(a,"\\\\")
```

<!--html_preserve--><div id="htmlwidget-3f2c7ba8860492f3306a" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-3f2c7ba8860492f3306a">{"x":{"html":"<ul>\n  <li><span class='match'>\\\u003c/span>\u003c/li>\n  <li><span class='match'>\\\u003c/span>\\\\\u003c/li>\n  <li><span class='match'>\\\u003c/span>\\\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

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

<!--html_preserve--><div id="htmlwidget-e3be1ce92c21e34fabcd" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-e3be1ce92c21e34fabcd">{"x":{"html":"<ul>\n  <li>apple\u003c/li>\n  <li>b<span class='match'>anan\u003c/span>a\u003c/li>\n  <li>pear\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
x <- c("apple pie", "apple", "apple cake")
str_view(x, "apple")
```

<!--html_preserve--><div id="htmlwidget-0f8f5ef7aa546a78aa72" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-0f8f5ef7aa546a78aa72">{"x":{"html":"<ul>\n  <li><span class='match'>apple\u003c/span> pie\u003c/li>\n  <li><span class='match'>apple\u003c/span>\u003c/li>\n  <li><span class='match'>apple\u003c/span> cake\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
str_view(x, "^apple$")
```

<!--html_preserve--><div id="htmlwidget-a48d65a4c1a90bf98f25" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-a48d65a4c1a90bf98f25">{"x":{"html":"<ul>\n  <li>apple pie\u003c/li>\n  <li><span class='match'>apple\u003c/span>\u003c/li>\n  <li>apple cake\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
## Exercise 14.3.2.1
## How would you match the literal string "$^$"?
a <- "$^$"
b <- c("$^$", "$^$.", "$^$..")
str_view(b, "\\$\\^\\$")
```

<!--html_preserve--><div id="htmlwidget-61ae40b1559c4436daee" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-61ae40b1559c4436daee">{"x":{"html":"<ul>\n  <li><span class='match'>$^$\u003c/span>\u003c/li>\n  <li><span class='match'>$^$\u003c/span>.\u003c/li>\n  <li><span class='match'>$^$\u003c/span>..\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

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

<!--html_preserve--><div id="htmlwidget-4fa4d00ea42f7144d1d8" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-4fa4d00ea42f7144d1d8">{"x":{"html":"<ul>\n  <li><span class='match'>y\u003c/span>ear\u003c/li>\n  <li><span class='match'>y\u003c/span>es\u003c/li>\n  <li><span class='match'>y\u003c/span>esterday\u003c/li>\n  <li><span class='match'>y\u003c/span>et\u003c/li>\n  <li><span class='match'>y\u003c/span>ou\u003c/li>\n  <li><span class='match'>y\u003c/span>oung\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
##End with “x”
str_view(a, "x$", match = T)
```

<!--html_preserve--><div id="htmlwidget-a0412c0e573dd4798805" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-a0412c0e573dd4798805">{"x":{"html":"<ul>\n  <li>bo<span class='match'>x\u003c/span>\u003c/li>\n  <li>se<span class='match'>x\u003c/span>\u003c/li>\n  <li>si<span class='match'>x\u003c/span>\u003c/li>\n  <li>ta<span class='match'>x\u003c/span>\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
str_view(a, "^y.+y$", match = T)
```

<!--html_preserve--><div id="htmlwidget-f8ed203715af7a0f39b3" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-f8ed203715af7a0f39b3">{"x":{"html":"<ul>\n  <li><span class='match'>yesterday\u003c/span>\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
##Are exactly three letters long. (Don’t cheat by using str_length()!)
str_view(a, "^.{3}$", match = T)
```

<!--html_preserve--><div id="htmlwidget-14e11c767c57c9aab4a2" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-14e11c767c57c9aab4a2">{"x":{"html":"<ul>\n  <li><span class='match'>act\u003c/span>\u003c/li>\n  <li><span class='match'>add\u003c/span>\u003c/li>\n  <li><span class='match'>age\u003c/span>\u003c/li>\n  <li><span class='match'>ago\u003c/span>\u003c/li>\n  <li><span class='match'>air\u003c/span>\u003c/li>\n  <li><span class='match'>all\u003c/span>\u003c/li>\n  <li><span class='match'>and\u003c/span>\u003c/li>\n  <li><span class='match'>any\u003c/span>\u003c/li>\n  <li><span class='match'>arm\u003c/span>\u003c/li>\n  <li><span class='match'>art\u003c/span>\u003c/li>\n  <li><span class='match'>ask\u003c/span>\u003c/li>\n  <li><span class='match'>bad\u003c/span>\u003c/li>\n  <li><span class='match'>bag\u003c/span>\u003c/li>\n  <li><span class='match'>bar\u003c/span>\u003c/li>\n  <li><span class='match'>bed\u003c/span>\u003c/li>\n  <li><span class='match'>bet\u003c/span>\u003c/li>\n  <li><span class='match'>big\u003c/span>\u003c/li>\n  <li><span class='match'>bit\u003c/span>\u003c/li>\n  <li><span class='match'>box\u003c/span>\u003c/li>\n  <li><span class='match'>boy\u003c/span>\u003c/li>\n  <li><span class='match'>bus\u003c/span>\u003c/li>\n  <li><span class='match'>but\u003c/span>\u003c/li>\n  <li><span class='match'>buy\u003c/span>\u003c/li>\n  <li><span class='match'>can\u003c/span>\u003c/li>\n  <li><span class='match'>car\u003c/span>\u003c/li>\n  <li><span class='match'>cat\u003c/span>\u003c/li>\n  <li><span class='match'>cup\u003c/span>\u003c/li>\n  <li><span class='match'>cut\u003c/span>\u003c/li>\n  <li><span class='match'>dad\u003c/span>\u003c/li>\n  <li><span class='match'>day\u003c/span>\u003c/li>\n  <li><span class='match'>die\u003c/span>\u003c/li>\n  <li><span class='match'>dog\u003c/span>\u003c/li>\n  <li><span class='match'>dry\u003c/span>\u003c/li>\n  <li><span class='match'>due\u003c/span>\u003c/li>\n  <li><span class='match'>eat\u003c/span>\u003c/li>\n  <li><span class='match'>egg\u003c/span>\u003c/li>\n  <li><span class='match'>end\u003c/span>\u003c/li>\n  <li><span class='match'>eye\u003c/span>\u003c/li>\n  <li><span class='match'>far\u003c/span>\u003c/li>\n  <li><span class='match'>few\u003c/span>\u003c/li>\n  <li><span class='match'>fit\u003c/span>\u003c/li>\n  <li><span class='match'>fly\u003c/span>\u003c/li>\n  <li><span class='match'>for\u003c/span>\u003c/li>\n  <li><span class='match'>fun\u003c/span>\u003c/li>\n  <li><span class='match'>gas\u003c/span>\u003c/li>\n  <li><span class='match'>get\u003c/span>\u003c/li>\n  <li><span class='match'>god\u003c/span>\u003c/li>\n  <li><span class='match'>guy\u003c/span>\u003c/li>\n  <li><span class='match'>hit\u003c/span>\u003c/li>\n  <li><span class='match'>hot\u003c/span>\u003c/li>\n  <li><span class='match'>how\u003c/span>\u003c/li>\n  <li><span class='match'>job\u003c/span>\u003c/li>\n  <li><span class='match'>key\u003c/span>\u003c/li>\n  <li><span class='match'>kid\u003c/span>\u003c/li>\n  <li><span class='match'>lad\u003c/span>\u003c/li>\n  <li><span class='match'>law\u003c/span>\u003c/li>\n  <li><span class='match'>lay\u003c/span>\u003c/li>\n  <li><span class='match'>leg\u003c/span>\u003c/li>\n  <li><span class='match'>let\u003c/span>\u003c/li>\n  <li><span class='match'>lie\u003c/span>\u003c/li>\n  <li><span class='match'>lot\u003c/span>\u003c/li>\n  <li><span class='match'>low\u003c/span>\u003c/li>\n  <li><span class='match'>man\u003c/span>\u003c/li>\n  <li><span class='match'>may\u003c/span>\u003c/li>\n  <li><span class='match'>mrs\u003c/span>\u003c/li>\n  <li><span class='match'>new\u003c/span>\u003c/li>\n  <li><span class='match'>non\u003c/span>\u003c/li>\n  <li><span class='match'>not\u003c/span>\u003c/li>\n  <li><span class='match'>now\u003c/span>\u003c/li>\n  <li><span class='match'>odd\u003c/span>\u003c/li>\n  <li><span class='match'>off\u003c/span>\u003c/li>\n  <li><span class='match'>old\u003c/span>\u003c/li>\n  <li><span class='match'>one\u003c/span>\u003c/li>\n  <li><span class='match'>out\u003c/span>\u003c/li>\n  <li><span class='match'>own\u003c/span>\u003c/li>\n  <li><span class='match'>pay\u003c/span>\u003c/li>\n  <li><span class='match'>per\u003c/span>\u003c/li>\n  <li><span class='match'>put\u003c/span>\u003c/li>\n  <li><span class='match'>red\u003c/span>\u003c/li>\n  <li><span class='match'>rid\u003c/span>\u003c/li>\n  <li><span class='match'>run\u003c/span>\u003c/li>\n  <li><span class='match'>say\u003c/span>\u003c/li>\n  <li><span class='match'>see\u003c/span>\u003c/li>\n  <li><span class='match'>set\u003c/span>\u003c/li>\n  <li><span class='match'>sex\u003c/span>\u003c/li>\n  <li><span class='match'>she\u003c/span>\u003c/li>\n  <li><span class='match'>sir\u003c/span>\u003c/li>\n  <li><span class='match'>sit\u003c/span>\u003c/li>\n  <li><span class='match'>six\u003c/span>\u003c/li>\n  <li><span class='match'>son\u003c/span>\u003c/li>\n  <li><span class='match'>sun\u003c/span>\u003c/li>\n  <li><span class='match'>tax\u003c/span>\u003c/li>\n  <li><span class='match'>tea\u003c/span>\u003c/li>\n  <li><span class='match'>ten\u003c/span>\u003c/li>\n  <li><span class='match'>the\u003c/span>\u003c/li>\n  <li><span class='match'>tie\u003c/span>\u003c/li>\n  <li><span class='match'>too\u003c/span>\u003c/li>\n  <li><span class='match'>top\u003c/span>\u003c/li>\n  <li><span class='match'>try\u003c/span>\u003c/li>\n  <li><span class='match'>two\u003c/span>\u003c/li>\n  <li><span class='match'>use\u003c/span>\u003c/li>\n  <li><span class='match'>war\u003c/span>\u003c/li>\n  <li><span class='match'>way\u003c/span>\u003c/li>\n  <li><span class='match'>wee\u003c/span>\u003c/li>\n  <li><span class='match'>who\u003c/span>\u003c/li>\n  <li><span class='match'>why\u003c/span>\u003c/li>\n  <li><span class='match'>win\u003c/span>\u003c/li>\n  <li><span class='match'>yes\u003c/span>\u003c/li>\n  <li><span class='match'>yet\u003c/span>\u003c/li>\n  <li><span class='match'>you\u003c/span>\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
##Have seven letters or more.
str_view(a, "^.{7}+", match = T)
```

<!--html_preserve--><div id="htmlwidget-8a3e478d0d8478880cce" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-8a3e478d0d8478880cce">{"x":{"html":"<ul>\n  <li><span class='match'>absolut\u003c/span>e\u003c/li>\n  <li><span class='match'>account\u003c/span>\u003c/li>\n  <li><span class='match'>achieve\u003c/span>\u003c/li>\n  <li><span class='match'>address\u003c/span>\u003c/li>\n  <li><span class='match'>adverti\u003c/span>se\u003c/li>\n  <li><span class='match'>afterno\u003c/span>on\u003c/li>\n  <li><span class='match'>against\u003c/span>\u003c/li>\n  <li><span class='match'>already\u003c/span>\u003c/li>\n  <li><span class='match'>alright\u003c/span>\u003c/li>\n  <li><span class='match'>althoug\u003c/span>h\u003c/li>\n  <li><span class='match'>america\u003c/span>\u003c/li>\n  <li><span class='match'>another\u003c/span>\u003c/li>\n  <li><span class='match'>apparen\u003c/span>t\u003c/li>\n  <li><span class='match'>appoint\u003c/span>\u003c/li>\n  <li><span class='match'>approac\u003c/span>h\u003c/li>\n  <li><span class='match'>appropr\u003c/span>iate\u003c/li>\n  <li><span class='match'>arrange\u003c/span>\u003c/li>\n  <li><span class='match'>associa\u003c/span>te\u003c/li>\n  <li><span class='match'>authori\u003c/span>ty\u003c/li>\n  <li><span class='match'>availab\u003c/span>le\u003c/li>\n  <li><span class='match'>balance\u003c/span>\u003c/li>\n  <li><span class='match'>because\u003c/span>\u003c/li>\n  <li><span class='match'>believe\u003c/span>\u003c/li>\n  <li><span class='match'>benefit\u003c/span>\u003c/li>\n  <li><span class='match'>between\u003c/span>\u003c/li>\n  <li><span class='match'>brillia\u003c/span>nt\u003c/li>\n  <li><span class='match'>britain\u003c/span>\u003c/li>\n  <li><span class='match'>brother\u003c/span>\u003c/li>\n  <li><span class='match'>busines\u003c/span>s\u003c/li>\n  <li><span class='match'>certain\u003c/span>\u003c/li>\n  <li><span class='match'>chairma\u003c/span>n\u003c/li>\n  <li><span class='match'>charact\u003c/span>er\u003c/li>\n  <li><span class='match'>Christm\u003c/span>as\u003c/li>\n  <li><span class='match'>colleag\u003c/span>ue\u003c/li>\n  <li><span class='match'>collect\u003c/span>\u003c/li>\n  <li><span class='match'>college\u003c/span>\u003c/li>\n  <li><span class='match'>comment\u003c/span>\u003c/li>\n  <li><span class='match'>committ\u003c/span>ee\u003c/li>\n  <li><span class='match'>communi\u003c/span>ty\u003c/li>\n  <li><span class='match'>company\u003c/span>\u003c/li>\n  <li><span class='match'>compare\u003c/span>\u003c/li>\n  <li><span class='match'>complet\u003c/span>e\u003c/li>\n  <li><span class='match'>compute\u003c/span>\u003c/li>\n  <li><span class='match'>concern\u003c/span>\u003c/li>\n  <li><span class='match'>conditi\u003c/span>on\u003c/li>\n  <li><span class='match'>conside\u003c/span>r\u003c/li>\n  <li><span class='match'>consult\u003c/span>\u003c/li>\n  <li><span class='match'>contact\u003c/span>\u003c/li>\n  <li><span class='match'>continu\u003c/span>e\u003c/li>\n  <li><span class='match'>contrac\u003c/span>t\u003c/li>\n  <li><span class='match'>control\u003c/span>\u003c/li>\n  <li><span class='match'>convers\u003c/span>e\u003c/li>\n  <li><span class='match'>correct\u003c/span>\u003c/li>\n  <li><span class='match'>council\u003c/span>\u003c/li>\n  <li><span class='match'>country\u003c/span>\u003c/li>\n  <li><span class='match'>current\u003c/span>\u003c/li>\n  <li><span class='match'>decisio\u003c/span>n\u003c/li>\n  <li><span class='match'>definit\u003c/span>e\u003c/li>\n  <li><span class='match'>departm\u003c/span>ent\u003c/li>\n  <li><span class='match'>describ\u003c/span>e\u003c/li>\n  <li><span class='match'>develop\u003c/span>\u003c/li>\n  <li><span class='match'>differe\u003c/span>nce\u003c/li>\n  <li><span class='match'>difficu\u003c/span>lt\u003c/li>\n  <li><span class='match'>discuss\u003c/span>\u003c/li>\n  <li><span class='match'>distric\u003c/span>t\u003c/li>\n  <li><span class='match'>documen\u003c/span>t\u003c/li>\n  <li><span class='match'>economy\u003c/span>\u003c/li>\n  <li><span class='match'>educate\u003c/span>\u003c/li>\n  <li><span class='match'>electri\u003c/span>c\u003c/li>\n  <li><span class='match'>encoura\u003c/span>ge\u003c/li>\n  <li><span class='match'>english\u003c/span>\u003c/li>\n  <li><span class='match'>environ\u003c/span>ment\u003c/li>\n  <li><span class='match'>especia\u003c/span>l\u003c/li>\n  <li><span class='match'>evening\u003c/span>\u003c/li>\n  <li><span class='match'>evidenc\u003c/span>e\u003c/li>\n  <li><span class='match'>example\u003c/span>\u003c/li>\n  <li><span class='match'>exercis\u003c/span>e\u003c/li>\n  <li><span class='match'>expense\u003c/span>\u003c/li>\n  <li><span class='match'>experie\u003c/span>nce\u003c/li>\n  <li><span class='match'>explain\u003c/span>\u003c/li>\n  <li><span class='match'>express\u003c/span>\u003c/li>\n  <li><span class='match'>finance\u003c/span>\u003c/li>\n  <li><span class='match'>fortune\u003c/span>\u003c/li>\n  <li><span class='match'>forward\u003c/span>\u003c/li>\n  <li><span class='match'>functio\u003c/span>n\u003c/li>\n  <li><span class='match'>further\u003c/span>\u003c/li>\n  <li><span class='match'>general\u003c/span>\u003c/li>\n  <li><span class='match'>germany\u003c/span>\u003c/li>\n  <li><span class='match'>goodbye\u003c/span>\u003c/li>\n  <li><span class='match'>history\u003c/span>\u003c/li>\n  <li><span class='match'>holiday\u003c/span>\u003c/li>\n  <li><span class='match'>hospita\u003c/span>l\u003c/li>\n  <li><span class='match'>however\u003c/span>\u003c/li>\n  <li><span class='match'>hundred\u003c/span>\u003c/li>\n  <li><span class='match'>husband\u003c/span>\u003c/li>\n  <li><span class='match'>identif\u003c/span>y\u003c/li>\n  <li><span class='match'>imagine\u003c/span>\u003c/li>\n  <li><span class='match'>importa\u003c/span>nt\u003c/li>\n  <li><span class='match'>improve\u003c/span>\u003c/li>\n  <li><span class='match'>include\u003c/span>\u003c/li>\n  <li><span class='match'>increas\u003c/span>e\u003c/li>\n  <li><span class='match'>individ\u003c/span>ual\u003c/li>\n  <li><span class='match'>industr\u003c/span>y\u003c/li>\n  <li><span class='match'>instead\u003c/span>\u003c/li>\n  <li><span class='match'>interes\u003c/span>t\u003c/li>\n  <li><span class='match'>introdu\u003c/span>ce\u003c/li>\n  <li><span class='match'>involve\u003c/span>\u003c/li>\n  <li><span class='match'>kitchen\u003c/span>\u003c/li>\n  <li><span class='match'>languag\u003c/span>e\u003c/li>\n  <li><span class='match'>machine\u003c/span>\u003c/li>\n  <li><span class='match'>meaning\u003c/span>\u003c/li>\n  <li><span class='match'>measure\u003c/span>\u003c/li>\n  <li><span class='match'>mention\u003c/span>\u003c/li>\n  <li><span class='match'>million\u003c/span>\u003c/li>\n  <li><span class='match'>ministe\u003c/span>r\u003c/li>\n  <li><span class='match'>morning\u003c/span>\u003c/li>\n  <li><span class='match'>necessa\u003c/span>ry\u003c/li>\n  <li><span class='match'>obvious\u003c/span>\u003c/li>\n  <li><span class='match'>occasio\u003c/span>n\u003c/li>\n  <li><span class='match'>operate\u003c/span>\u003c/li>\n  <li><span class='match'>opportu\u003c/span>nity\u003c/li>\n  <li><span class='match'>organiz\u003c/span>e\u003c/li>\n  <li><span class='match'>origina\u003c/span>l\u003c/li>\n  <li><span class='match'>otherwi\u003c/span>se\u003c/li>\n  <li><span class='match'>paragra\u003c/span>ph\u003c/li>\n  <li><span class='match'>particu\u003c/span>lar\u003c/li>\n  <li><span class='match'>pension\u003c/span>\u003c/li>\n  <li><span class='match'>percent\u003c/span>\u003c/li>\n  <li><span class='match'>perfect\u003c/span>\u003c/li>\n  <li><span class='match'>perhaps\u003c/span>\u003c/li>\n  <li><span class='match'>photogr\u003c/span>aph\u003c/li>\n  <li><span class='match'>picture\u003c/span>\u003c/li>\n  <li><span class='match'>politic\u003c/span>\u003c/li>\n  <li><span class='match'>positio\u003c/span>n\u003c/li>\n  <li><span class='match'>positiv\u003c/span>e\u003c/li>\n  <li><span class='match'>possibl\u003c/span>e\u003c/li>\n  <li><span class='match'>practis\u003c/span>e\u003c/li>\n  <li><span class='match'>prepare\u003c/span>\u003c/li>\n  <li><span class='match'>present\u003c/span>\u003c/li>\n  <li><span class='match'>pressur\u003c/span>e\u003c/li>\n  <li><span class='match'>presume\u003c/span>\u003c/li>\n  <li><span class='match'>previou\u003c/span>s\u003c/li>\n  <li><span class='match'>private\u003c/span>\u003c/li>\n  <li><span class='match'>probabl\u003c/span>e\u003c/li>\n  <li><span class='match'>problem\u003c/span>\u003c/li>\n  <li><span class='match'>proceed\u003c/span>\u003c/li>\n  <li><span class='match'>process\u003c/span>\u003c/li>\n  <li><span class='match'>produce\u003c/span>\u003c/li>\n  <li><span class='match'>product\u003c/span>\u003c/li>\n  <li><span class='match'>program\u003c/span>me\u003c/li>\n  <li><span class='match'>project\u003c/span>\u003c/li>\n  <li><span class='match'>propose\u003c/span>\u003c/li>\n  <li><span class='match'>protect\u003c/span>\u003c/li>\n  <li><span class='match'>provide\u003c/span>\u003c/li>\n  <li><span class='match'>purpose\u003c/span>\u003c/li>\n  <li><span class='match'>quality\u003c/span>\u003c/li>\n  <li><span class='match'>quarter\u003c/span>\u003c/li>\n  <li><span class='match'>questio\u003c/span>n\u003c/li>\n  <li><span class='match'>realise\u003c/span>\u003c/li>\n  <li><span class='match'>receive\u003c/span>\u003c/li>\n  <li><span class='match'>recogni\u003c/span>ze\u003c/li>\n  <li><span class='match'>recomme\u003c/span>nd\u003c/li>\n  <li><span class='match'>relatio\u003c/span>n\u003c/li>\n  <li><span class='match'>remembe\u003c/span>r\u003c/li>\n  <li><span class='match'>represe\u003c/span>nt\u003c/li>\n  <li><span class='match'>require\u003c/span>\u003c/li>\n  <li><span class='match'>researc\u003c/span>h\u003c/li>\n  <li><span class='match'>resourc\u003c/span>e\u003c/li>\n  <li><span class='match'>respect\u003c/span>\u003c/li>\n  <li><span class='match'>respons\u003c/span>ible\u003c/li>\n  <li><span class='match'>saturda\u003c/span>y\u003c/li>\n  <li><span class='match'>science\u003c/span>\u003c/li>\n  <li><span class='match'>scotlan\u003c/span>d\u003c/li>\n  <li><span class='match'>secreta\u003c/span>ry\u003c/li>\n  <li><span class='match'>section\u003c/span>\u003c/li>\n  <li><span class='match'>separat\u003c/span>e\u003c/li>\n  <li><span class='match'>serious\u003c/span>\u003c/li>\n  <li><span class='match'>service\u003c/span>\u003c/li>\n  <li><span class='match'>similar\u003c/span>\u003c/li>\n  <li><span class='match'>situate\u003c/span>\u003c/li>\n  <li><span class='match'>society\u003c/span>\u003c/li>\n  <li><span class='match'>special\u003c/span>\u003c/li>\n  <li><span class='match'>specifi\u003c/span>c\u003c/li>\n  <li><span class='match'>standar\u003c/span>d\u003c/li>\n  <li><span class='match'>station\u003c/span>\u003c/li>\n  <li><span class='match'>straigh\u003c/span>t\u003c/li>\n  <li><span class='match'>strateg\u003c/span>y\u003c/li>\n  <li><span class='match'>structu\u003c/span>re\u003c/li>\n  <li><span class='match'>student\u003c/span>\u003c/li>\n  <li><span class='match'>subject\u003c/span>\u003c/li>\n  <li><span class='match'>succeed\u003c/span>\u003c/li>\n  <li><span class='match'>suggest\u003c/span>\u003c/li>\n  <li><span class='match'>support\u003c/span>\u003c/li>\n  <li><span class='match'>suppose\u003c/span>\u003c/li>\n  <li><span class='match'>surpris\u003c/span>e\u003c/li>\n  <li><span class='match'>telepho\u003c/span>ne\u003c/li>\n  <li><span class='match'>televis\u003c/span>ion\u003c/li>\n  <li><span class='match'>terribl\u003c/span>e\u003c/li>\n  <li><span class='match'>therefo\u003c/span>re\u003c/li>\n  <li><span class='match'>thirtee\u003c/span>n\u003c/li>\n  <li><span class='match'>thousan\u003c/span>d\u003c/li>\n  <li><span class='match'>through\u003c/span>\u003c/li>\n  <li><span class='match'>thursda\u003c/span>y\u003c/li>\n  <li><span class='match'>togethe\u003c/span>r\u003c/li>\n  <li><span class='match'>tomorro\u003c/span>w\u003c/li>\n  <li><span class='match'>tonight\u003c/span>\u003c/li>\n  <li><span class='match'>traffic\u003c/span>\u003c/li>\n  <li><span class='match'>transpo\u003c/span>rt\u003c/li>\n  <li><span class='match'>trouble\u003c/span>\u003c/li>\n  <li><span class='match'>tuesday\u003c/span>\u003c/li>\n  <li><span class='match'>underst\u003c/span>and\u003c/li>\n  <li><span class='match'>univers\u003c/span>ity\u003c/li>\n  <li><span class='match'>various\u003c/span>\u003c/li>\n  <li><span class='match'>village\u003c/span>\u003c/li>\n  <li><span class='match'>wednesd\u003c/span>ay\u003c/li>\n  <li><span class='match'>welcome\u003c/span>\u003c/li>\n  <li><span class='match'>whether\u003c/span>\u003c/li>\n  <li><span class='match'>without\u003c/span>\u003c/li>\n  <li><span class='match'>yesterd\u003c/span>ay\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
##Since this list is long, you might want to use the match argument to str_view() to show only the matching or non-matching words.


## 14.3.3 Character classes and alternatives
str_view(c("grey", "gray"), "gr(e|a)y") ## | or
```

<!--html_preserve--><div id="htmlwidget-bbccce6eed81bf1fdc38" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-bbccce6eed81bf1fdc38">{"x":{"html":"<ul>\n  <li><span class='match'>grey\u003c/span>\u003c/li>\n  <li><span class='match'>gray\u003c/span>\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
##  14.3.3.1 Exercises
## Create regular expressions to find all words that:
## Start with a vowel.
str_view(a, "^[aeiou]", match = T)
```

<!--html_preserve--><div id="htmlwidget-349bcda7135403e687b2" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-349bcda7135403e687b2">{"x":{"html":"<ul>\n  <li><span class='match'>a\u003c/span>\u003c/li>\n  <li><span class='match'>a\u003c/span>ble\u003c/li>\n  <li><span class='match'>a\u003c/span>bout\u003c/li>\n  <li><span class='match'>a\u003c/span>bsolute\u003c/li>\n  <li><span class='match'>a\u003c/span>ccept\u003c/li>\n  <li><span class='match'>a\u003c/span>ccount\u003c/li>\n  <li><span class='match'>a\u003c/span>chieve\u003c/li>\n  <li><span class='match'>a\u003c/span>cross\u003c/li>\n  <li><span class='match'>a\u003c/span>ct\u003c/li>\n  <li><span class='match'>a\u003c/span>ctive\u003c/li>\n  <li><span class='match'>a\u003c/span>ctual\u003c/li>\n  <li><span class='match'>a\u003c/span>dd\u003c/li>\n  <li><span class='match'>a\u003c/span>ddress\u003c/li>\n  <li><span class='match'>a\u003c/span>dmit\u003c/li>\n  <li><span class='match'>a\u003c/span>dvertise\u003c/li>\n  <li><span class='match'>a\u003c/span>ffect\u003c/li>\n  <li><span class='match'>a\u003c/span>fford\u003c/li>\n  <li><span class='match'>a\u003c/span>fter\u003c/li>\n  <li><span class='match'>a\u003c/span>fternoon\u003c/li>\n  <li><span class='match'>a\u003c/span>gain\u003c/li>\n  <li><span class='match'>a\u003c/span>gainst\u003c/li>\n  <li><span class='match'>a\u003c/span>ge\u003c/li>\n  <li><span class='match'>a\u003c/span>gent\u003c/li>\n  <li><span class='match'>a\u003c/span>go\u003c/li>\n  <li><span class='match'>a\u003c/span>gree\u003c/li>\n  <li><span class='match'>a\u003c/span>ir\u003c/li>\n  <li><span class='match'>a\u003c/span>ll\u003c/li>\n  <li><span class='match'>a\u003c/span>llow\u003c/li>\n  <li><span class='match'>a\u003c/span>lmost\u003c/li>\n  <li><span class='match'>a\u003c/span>long\u003c/li>\n  <li><span class='match'>a\u003c/span>lready\u003c/li>\n  <li><span class='match'>a\u003c/span>lright\u003c/li>\n  <li><span class='match'>a\u003c/span>lso\u003c/li>\n  <li><span class='match'>a\u003c/span>lthough\u003c/li>\n  <li><span class='match'>a\u003c/span>lways\u003c/li>\n  <li><span class='match'>a\u003c/span>merica\u003c/li>\n  <li><span class='match'>a\u003c/span>mount\u003c/li>\n  <li><span class='match'>a\u003c/span>nd\u003c/li>\n  <li><span class='match'>a\u003c/span>nother\u003c/li>\n  <li><span class='match'>a\u003c/span>nswer\u003c/li>\n  <li><span class='match'>a\u003c/span>ny\u003c/li>\n  <li><span class='match'>a\u003c/span>part\u003c/li>\n  <li><span class='match'>a\u003c/span>pparent\u003c/li>\n  <li><span class='match'>a\u003c/span>ppear\u003c/li>\n  <li><span class='match'>a\u003c/span>pply\u003c/li>\n  <li><span class='match'>a\u003c/span>ppoint\u003c/li>\n  <li><span class='match'>a\u003c/span>pproach\u003c/li>\n  <li><span class='match'>a\u003c/span>ppropriate\u003c/li>\n  <li><span class='match'>a\u003c/span>rea\u003c/li>\n  <li><span class='match'>a\u003c/span>rgue\u003c/li>\n  <li><span class='match'>a\u003c/span>rm\u003c/li>\n  <li><span class='match'>a\u003c/span>round\u003c/li>\n  <li><span class='match'>a\u003c/span>rrange\u003c/li>\n  <li><span class='match'>a\u003c/span>rt\u003c/li>\n  <li><span class='match'>a\u003c/span>s\u003c/li>\n  <li><span class='match'>a\u003c/span>sk\u003c/li>\n  <li><span class='match'>a\u003c/span>ssociate\u003c/li>\n  <li><span class='match'>a\u003c/span>ssume\u003c/li>\n  <li><span class='match'>a\u003c/span>t\u003c/li>\n  <li><span class='match'>a\u003c/span>ttend\u003c/li>\n  <li><span class='match'>a\u003c/span>uthority\u003c/li>\n  <li><span class='match'>a\u003c/span>vailable\u003c/li>\n  <li><span class='match'>a\u003c/span>ware\u003c/li>\n  <li><span class='match'>a\u003c/span>way\u003c/li>\n  <li><span class='match'>a\u003c/span>wful\u003c/li>\n  <li><span class='match'>e\u003c/span>ach\u003c/li>\n  <li><span class='match'>e\u003c/span>arly\u003c/li>\n  <li><span class='match'>e\u003c/span>ast\u003c/li>\n  <li><span class='match'>e\u003c/span>asy\u003c/li>\n  <li><span class='match'>e\u003c/span>at\u003c/li>\n  <li><span class='match'>e\u003c/span>conomy\u003c/li>\n  <li><span class='match'>e\u003c/span>ducate\u003c/li>\n  <li><span class='match'>e\u003c/span>ffect\u003c/li>\n  <li><span class='match'>e\u003c/span>gg\u003c/li>\n  <li><span class='match'>e\u003c/span>ight\u003c/li>\n  <li><span class='match'>e\u003c/span>ither\u003c/li>\n  <li><span class='match'>e\u003c/span>lect\u003c/li>\n  <li><span class='match'>e\u003c/span>lectric\u003c/li>\n  <li><span class='match'>e\u003c/span>leven\u003c/li>\n  <li><span class='match'>e\u003c/span>lse\u003c/li>\n  <li><span class='match'>e\u003c/span>mploy\u003c/li>\n  <li><span class='match'>e\u003c/span>ncourage\u003c/li>\n  <li><span class='match'>e\u003c/span>nd\u003c/li>\n  <li><span class='match'>e\u003c/span>ngine\u003c/li>\n  <li><span class='match'>e\u003c/span>nglish\u003c/li>\n  <li><span class='match'>e\u003c/span>njoy\u003c/li>\n  <li><span class='match'>e\u003c/span>nough\u003c/li>\n  <li><span class='match'>e\u003c/span>nter\u003c/li>\n  <li><span class='match'>e\u003c/span>nvironment\u003c/li>\n  <li><span class='match'>e\u003c/span>qual\u003c/li>\n  <li><span class='match'>e\u003c/span>special\u003c/li>\n  <li><span class='match'>e\u003c/span>urope\u003c/li>\n  <li><span class='match'>e\u003c/span>ven\u003c/li>\n  <li><span class='match'>e\u003c/span>vening\u003c/li>\n  <li><span class='match'>e\u003c/span>ver\u003c/li>\n  <li><span class='match'>e\u003c/span>very\u003c/li>\n  <li><span class='match'>e\u003c/span>vidence\u003c/li>\n  <li><span class='match'>e\u003c/span>xact\u003c/li>\n  <li><span class='match'>e\u003c/span>xample\u003c/li>\n  <li><span class='match'>e\u003c/span>xcept\u003c/li>\n  <li><span class='match'>e\u003c/span>xcuse\u003c/li>\n  <li><span class='match'>e\u003c/span>xercise\u003c/li>\n  <li><span class='match'>e\u003c/span>xist\u003c/li>\n  <li><span class='match'>e\u003c/span>xpect\u003c/li>\n  <li><span class='match'>e\u003c/span>xpense\u003c/li>\n  <li><span class='match'>e\u003c/span>xperience\u003c/li>\n  <li><span class='match'>e\u003c/span>xplain\u003c/li>\n  <li><span class='match'>e\u003c/span>xpress\u003c/li>\n  <li><span class='match'>e\u003c/span>xtra\u003c/li>\n  <li><span class='match'>e\u003c/span>ye\u003c/li>\n  <li><span class='match'>i\u003c/span>dea\u003c/li>\n  <li><span class='match'>i\u003c/span>dentify\u003c/li>\n  <li><span class='match'>i\u003c/span>f\u003c/li>\n  <li><span class='match'>i\u003c/span>magine\u003c/li>\n  <li><span class='match'>i\u003c/span>mportant\u003c/li>\n  <li><span class='match'>i\u003c/span>mprove\u003c/li>\n  <li><span class='match'>i\u003c/span>n\u003c/li>\n  <li><span class='match'>i\u003c/span>nclude\u003c/li>\n  <li><span class='match'>i\u003c/span>ncome\u003c/li>\n  <li><span class='match'>i\u003c/span>ncrease\u003c/li>\n  <li><span class='match'>i\u003c/span>ndeed\u003c/li>\n  <li><span class='match'>i\u003c/span>ndividual\u003c/li>\n  <li><span class='match'>i\u003c/span>ndustry\u003c/li>\n  <li><span class='match'>i\u003c/span>nform\u003c/li>\n  <li><span class='match'>i\u003c/span>nside\u003c/li>\n  <li><span class='match'>i\u003c/span>nstead\u003c/li>\n  <li><span class='match'>i\u003c/span>nsure\u003c/li>\n  <li><span class='match'>i\u003c/span>nterest\u003c/li>\n  <li><span class='match'>i\u003c/span>nto\u003c/li>\n  <li><span class='match'>i\u003c/span>ntroduce\u003c/li>\n  <li><span class='match'>i\u003c/span>nvest\u003c/li>\n  <li><span class='match'>i\u003c/span>nvolve\u003c/li>\n  <li><span class='match'>i\u003c/span>ssue\u003c/li>\n  <li><span class='match'>i\u003c/span>t\u003c/li>\n  <li><span class='match'>i\u003c/span>tem\u003c/li>\n  <li><span class='match'>o\u003c/span>bvious\u003c/li>\n  <li><span class='match'>o\u003c/span>ccasion\u003c/li>\n  <li><span class='match'>o\u003c/span>dd\u003c/li>\n  <li><span class='match'>o\u003c/span>f\u003c/li>\n  <li><span class='match'>o\u003c/span>ff\u003c/li>\n  <li><span class='match'>o\u003c/span>ffer\u003c/li>\n  <li><span class='match'>o\u003c/span>ffice\u003c/li>\n  <li><span class='match'>o\u003c/span>ften\u003c/li>\n  <li><span class='match'>o\u003c/span>kay\u003c/li>\n  <li><span class='match'>o\u003c/span>ld\u003c/li>\n  <li><span class='match'>o\u003c/span>n\u003c/li>\n  <li><span class='match'>o\u003c/span>nce\u003c/li>\n  <li><span class='match'>o\u003c/span>ne\u003c/li>\n  <li><span class='match'>o\u003c/span>nly\u003c/li>\n  <li><span class='match'>o\u003c/span>pen\u003c/li>\n  <li><span class='match'>o\u003c/span>perate\u003c/li>\n  <li><span class='match'>o\u003c/span>pportunity\u003c/li>\n  <li><span class='match'>o\u003c/span>ppose\u003c/li>\n  <li><span class='match'>o\u003c/span>r\u003c/li>\n  <li><span class='match'>o\u003c/span>rder\u003c/li>\n  <li><span class='match'>o\u003c/span>rganize\u003c/li>\n  <li><span class='match'>o\u003c/span>riginal\u003c/li>\n  <li><span class='match'>o\u003c/span>ther\u003c/li>\n  <li><span class='match'>o\u003c/span>therwise\u003c/li>\n  <li><span class='match'>o\u003c/span>ught\u003c/li>\n  <li><span class='match'>o\u003c/span>ut\u003c/li>\n  <li><span class='match'>o\u003c/span>ver\u003c/li>\n  <li><span class='match'>o\u003c/span>wn\u003c/li>\n  <li><span class='match'>u\u003c/span>nder\u003c/li>\n  <li><span class='match'>u\u003c/span>nderstand\u003c/li>\n  <li><span class='match'>u\u003c/span>nion\u003c/li>\n  <li><span class='match'>u\u003c/span>nit\u003c/li>\n  <li><span class='match'>u\u003c/span>nite\u003c/li>\n  <li><span class='match'>u\u003c/span>niversity\u003c/li>\n  <li><span class='match'>u\u003c/span>nless\u003c/li>\n  <li><span class='match'>u\u003c/span>ntil\u003c/li>\n  <li><span class='match'>u\u003c/span>p\u003c/li>\n  <li><span class='match'>u\u003c/span>pon\u003c/li>\n  <li><span class='match'>u\u003c/span>se\u003c/li>\n  <li><span class='match'>u\u003c/span>sual\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
## That only contain consonants. (Hint: thinking about matching “not”-vowels.)
str_view(a, "^[^aeiou]+$", match = T)
```

<!--html_preserve--><div id="htmlwidget-b8ec90db85401e0a154f" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-b8ec90db85401e0a154f">{"x":{"html":"<ul>\n  <li><span class='match'>by\u003c/span>\u003c/li>\n  <li><span class='match'>dry\u003c/span>\u003c/li>\n  <li><span class='match'>fly\u003c/span>\u003c/li>\n  <li><span class='match'>mrs\u003c/span>\u003c/li>\n  <li><span class='match'>try\u003c/span>\u003c/li>\n  <li><span class='match'>why\u003c/span>\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
## End with ed, but not with eed.
str_view(a, "ed+$", match = T)
```

<!--html_preserve--><div id="htmlwidget-114386399768816376d4" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-114386399768816376d4">{"x":{"html":"<ul>\n  <li>b<span class='match'>ed\u003c/span>\u003c/li>\n  <li>fe<span class='match'>ed\u003c/span>\u003c/li>\n  <li>hundr<span class='match'>ed\u003c/span>\u003c/li>\n  <li>inde<span class='match'>ed\u003c/span>\u003c/li>\n  <li>ne<span class='match'>ed\u003c/span>\u003c/li>\n  <li>proce<span class='match'>ed\u003c/span>\u003c/li>\n  <li>r<span class='match'>ed\u003c/span>\u003c/li>\n  <li>spe<span class='match'>ed\u003c/span>\u003c/li>\n  <li>succe<span class='match'>ed\u003c/span>\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
str_view(a, "[^e]ed+$", match = T)
```

<!--html_preserve--><div id="htmlwidget-d80a498a98dcfed4ab24" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-d80a498a98dcfed4ab24">{"x":{"html":"<ul>\n  <li><span class='match'>bed\u003c/span>\u003c/li>\n  <li>hund<span class='match'>red\u003c/span>\u003c/li>\n  <li><span class='match'>red\u003c/span>\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
## End with ing or ise
str_view(a, "(ing$|ise$)", match = T)
```

<!--html_preserve--><div id="htmlwidget-83b3446c2cfa5d47b508" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-83b3446c2cfa5d47b508">{"x":{"html":"<ul>\n  <li>advert<span class='match'>ise\u003c/span>\u003c/li>\n  <li>br<span class='match'>ing\u003c/span>\u003c/li>\n  <li>dur<span class='match'>ing\u003c/span>\u003c/li>\n  <li>even<span class='match'>ing\u003c/span>\u003c/li>\n  <li>exerc<span class='match'>ise\u003c/span>\u003c/li>\n  <li>k<span class='match'>ing\u003c/span>\u003c/li>\n  <li>mean<span class='match'>ing\u003c/span>\u003c/li>\n  <li>morn<span class='match'>ing\u003c/span>\u003c/li>\n  <li>otherw<span class='match'>ise\u003c/span>\u003c/li>\n  <li>pract<span class='match'>ise\u003c/span>\u003c/li>\n  <li>ra<span class='match'>ise\u003c/span>\u003c/li>\n  <li>real<span class='match'>ise\u003c/span>\u003c/li>\n  <li>r<span class='match'>ing\u003c/span>\u003c/li>\n  <li>r<span class='match'>ise\u003c/span>\u003c/li>\n  <li>s<span class='match'>ing\u003c/span>\u003c/li>\n  <li>surpr<span class='match'>ise\u003c/span>\u003c/li>\n  <li>th<span class='match'>ing\u003c/span>\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

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

<!--html_preserve--><div id="htmlwidget-cd077007d6f1cbd2a899" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-cd077007d6f1cbd2a899">{"x":{"html":"<ul>\n  <li>s<span class='match'>cie\u003c/span>nce\u003c/li>\n  <li>so<span class='match'>cie\u003c/span>ty\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
## Is “q” always followed by a “u”?

str_view(a, "[q]+", match = T)
```

<!--html_preserve--><div id="htmlwidget-1a94ee9ce6863e94ad5c" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-1a94ee9ce6863e94ad5c">{"x":{"html":"<ul>\n  <li>e<span class='match'>q\u003c/span>ual\u003c/li>\n  <li><span class='match'>q\u003c/span>uality\u003c/li>\n  <li><span class='match'>q\u003c/span>uarter\u003c/li>\n  <li><span class='match'>q\u003c/span>uestion\u003c/li>\n  <li><span class='match'>q\u003c/span>uick\u003c/li>\n  <li><span class='match'>q\u003c/span>uid\u003c/li>\n  <li><span class='match'>q\u003c/span>uiet\u003c/li>\n  <li><span class='match'>q\u003c/span>uite\u003c/li>\n  <li>re<span class='match'>q\u003c/span>uire\u003c/li>\n  <li>s<span class='match'>q\u003c/span>uare\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
str_view(a, "[q][^u]+", match = T)
```

<!--html_preserve--><div id="htmlwidget-933968288359f9408e51" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-933968288359f9408e51">{"x":{"html":"<ul>\n  <li>\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
## Write a regular expression that matches a word if it’s probably written in British English, not American English.

## Create a regular expression that will match telephone numbers as commonly written in your country.       
a <- c("000-000-0000","000-0000-0000")
str_view(a, "[\\d]{3}-[\\d]{3}-[\\d]{4}")
```

<!--html_preserve--><div id="htmlwidget-d85e910927a7e9158910" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-d85e910927a7e9158910">{"x":{"html":"<ul>\n  <li><span class='match'>000-000-0000\u003c/span>\u003c/li>\n  <li>000-0000-0000\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
## 14.3.4 Repetition

x <- "1888 is the longest year in Roman numerals: MDCCCLXXXVIII"
str_view(x, "CC?")
```

<!--html_preserve--><div id="htmlwidget-299ae2f8ef378ccc21e0" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-299ae2f8ef378ccc21e0">{"x":{"html":"<ul>\n  <li>1888 is the longest year in Roman numerals: MD<span class='match'>CC\u003c/span>CLXXXVIII\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
str_view(x, "CC+")
```

<!--html_preserve--><div id="htmlwidget-b60ae7f2e76e3ac32e22" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-b60ae7f2e76e3ac32e22">{"x":{"html":"<ul>\n  <li>1888 is the longest year in Roman numerals: MD<span class='match'>CCC\u003c/span>LXXXVIII\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
str_view(x, "CC*")
```

<!--html_preserve--><div id="htmlwidget-d99020dafaf4996a1fb6" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-d99020dafaf4996a1fb6">{"x":{"html":"<ul>\n  <li>1888 is the longest year in Roman numerals: MD<span class='match'>CCC\u003c/span>LXXXVIII\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
str_view(x, 'C[LX]+')
```

<!--html_preserve--><div id="htmlwidget-c48984716fd200a4114f" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-c48984716fd200a4114f">{"x":{"html":"<ul>\n  <li>1888 is the longest year in Roman numerals: MDCC<span class='match'>CLXXX\u003c/span>VIII\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
str_view(x, "C{2,3}")
```

<!--html_preserve--><div id="htmlwidget-643e0e1f91ab0fb2f6e1" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-643e0e1f91ab0fb2f6e1">{"x":{"html":"<ul>\n  <li>1888 is the longest year in Roman numerals: MD<span class='match'>CCC\u003c/span>LXXXVIII\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
str_view(x, 'C{2,3}?')
```

<!--html_preserve--><div id="htmlwidget-ff66ea9503f5d01e5ba1" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-ff66ea9503f5d01e5ba1">{"x":{"html":"<ul>\n  <li>1888 is the longest year in Roman numerals: MD<span class='match'>CC\u003c/span>CLXXXVIII\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
## 14.3.4.1 Exercises

## 1. Describe the equivalents of ?, +, * in {m,n} form.
str_view(x, "1?")
```

<!--html_preserve--><div id="htmlwidget-058f0e3e799721cf0f6d" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-058f0e3e799721cf0f6d">{"x":{"html":"<ul>\n  <li><span class='match'>1\u003c/span>888 is the longest year in Roman numerals: MDCCCLXXXVIII\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
str_view(x, "1{0,1}")
```

<!--html_preserve--><div id="htmlwidget-eeade14245b8a4690d0a" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-eeade14245b8a4690d0a">{"x":{"html":"<ul>\n  <li><span class='match'>1\u003c/span>888 is the longest year in Roman numerals: MDCCCLXXXVIII\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
str_view(x, "X+")
```

<!--html_preserve--><div id="htmlwidget-4e0df0206da031538f77" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-4e0df0206da031538f77">{"x":{"html":"<ul>\n  <li>1888 is the longest year in Roman numerals: MDCCCL<span class='match'>XXX\u003c/span>VIII\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
str_view(x, "X{1,10000}")
```

<!--html_preserve--><div id="htmlwidget-82b24f36bc9524d0c3e5" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-82b24f36bc9524d0c3e5">{"x":{"html":"<ul>\n  <li>1888 is the longest year in Roman numerals: MDCCCL<span class='match'>XXX\u003c/span>VIII\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
str_view(x, "1*")
```

<!--html_preserve--><div id="htmlwidget-aba31b379f774d3b5aac" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-aba31b379f774d3b5aac">{"x":{"html":"<ul>\n  <li><span class='match'>1\u003c/span>888 is the longest year in Roman numerals: MDCCCLXXXVIII\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
str_view(x, "1{0,10000}")
```

<!--html_preserve--><div id="htmlwidget-3577d8c978fe6536d5ec" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-3577d8c978fe6536d5ec">{"x":{"html":"<ul>\n  <li><span class='match'>1\u003c/span>888 is the longest year in Roman numerals: MDCCCLXXXVIII\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
## 2. Describe in words what these regular expressions match: (read carefully to see if I’m using a regular expression or a string that defines a regular expression.)

## ^.*$ ANY string that start with character and finishes as a character
str_view(x, "^.*$")
```

<!--html_preserve--><div id="htmlwidget-577af15acd2a0341040e" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-577af15acd2a0341040e">{"x":{"html":"<ul>\n  <li><span class='match'>1888 is the longest year in Roman numerals: MDCCCLXXXVIII\u003c/span>\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
##  "\\{.+\\}"
a <- "{aa}bb"
str_view(a, "\\{.+\\}") ## \\ to specifiy that {} are characters
```

<!--html_preserve--><div id="htmlwidget-c99ff4f61f399f69ce11" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-c99ff4f61f399f69ce11">{"x":{"html":"<ul>\n  <li><span class='match'>{aa}\u003c/span>bb\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
##\d{4}-\d{2}-\d{2}
b <- "1234-22-33"
str_view(b, "\\d{4}-\\d{2}-\\d{2}")
```

<!--html_preserve--><div id="htmlwidget-2696940cc4622b84d74a" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-2696940cc4622b84d74a">{"x":{"html":"<ul>\n  <li><span class='match'>1234-22-33\u003c/span>\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
## "\\\\{4}"
c <- "\\\\\\\\\\\\\\\\"
str_view(c, "\\\\{4}")
```

<!--html_preserve--><div id="htmlwidget-88238263e6ca460883df" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-88238263e6ca460883df">{"x":{"html":"<ul>\n  <li><span class='match'>\\\\\\\\\u003c/span>\\\\\\\\\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
## 3. Create regular expressions to find all words that:
a <- stringr::words

##Start with three consonants.
a %>%
  str_view("^[^aeiou]{3}", match = T)
```

<!--html_preserve--><div id="htmlwidget-4cafa97f5dff1d46ac69" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-4cafa97f5dff1d46ac69">{"x":{"html":"<ul>\n  <li><span class='match'>Chr\u003c/span>ist\u003c/li>\n  <li><span class='match'>Chr\u003c/span>istmas\u003c/li>\n  <li><span class='match'>dry\u003c/span>\u003c/li>\n  <li><span class='match'>fly\u003c/span>\u003c/li>\n  <li><span class='match'>mrs\u003c/span>\u003c/li>\n  <li><span class='match'>sch\u003c/span>eme\u003c/li>\n  <li><span class='match'>sch\u003c/span>ool\u003c/li>\n  <li><span class='match'>str\u003c/span>aight\u003c/li>\n  <li><span class='match'>str\u003c/span>ategy\u003c/li>\n  <li><span class='match'>str\u003c/span>eet\u003c/li>\n  <li><span class='match'>str\u003c/span>ike\u003c/li>\n  <li><span class='match'>str\u003c/span>ong\u003c/li>\n  <li><span class='match'>str\u003c/span>ucture\u003c/li>\n  <li><span class='match'>sys\u003c/span>tem\u003c/li>\n  <li><span class='match'>thr\u003c/span>ee\u003c/li>\n  <li><span class='match'>thr\u003c/span>ough\u003c/li>\n  <li><span class='match'>thr\u003c/span>ow\u003c/li>\n  <li><span class='match'>try\u003c/span>\u003c/li>\n  <li><span class='match'>typ\u003c/span>e\u003c/li>\n  <li><span class='match'>why\u003c/span>\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
##Have three or more vowels in a row.
a %>%
  str_view("[aeiou]{3}", match = T)
```

<!--html_preserve--><div id="htmlwidget-4be5a1049b9a0142e245" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-4be5a1049b9a0142e245">{"x":{"html":"<ul>\n  <li>b<span class='match'>eau\u003c/span>ty\u003c/li>\n  <li>obv<span class='match'>iou\u003c/span>s\u003c/li>\n  <li>prev<span class='match'>iou\u003c/span>s\u003c/li>\n  <li>q<span class='match'>uie\u003c/span>t\u003c/li>\n  <li>ser<span class='match'>iou\u003c/span>s\u003c/li>\n  <li>var<span class='match'>iou\u003c/span>s\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
##Have two or more vowel-consonant pairs in a row.
a %>%
  str_view("([aeiou][^aeiou]){2,100}", match = T)
```

<!--html_preserve--><div id="htmlwidget-007b77addf67ee9a90af" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-007b77addf67ee9a90af">{"x":{"html":"<ul>\n  <li>abs<span class='match'>olut\u003c/span>e\u003c/li>\n  <li><span class='match'>agen\u003c/span>t\u003c/li>\n  <li><span class='match'>alon\u003c/span>g\u003c/li>\n  <li><span class='match'>americ\u003c/span>a\u003c/li>\n  <li><span class='match'>anot\u003c/span>her\u003c/li>\n  <li><span class='match'>apar\u003c/span>t\u003c/li>\n  <li>app<span class='match'>aren\u003c/span>t\u003c/li>\n  <li>auth<span class='match'>orit\u003c/span>y\u003c/li>\n  <li>ava<span class='match'>ilab\u003c/span>le\u003c/li>\n  <li><span class='match'>awar\u003c/span>e\u003c/li>\n  <li><span class='match'>away\u003c/span>\u003c/li>\n  <li>b<span class='match'>alan\u003c/span>ce\u003c/li>\n  <li>b<span class='match'>asis\u003c/span>\u003c/li>\n  <li>b<span class='match'>ecom\u003c/span>e\u003c/li>\n  <li>b<span class='match'>efor\u003c/span>e\u003c/li>\n  <li>b<span class='match'>egin\u003c/span>\u003c/li>\n  <li>b<span class='match'>ehin\u003c/span>d\u003c/li>\n  <li>b<span class='match'>enefit\u003c/span>\u003c/li>\n  <li>b<span class='match'>usines\u003c/span>s\u003c/li>\n  <li>ch<span class='match'>arac\u003c/span>ter\u003c/li>\n  <li>cl<span class='match'>oses\u003c/span>\u003c/li>\n  <li>comm<span class='match'>unit\u003c/span>y\u003c/li>\n  <li>cons<span class='match'>ider\u003c/span>\u003c/li>\n  <li>c<span class='match'>over\u003c/span>\u003c/li>\n  <li>d<span class='match'>ebat\u003c/span>e\u003c/li>\n  <li>d<span class='match'>ecid\u003c/span>e\u003c/li>\n  <li>d<span class='match'>ecis\u003c/span>ion\u003c/li>\n  <li>d<span class='match'>efinit\u003c/span>e\u003c/li>\n  <li>d<span class='match'>epar\u003c/span>tment\u003c/li>\n  <li>d<span class='match'>epen\u003c/span>d\u003c/li>\n  <li>d<span class='match'>esig\u003c/span>n\u003c/li>\n  <li>d<span class='match'>evelop\u003c/span>\u003c/li>\n  <li>diff<span class='match'>eren\u003c/span>ce\u003c/li>\n  <li>diff<span class='match'>icul\u003c/span>t\u003c/li>\n  <li>d<span class='match'>irec\u003c/span>t\u003c/li>\n  <li>d<span class='match'>ivid\u003c/span>e\u003c/li>\n  <li>d<span class='match'>ocumen\u003c/span>t\u003c/li>\n  <li>d<span class='match'>urin\u003c/span>g\u003c/li>\n  <li><span class='match'>econom\u003c/span>y\u003c/li>\n  <li><span class='match'>educat\u003c/span>e\u003c/li>\n  <li><span class='match'>elec\u003c/span>t\u003c/li>\n  <li><span class='match'>elec\u003c/span>tric\u003c/li>\n  <li><span class='match'>eleven\u003c/span>\u003c/li>\n  <li>enco<span class='match'>urag\u003c/span>e\u003c/li>\n  <li>env<span class='match'>iron\u003c/span>ment\u003c/li>\n  <li>e<span class='match'>urop\u003c/span>e\u003c/li>\n  <li><span class='match'>even\u003c/span>\u003c/li>\n  <li><span class='match'>evenin\u003c/span>g\u003c/li>\n  <li><span class='match'>ever\u003c/span>\u003c/li>\n  <li><span class='match'>ever\u003c/span>y\u003c/li>\n  <li><span class='match'>eviden\u003c/span>ce\u003c/li>\n  <li><span class='match'>exac\u003c/span>t\u003c/li>\n  <li><span class='match'>exam\u003c/span>ple\u003c/li>\n  <li><span class='match'>exer\u003c/span>cise\u003c/li>\n  <li><span class='match'>exis\u003c/span>t\u003c/li>\n  <li>f<span class='match'>amil\u003c/span>y\u003c/li>\n  <li>f<span class='match'>igur\u003c/span>e\u003c/li>\n  <li>f<span class='match'>inal\u003c/span>\u003c/li>\n  <li>f<span class='match'>inan\u003c/span>ce\u003c/li>\n  <li>f<span class='match'>inis\u003c/span>h\u003c/li>\n  <li>fr<span class='match'>iday\u003c/span>\u003c/li>\n  <li>f<span class='match'>utur\u003c/span>e\u003c/li>\n  <li>g<span class='match'>eneral\u003c/span>\u003c/li>\n  <li>g<span class='match'>over\u003c/span>n\u003c/li>\n  <li>h<span class='match'>oliday\u003c/span>\u003c/li>\n  <li>h<span class='match'>ones\u003c/span>t\u003c/li>\n  <li>hosp<span class='match'>ital\u003c/span>\u003c/li>\n  <li>h<span class='match'>owever\u003c/span>\u003c/li>\n  <li><span class='match'>iden\u003c/span>tify\u003c/li>\n  <li><span class='match'>imagin\u003c/span>e\u003c/li>\n  <li>ind<span class='match'>ivid\u003c/span>ual\u003c/li>\n  <li>int<span class='match'>eres\u003c/span>t\u003c/li>\n  <li>intr<span class='match'>oduc\u003c/span>e\u003c/li>\n  <li><span class='match'>item\u003c/span>\u003c/li>\n  <li>j<span class='match'>esus\u003c/span>\u003c/li>\n  <li>l<span class='match'>evel\u003c/span>\u003c/li>\n  <li>l<span class='match'>ikel\u003c/span>y\u003c/li>\n  <li>l<span class='match'>imit\u003c/span>\u003c/li>\n  <li>l<span class='match'>ocal\u003c/span>\u003c/li>\n  <li>m<span class='match'>ajor\u003c/span>\u003c/li>\n  <li>m<span class='match'>anag\u003c/span>e\u003c/li>\n  <li>me<span class='match'>anin\u003c/span>g\u003c/li>\n  <li>me<span class='match'>asur\u003c/span>e\u003c/li>\n  <li>m<span class='match'>inis\u003c/span>ter\u003c/li>\n  <li>m<span class='match'>inus\u003c/span>\u003c/li>\n  <li>m<span class='match'>inut\u003c/span>e\u003c/li>\n  <li>m<span class='match'>omen\u003c/span>t\u003c/li>\n  <li>m<span class='match'>oney\u003c/span>\u003c/li>\n  <li>m<span class='match'>usic\u003c/span>\u003c/li>\n  <li>n<span class='match'>atur\u003c/span>e\u003c/li>\n  <li>n<span class='match'>eces\u003c/span>sary\u003c/li>\n  <li>n<span class='match'>ever\u003c/span>\u003c/li>\n  <li>n<span class='match'>otic\u003c/span>e\u003c/li>\n  <li><span class='match'>okay\u003c/span>\u003c/li>\n  <li><span class='match'>open\u003c/span>\u003c/li>\n  <li><span class='match'>operat\u003c/span>e\u003c/li>\n  <li>opport<span class='match'>unit\u003c/span>y\u003c/li>\n  <li>org<span class='match'>aniz\u003c/span>e\u003c/li>\n  <li><span class='match'>original\u003c/span>\u003c/li>\n  <li><span class='match'>over\u003c/span>\u003c/li>\n  <li>p<span class='match'>aper\u003c/span>\u003c/li>\n  <li>p<span class='match'>arag\u003c/span>raph\u003c/li>\n  <li>p<span class='match'>aren\u003c/span>t\u003c/li>\n  <li>part<span class='match'>icular\u003c/span>\u003c/li>\n  <li>ph<span class='match'>otog\u003c/span>raph\u003c/li>\n  <li>p<span class='match'>olic\u003c/span>e\u003c/li>\n  <li>p<span class='match'>olic\u003c/span>y\u003c/li>\n  <li>p<span class='match'>olitic\u003c/span>\u003c/li>\n  <li>p<span class='match'>osit\u003c/span>ion\u003c/li>\n  <li>p<span class='match'>ositiv\u003c/span>e\u003c/li>\n  <li>p<span class='match'>ower\u003c/span>\u003c/li>\n  <li>pr<span class='match'>epar\u003c/span>e\u003c/li>\n  <li>pr<span class='match'>esen\u003c/span>t\u003c/li>\n  <li>pr<span class='match'>esum\u003c/span>e\u003c/li>\n  <li>pr<span class='match'>ivat\u003c/span>e\u003c/li>\n  <li>pr<span class='match'>obab\u003c/span>le\u003c/li>\n  <li>pr<span class='match'>oces\u003c/span>s\u003c/li>\n  <li>pr<span class='match'>oduc\u003c/span>e\u003c/li>\n  <li>pr<span class='match'>oduc\u003c/span>t\u003c/li>\n  <li>pr<span class='match'>ojec\u003c/span>t\u003c/li>\n  <li>pr<span class='match'>oper\u003c/span>\u003c/li>\n  <li>pr<span class='match'>opos\u003c/span>e\u003c/li>\n  <li>pr<span class='match'>otec\u003c/span>t\u003c/li>\n  <li>pr<span class='match'>ovid\u003c/span>e\u003c/li>\n  <li>qu<span class='match'>alit\u003c/span>y\u003c/li>\n  <li>re<span class='match'>alis\u003c/span>e\u003c/li>\n  <li>re<span class='match'>ason\u003c/span>\u003c/li>\n  <li>r<span class='match'>ecen\u003c/span>t\u003c/li>\n  <li>r<span class='match'>ecog\u003c/span>nize\u003c/li>\n  <li>r<span class='match'>ecom\u003c/span>mend\u003c/li>\n  <li>r<span class='match'>ecor\u003c/span>d\u003c/li>\n  <li>r<span class='match'>educ\u003c/span>e\u003c/li>\n  <li>r<span class='match'>efer\u003c/span>\u003c/li>\n  <li>r<span class='match'>egar\u003c/span>d\u003c/li>\n  <li>r<span class='match'>elat\u003c/span>ion\u003c/li>\n  <li>r<span class='match'>emem\u003c/span>ber\u003c/li>\n  <li>r<span class='match'>epor\u003c/span>t\u003c/li>\n  <li>repr<span class='match'>esen\u003c/span>t\u003c/li>\n  <li>r<span class='match'>esul\u003c/span>t\u003c/li>\n  <li>r<span class='match'>etur\u003c/span>n\u003c/li>\n  <li>s<span class='match'>atur\u003c/span>day\u003c/li>\n  <li>s<span class='match'>econ\u003c/span>d\u003c/li>\n  <li>secr<span class='match'>etar\u003c/span>y\u003c/li>\n  <li>s<span class='match'>ecur\u003c/span>e\u003c/li>\n  <li>s<span class='match'>eparat\u003c/span>e\u003c/li>\n  <li>s<span class='match'>even\u003c/span>\u003c/li>\n  <li>s<span class='match'>imilar\u003c/span>\u003c/li>\n  <li>sp<span class='match'>ecific\u003c/span>\u003c/li>\n  <li>str<span class='match'>ateg\u003c/span>y\u003c/li>\n  <li>st<span class='match'>uden\u003c/span>t\u003c/li>\n  <li>st<span class='match'>upid\u003c/span>\u003c/li>\n  <li>t<span class='match'>elep\u003c/span>hone\u003c/li>\n  <li>t<span class='match'>elevis\u003c/span>ion\u003c/li>\n  <li>th<span class='match'>erefor\u003c/span>e\u003c/li>\n  <li>tho<span class='match'>usan\u003c/span>d\u003c/li>\n  <li>t<span class='match'>oday\u003c/span>\u003c/li>\n  <li>t<span class='match'>oget\u003c/span>her\u003c/li>\n  <li>t<span class='match'>omor\u003c/span>row\u003c/li>\n  <li>t<span class='match'>onig\u003c/span>ht\u003c/li>\n  <li>t<span class='match'>otal\u003c/span>\u003c/li>\n  <li>t<span class='match'>owar\u003c/span>d\u003c/li>\n  <li>tr<span class='match'>avel\u003c/span>\u003c/li>\n  <li><span class='match'>unit\u003c/span>\u003c/li>\n  <li><span class='match'>unit\u003c/span>e\u003c/li>\n  <li><span class='match'>univer\u003c/span>sity\u003c/li>\n  <li><span class='match'>upon\u003c/span>\u003c/li>\n  <li>v<span class='match'>isit\u003c/span>\u003c/li>\n  <li>w<span class='match'>ater\u003c/span>\u003c/li>\n  <li>w<span class='match'>oman\u003c/span>\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
##Solve the beginner regexp crosswords at https://regexcrossword.com/challenges/beginner.


## 14.3.5 Grouping and backreferences

str_view(fruit, "(..)\\1", match = TRUE)
```

<!--html_preserve--><div id="htmlwidget-7ca712ab2346161376e3" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-7ca712ab2346161376e3">{"x":{"html":"<ul>\n  <li>b<span class='match'>anan\u003c/span>a\u003c/li>\n  <li><span class='match'>coco\u003c/span>nut\u003c/li>\n  <li><span class='match'>cucu\u003c/span>mber\u003c/li>\n  <li><span class='match'>juju\u003c/span>be\u003c/li>\n  <li><span class='match'>papa\u003c/span>ya\u003c/li>\n  <li>s<span class='match'>alal\u003c/span> berry\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
## 14.3.5.1 Exercises

## 1. Describe, in words, what these expressions will match:

##(.)\1\1 
a <- c("aaaaddddcccc","bb")
str_view(a, "(.)\\1\\1\\1")
```

<!--html_preserve--><div id="htmlwidget-b9e2ede5c467a09a8170" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-b9e2ede5c467a09a8170">{"x":{"html":"<ul>\n  <li><span class='match'>aaaa\u003c/span>ddddcccc\u003c/li>\n  <li>bb\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
## "(.)(.)\\2\\1"
str_view(a, "(.)(.)\\2\\1")
```

<!--html_preserve--><div id="htmlwidget-44634e2ec195d734dcb0" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-44634e2ec195d734dcb0">{"x":{"html":"<ul>\n  <li><span class='match'>aaaa\u003c/span>ddddcccc\u003c/li>\n  <li>bb\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

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

<!--html_preserve--><div id="htmlwidget-7ef14047616b9c78a88d" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-7ef14047616b9c78a88d">{"x":{"html":"<ul>\n  <li><span class='match'>america\u003c/span>\u003c/li>\n  <li><span class='match'>area\u003c/span>\u003c/li>\n  <li><span class='match'>dead\u003c/span>\u003c/li>\n  <li><span class='match'>depend\u003c/span>\u003c/li>\n  <li><span class='match'>educate\u003c/span>\u003c/li>\n  <li><span class='match'>else\u003c/span>\u003c/li>\n  <li><span class='match'>encourage\u003c/span>\u003c/li>\n  <li><span class='match'>engine\u003c/span>\u003c/li>\n  <li><span class='match'>europe\u003c/span>\u003c/li>\n  <li><span class='match'>evidence\u003c/span>\u003c/li>\n  <li><span class='match'>example\u003c/span>\u003c/li>\n  <li><span class='match'>excuse\u003c/span>\u003c/li>\n  <li><span class='match'>exercise\u003c/span>\u003c/li>\n  <li><span class='match'>expense\u003c/span>\u003c/li>\n  <li><span class='match'>experience\u003c/span>\u003c/li>\n  <li><span class='match'>health\u003c/span>\u003c/li>\n  <li><span class='match'>high\u003c/span>\u003c/li>\n  <li><span class='match'>knock\u003c/span>\u003c/li>\n  <li><span class='match'>level\u003c/span>\u003c/li>\n  <li><span class='match'>local\u003c/span>\u003c/li>\n  <li><span class='match'>nation\u003c/span>\u003c/li>\n  <li><span class='match'>rather\u003c/span>\u003c/li>\n  <li><span class='match'>refer\u003c/span>\u003c/li>\n  <li><span class='match'>remember\u003c/span>\u003c/li>\n  <li><span class='match'>serious\u003c/span>\u003c/li>\n  <li><span class='match'>stairs\u003c/span>\u003c/li>\n  <li><span class='match'>test\u003c/span>\u003c/li>\n  <li><span class='match'>tonight\u003c/span>\u003c/li>\n  <li><span class='match'>transport\u003c/span>\u003c/li>\n  <li><span class='match'>treat\u003c/span>\u003c/li>\n  <li><span class='match'>trust\u003c/span>\u003c/li>\n  <li><span class='match'>window\u003c/span>\u003c/li>\n  <li><span class='match'>yesterday\u003c/span>\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
## Contain a repeated pair of letters (e.g. “church” contains “ch” repeated twice.)
str_view(a, "(..)", match = T)
```

<!--html_preserve--><div id="htmlwidget-0b61c722d32d839eb9c2" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-0b61c722d32d839eb9c2">{"x":{"html":"<ul>\n  <li><span class='match'>ab\u003c/span>le\u003c/li>\n  <li><span class='match'>ab\u003c/span>out\u003c/li>\n  <li><span class='match'>ab\u003c/span>solute\u003c/li>\n  <li><span class='match'>ac\u003c/span>cept\u003c/li>\n  <li><span class='match'>ac\u003c/span>count\u003c/li>\n  <li><span class='match'>ac\u003c/span>hieve\u003c/li>\n  <li><span class='match'>ac\u003c/span>ross\u003c/li>\n  <li><span class='match'>ac\u003c/span>t\u003c/li>\n  <li><span class='match'>ac\u003c/span>tive\u003c/li>\n  <li><span class='match'>ac\u003c/span>tual\u003c/li>\n  <li><span class='match'>ad\u003c/span>d\u003c/li>\n  <li><span class='match'>ad\u003c/span>dress\u003c/li>\n  <li><span class='match'>ad\u003c/span>mit\u003c/li>\n  <li><span class='match'>ad\u003c/span>vertise\u003c/li>\n  <li><span class='match'>af\u003c/span>fect\u003c/li>\n  <li><span class='match'>af\u003c/span>ford\u003c/li>\n  <li><span class='match'>af\u003c/span>ter\u003c/li>\n  <li><span class='match'>af\u003c/span>ternoon\u003c/li>\n  <li><span class='match'>ag\u003c/span>ain\u003c/li>\n  <li><span class='match'>ag\u003c/span>ainst\u003c/li>\n  <li><span class='match'>ag\u003c/span>e\u003c/li>\n  <li><span class='match'>ag\u003c/span>ent\u003c/li>\n  <li><span class='match'>ag\u003c/span>o\u003c/li>\n  <li><span class='match'>ag\u003c/span>ree\u003c/li>\n  <li><span class='match'>ai\u003c/span>r\u003c/li>\n  <li><span class='match'>al\u003c/span>l\u003c/li>\n  <li><span class='match'>al\u003c/span>low\u003c/li>\n  <li><span class='match'>al\u003c/span>most\u003c/li>\n  <li><span class='match'>al\u003c/span>ong\u003c/li>\n  <li><span class='match'>al\u003c/span>ready\u003c/li>\n  <li><span class='match'>al\u003c/span>right\u003c/li>\n  <li><span class='match'>al\u003c/span>so\u003c/li>\n  <li><span class='match'>al\u003c/span>though\u003c/li>\n  <li><span class='match'>al\u003c/span>ways\u003c/li>\n  <li><span class='match'>am\u003c/span>erica\u003c/li>\n  <li><span class='match'>am\u003c/span>ount\u003c/li>\n  <li><span class='match'>an\u003c/span>d\u003c/li>\n  <li><span class='match'>an\u003c/span>other\u003c/li>\n  <li><span class='match'>an\u003c/span>swer\u003c/li>\n  <li><span class='match'>an\u003c/span>y\u003c/li>\n  <li><span class='match'>ap\u003c/span>art\u003c/li>\n  <li><span class='match'>ap\u003c/span>parent\u003c/li>\n  <li><span class='match'>ap\u003c/span>pear\u003c/li>\n  <li><span class='match'>ap\u003c/span>ply\u003c/li>\n  <li><span class='match'>ap\u003c/span>point\u003c/li>\n  <li><span class='match'>ap\u003c/span>proach\u003c/li>\n  <li><span class='match'>ap\u003c/span>propriate\u003c/li>\n  <li><span class='match'>ar\u003c/span>ea\u003c/li>\n  <li><span class='match'>ar\u003c/span>gue\u003c/li>\n  <li><span class='match'>ar\u003c/span>m\u003c/li>\n  <li><span class='match'>ar\u003c/span>ound\u003c/li>\n  <li><span class='match'>ar\u003c/span>range\u003c/li>\n  <li><span class='match'>ar\u003c/span>t\u003c/li>\n  <li><span class='match'>as\u003c/span>\u003c/li>\n  <li><span class='match'>as\u003c/span>k\u003c/li>\n  <li><span class='match'>as\u003c/span>sociate\u003c/li>\n  <li><span class='match'>as\u003c/span>sume\u003c/li>\n  <li><span class='match'>at\u003c/span>\u003c/li>\n  <li><span class='match'>at\u003c/span>tend\u003c/li>\n  <li><span class='match'>au\u003c/span>thority\u003c/li>\n  <li><span class='match'>av\u003c/span>ailable\u003c/li>\n  <li><span class='match'>aw\u003c/span>are\u003c/li>\n  <li><span class='match'>aw\u003c/span>ay\u003c/li>\n  <li><span class='match'>aw\u003c/span>ful\u003c/li>\n  <li><span class='match'>ba\u003c/span>by\u003c/li>\n  <li><span class='match'>ba\u003c/span>ck\u003c/li>\n  <li><span class='match'>ba\u003c/span>d\u003c/li>\n  <li><span class='match'>ba\u003c/span>g\u003c/li>\n  <li><span class='match'>ba\u003c/span>lance\u003c/li>\n  <li><span class='match'>ba\u003c/span>ll\u003c/li>\n  <li><span class='match'>ba\u003c/span>nk\u003c/li>\n  <li><span class='match'>ba\u003c/span>r\u003c/li>\n  <li><span class='match'>ba\u003c/span>se\u003c/li>\n  <li><span class='match'>ba\u003c/span>sis\u003c/li>\n  <li><span class='match'>be\u003c/span>\u003c/li>\n  <li><span class='match'>be\u003c/span>ar\u003c/li>\n  <li><span class='match'>be\u003c/span>at\u003c/li>\n  <li><span class='match'>be\u003c/span>auty\u003c/li>\n  <li><span class='match'>be\u003c/span>cause\u003c/li>\n  <li><span class='match'>be\u003c/span>come\u003c/li>\n  <li><span class='match'>be\u003c/span>d\u003c/li>\n  <li><span class='match'>be\u003c/span>fore\u003c/li>\n  <li><span class='match'>be\u003c/span>gin\u003c/li>\n  <li><span class='match'>be\u003c/span>hind\u003c/li>\n  <li><span class='match'>be\u003c/span>lieve\u003c/li>\n  <li><span class='match'>be\u003c/span>nefit\u003c/li>\n  <li><span class='match'>be\u003c/span>st\u003c/li>\n  <li><span class='match'>be\u003c/span>t\u003c/li>\n  <li><span class='match'>be\u003c/span>tween\u003c/li>\n  <li><span class='match'>bi\u003c/span>g\u003c/li>\n  <li><span class='match'>bi\u003c/span>ll\u003c/li>\n  <li><span class='match'>bi\u003c/span>rth\u003c/li>\n  <li><span class='match'>bi\u003c/span>t\u003c/li>\n  <li><span class='match'>bl\u003c/span>ack\u003c/li>\n  <li><span class='match'>bl\u003c/span>oke\u003c/li>\n  <li><span class='match'>bl\u003c/span>ood\u003c/li>\n  <li><span class='match'>bl\u003c/span>ow\u003c/li>\n  <li><span class='match'>bl\u003c/span>ue\u003c/li>\n  <li><span class='match'>bo\u003c/span>ard\u003c/li>\n  <li><span class='match'>bo\u003c/span>at\u003c/li>\n  <li><span class='match'>bo\u003c/span>dy\u003c/li>\n  <li><span class='match'>bo\u003c/span>ok\u003c/li>\n  <li><span class='match'>bo\u003c/span>th\u003c/li>\n  <li><span class='match'>bo\u003c/span>ther\u003c/li>\n  <li><span class='match'>bo\u003c/span>ttle\u003c/li>\n  <li><span class='match'>bo\u003c/span>ttom\u003c/li>\n  <li><span class='match'>bo\u003c/span>x\u003c/li>\n  <li><span class='match'>bo\u003c/span>y\u003c/li>\n  <li><span class='match'>br\u003c/span>eak\u003c/li>\n  <li><span class='match'>br\u003c/span>ief\u003c/li>\n  <li><span class='match'>br\u003c/span>illiant\u003c/li>\n  <li><span class='match'>br\u003c/span>ing\u003c/li>\n  <li><span class='match'>br\u003c/span>itain\u003c/li>\n  <li><span class='match'>br\u003c/span>other\u003c/li>\n  <li><span class='match'>bu\u003c/span>dget\u003c/li>\n  <li><span class='match'>bu\u003c/span>ild\u003c/li>\n  <li><span class='match'>bu\u003c/span>s\u003c/li>\n  <li><span class='match'>bu\u003c/span>siness\u003c/li>\n  <li><span class='match'>bu\u003c/span>sy\u003c/li>\n  <li><span class='match'>bu\u003c/span>t\u003c/li>\n  <li><span class='match'>bu\u003c/span>y\u003c/li>\n  <li><span class='match'>by\u003c/span>\u003c/li>\n  <li><span class='match'>ca\u003c/span>ke\u003c/li>\n  <li><span class='match'>ca\u003c/span>ll\u003c/li>\n  <li><span class='match'>ca\u003c/span>n\u003c/li>\n  <li><span class='match'>ca\u003c/span>r\u003c/li>\n  <li><span class='match'>ca\u003c/span>rd\u003c/li>\n  <li><span class='match'>ca\u003c/span>re\u003c/li>\n  <li><span class='match'>ca\u003c/span>rry\u003c/li>\n  <li><span class='match'>ca\u003c/span>se\u003c/li>\n  <li><span class='match'>ca\u003c/span>t\u003c/li>\n  <li><span class='match'>ca\u003c/span>tch\u003c/li>\n  <li><span class='match'>ca\u003c/span>use\u003c/li>\n  <li><span class='match'>ce\u003c/span>nt\u003c/li>\n  <li><span class='match'>ce\u003c/span>ntre\u003c/li>\n  <li><span class='match'>ce\u003c/span>rtain\u003c/li>\n  <li><span class='match'>ch\u003c/span>air\u003c/li>\n  <li><span class='match'>ch\u003c/span>airman\u003c/li>\n  <li><span class='match'>ch\u003c/span>ance\u003c/li>\n  <li><span class='match'>ch\u003c/span>ange\u003c/li>\n  <li><span class='match'>ch\u003c/span>ap\u003c/li>\n  <li><span class='match'>ch\u003c/span>aracter\u003c/li>\n  <li><span class='match'>ch\u003c/span>arge\u003c/li>\n  <li><span class='match'>ch\u003c/span>eap\u003c/li>\n  <li><span class='match'>ch\u003c/span>eck\u003c/li>\n  <li><span class='match'>ch\u003c/span>ild\u003c/li>\n  <li><span class='match'>ch\u003c/span>oice\u003c/li>\n  <li><span class='match'>ch\u003c/span>oose\u003c/li>\n  <li><span class='match'>Ch\u003c/span>rist\u003c/li>\n  <li><span class='match'>Ch\u003c/span>ristmas\u003c/li>\n  <li><span class='match'>ch\u003c/span>urch\u003c/li>\n  <li><span class='match'>ci\u003c/span>ty\u003c/li>\n  <li><span class='match'>cl\u003c/span>aim\u003c/li>\n  <li><span class='match'>cl\u003c/span>ass\u003c/li>\n  <li><span class='match'>cl\u003c/span>ean\u003c/li>\n  <li><span class='match'>cl\u003c/span>ear\u003c/li>\n  <li><span class='match'>cl\u003c/span>ient\u003c/li>\n  <li><span class='match'>cl\u003c/span>ock\u003c/li>\n  <li><span class='match'>cl\u003c/span>ose\u003c/li>\n  <li><span class='match'>cl\u003c/span>oses\u003c/li>\n  <li><span class='match'>cl\u003c/span>othe\u003c/li>\n  <li><span class='match'>cl\u003c/span>ub\u003c/li>\n  <li><span class='match'>co\u003c/span>ffee\u003c/li>\n  <li><span class='match'>co\u003c/span>ld\u003c/li>\n  <li><span class='match'>co\u003c/span>lleague\u003c/li>\n  <li><span class='match'>co\u003c/span>llect\u003c/li>\n  <li><span class='match'>co\u003c/span>llege\u003c/li>\n  <li><span class='match'>co\u003c/span>lour\u003c/li>\n  <li><span class='match'>co\u003c/span>me\u003c/li>\n  <li><span class='match'>co\u003c/span>mment\u003c/li>\n  <li><span class='match'>co\u003c/span>mmit\u003c/li>\n  <li><span class='match'>co\u003c/span>mmittee\u003c/li>\n  <li><span class='match'>co\u003c/span>mmon\u003c/li>\n  <li><span class='match'>co\u003c/span>mmunity\u003c/li>\n  <li><span class='match'>co\u003c/span>mpany\u003c/li>\n  <li><span class='match'>co\u003c/span>mpare\u003c/li>\n  <li><span class='match'>co\u003c/span>mplete\u003c/li>\n  <li><span class='match'>co\u003c/span>mpute\u003c/li>\n  <li><span class='match'>co\u003c/span>ncern\u003c/li>\n  <li><span class='match'>co\u003c/span>ndition\u003c/li>\n  <li><span class='match'>co\u003c/span>nfer\u003c/li>\n  <li><span class='match'>co\u003c/span>nsider\u003c/li>\n  <li><span class='match'>co\u003c/span>nsult\u003c/li>\n  <li><span class='match'>co\u003c/span>ntact\u003c/li>\n  <li><span class='match'>co\u003c/span>ntinue\u003c/li>\n  <li><span class='match'>co\u003c/span>ntract\u003c/li>\n  <li><span class='match'>co\u003c/span>ntrol\u003c/li>\n  <li><span class='match'>co\u003c/span>nverse\u003c/li>\n  <li><span class='match'>co\u003c/span>ok\u003c/li>\n  <li><span class='match'>co\u003c/span>py\u003c/li>\n  <li><span class='match'>co\u003c/span>rner\u003c/li>\n  <li><span class='match'>co\u003c/span>rrect\u003c/li>\n  <li><span class='match'>co\u003c/span>st\u003c/li>\n  <li><span class='match'>co\u003c/span>uld\u003c/li>\n  <li><span class='match'>co\u003c/span>uncil\u003c/li>\n  <li><span class='match'>co\u003c/span>unt\u003c/li>\n  <li><span class='match'>co\u003c/span>untry\u003c/li>\n  <li><span class='match'>co\u003c/span>unty\u003c/li>\n  <li><span class='match'>co\u003c/span>uple\u003c/li>\n  <li><span class='match'>co\u003c/span>urse\u003c/li>\n  <li><span class='match'>co\u003c/span>urt\u003c/li>\n  <li><span class='match'>co\u003c/span>ver\u003c/li>\n  <li><span class='match'>cr\u003c/span>eate\u003c/li>\n  <li><span class='match'>cr\u003c/span>oss\u003c/li>\n  <li><span class='match'>cu\u003c/span>p\u003c/li>\n  <li><span class='match'>cu\u003c/span>rrent\u003c/li>\n  <li><span class='match'>cu\u003c/span>t\u003c/li>\n  <li><span class='match'>da\u003c/span>d\u003c/li>\n  <li><span class='match'>da\u003c/span>nger\u003c/li>\n  <li><span class='match'>da\u003c/span>te\u003c/li>\n  <li><span class='match'>da\u003c/span>y\u003c/li>\n  <li><span class='match'>de\u003c/span>ad\u003c/li>\n  <li><span class='match'>de\u003c/span>al\u003c/li>\n  <li><span class='match'>de\u003c/span>ar\u003c/li>\n  <li><span class='match'>de\u003c/span>bate\u003c/li>\n  <li><span class='match'>de\u003c/span>cide\u003c/li>\n  <li><span class='match'>de\u003c/span>cision\u003c/li>\n  <li><span class='match'>de\u003c/span>ep\u003c/li>\n  <li><span class='match'>de\u003c/span>finite\u003c/li>\n  <li><span class='match'>de\u003c/span>gree\u003c/li>\n  <li><span class='match'>de\u003c/span>partment\u003c/li>\n  <li><span class='match'>de\u003c/span>pend\u003c/li>\n  <li><span class='match'>de\u003c/span>scribe\u003c/li>\n  <li><span class='match'>de\u003c/span>sign\u003c/li>\n  <li><span class='match'>de\u003c/span>tail\u003c/li>\n  <li><span class='match'>de\u003c/span>velop\u003c/li>\n  <li><span class='match'>di\u003c/span>e\u003c/li>\n  <li><span class='match'>di\u003c/span>fference\u003c/li>\n  <li><span class='match'>di\u003c/span>fficult\u003c/li>\n  <li><span class='match'>di\u003c/span>nner\u003c/li>\n  <li><span class='match'>di\u003c/span>rect\u003c/li>\n  <li><span class='match'>di\u003c/span>scuss\u003c/li>\n  <li><span class='match'>di\u003c/span>strict\u003c/li>\n  <li><span class='match'>di\u003c/span>vide\u003c/li>\n  <li><span class='match'>do\u003c/span>\u003c/li>\n  <li><span class='match'>do\u003c/span>ctor\u003c/li>\n  <li><span class='match'>do\u003c/span>cument\u003c/li>\n  <li><span class='match'>do\u003c/span>g\u003c/li>\n  <li><span class='match'>do\u003c/span>or\u003c/li>\n  <li><span class='match'>do\u003c/span>uble\u003c/li>\n  <li><span class='match'>do\u003c/span>ubt\u003c/li>\n  <li><span class='match'>do\u003c/span>wn\u003c/li>\n  <li><span class='match'>dr\u003c/span>aw\u003c/li>\n  <li><span class='match'>dr\u003c/span>ess\u003c/li>\n  <li><span class='match'>dr\u003c/span>ink\u003c/li>\n  <li><span class='match'>dr\u003c/span>ive\u003c/li>\n  <li><span class='match'>dr\u003c/span>op\u003c/li>\n  <li><span class='match'>dr\u003c/span>y\u003c/li>\n  <li><span class='match'>du\u003c/span>e\u003c/li>\n  <li><span class='match'>du\u003c/span>ring\u003c/li>\n  <li><span class='match'>ea\u003c/span>ch\u003c/li>\n  <li><span class='match'>ea\u003c/span>rly\u003c/li>\n  <li><span class='match'>ea\u003c/span>st\u003c/li>\n  <li><span class='match'>ea\u003c/span>sy\u003c/li>\n  <li><span class='match'>ea\u003c/span>t\u003c/li>\n  <li><span class='match'>ec\u003c/span>onomy\u003c/li>\n  <li><span class='match'>ed\u003c/span>ucate\u003c/li>\n  <li><span class='match'>ef\u003c/span>fect\u003c/li>\n  <li><span class='match'>eg\u003c/span>g\u003c/li>\n  <li><span class='match'>ei\u003c/span>ght\u003c/li>\n  <li><span class='match'>ei\u003c/span>ther\u003c/li>\n  <li><span class='match'>el\u003c/span>ect\u003c/li>\n  <li><span class='match'>el\u003c/span>ectric\u003c/li>\n  <li><span class='match'>el\u003c/span>even\u003c/li>\n  <li><span class='match'>el\u003c/span>se\u003c/li>\n  <li><span class='match'>em\u003c/span>ploy\u003c/li>\n  <li><span class='match'>en\u003c/span>courage\u003c/li>\n  <li><span class='match'>en\u003c/span>d\u003c/li>\n  <li><span class='match'>en\u003c/span>gine\u003c/li>\n  <li><span class='match'>en\u003c/span>glish\u003c/li>\n  <li><span class='match'>en\u003c/span>joy\u003c/li>\n  <li><span class='match'>en\u003c/span>ough\u003c/li>\n  <li><span class='match'>en\u003c/span>ter\u003c/li>\n  <li><span class='match'>en\u003c/span>vironment\u003c/li>\n  <li><span class='match'>eq\u003c/span>ual\u003c/li>\n  <li><span class='match'>es\u003c/span>pecial\u003c/li>\n  <li><span class='match'>eu\u003c/span>rope\u003c/li>\n  <li><span class='match'>ev\u003c/span>en\u003c/li>\n  <li><span class='match'>ev\u003c/span>ening\u003c/li>\n  <li><span class='match'>ev\u003c/span>er\u003c/li>\n  <li><span class='match'>ev\u003c/span>ery\u003c/li>\n  <li><span class='match'>ev\u003c/span>idence\u003c/li>\n  <li><span class='match'>ex\u003c/span>act\u003c/li>\n  <li><span class='match'>ex\u003c/span>ample\u003c/li>\n  <li><span class='match'>ex\u003c/span>cept\u003c/li>\n  <li><span class='match'>ex\u003c/span>cuse\u003c/li>\n  <li><span class='match'>ex\u003c/span>ercise\u003c/li>\n  <li><span class='match'>ex\u003c/span>ist\u003c/li>\n  <li><span class='match'>ex\u003c/span>pect\u003c/li>\n  <li><span class='match'>ex\u003c/span>pense\u003c/li>\n  <li><span class='match'>ex\u003c/span>perience\u003c/li>\n  <li><span class='match'>ex\u003c/span>plain\u003c/li>\n  <li><span class='match'>ex\u003c/span>press\u003c/li>\n  <li><span class='match'>ex\u003c/span>tra\u003c/li>\n  <li><span class='match'>ey\u003c/span>e\u003c/li>\n  <li><span class='match'>fa\u003c/span>ce\u003c/li>\n  <li><span class='match'>fa\u003c/span>ct\u003c/li>\n  <li><span class='match'>fa\u003c/span>ir\u003c/li>\n  <li><span class='match'>fa\u003c/span>ll\u003c/li>\n  <li><span class='match'>fa\u003c/span>mily\u003c/li>\n  <li><span class='match'>fa\u003c/span>r\u003c/li>\n  <li><span class='match'>fa\u003c/span>rm\u003c/li>\n  <li><span class='match'>fa\u003c/span>st\u003c/li>\n  <li><span class='match'>fa\u003c/span>ther\u003c/li>\n  <li><span class='match'>fa\u003c/span>vour\u003c/li>\n  <li><span class='match'>fe\u003c/span>ed\u003c/li>\n  <li><span class='match'>fe\u003c/span>el\u003c/li>\n  <li><span class='match'>fe\u003c/span>w\u003c/li>\n  <li><span class='match'>fi\u003c/span>eld\u003c/li>\n  <li><span class='match'>fi\u003c/span>ght\u003c/li>\n  <li><span class='match'>fi\u003c/span>gure\u003c/li>\n  <li><span class='match'>fi\u003c/span>le\u003c/li>\n  <li><span class='match'>fi\u003c/span>ll\u003c/li>\n  <li><span class='match'>fi\u003c/span>lm\u003c/li>\n  <li><span class='match'>fi\u003c/span>nal\u003c/li>\n  <li><span class='match'>fi\u003c/span>nance\u003c/li>\n  <li><span class='match'>fi\u003c/span>nd\u003c/li>\n  <li><span class='match'>fi\u003c/span>ne\u003c/li>\n  <li><span class='match'>fi\u003c/span>nish\u003c/li>\n  <li><span class='match'>fi\u003c/span>re\u003c/li>\n  <li><span class='match'>fi\u003c/span>rst\u003c/li>\n  <li><span class='match'>fi\u003c/span>sh\u003c/li>\n  <li><span class='match'>fi\u003c/span>t\u003c/li>\n  <li><span class='match'>fi\u003c/span>ve\u003c/li>\n  <li><span class='match'>fl\u003c/span>at\u003c/li>\n  <li><span class='match'>fl\u003c/span>oor\u003c/li>\n  <li><span class='match'>fl\u003c/span>y\u003c/li>\n  <li><span class='match'>fo\u003c/span>llow\u003c/li>\n  <li><span class='match'>fo\u003c/span>od\u003c/li>\n  <li><span class='match'>fo\u003c/span>ot\u003c/li>\n  <li><span class='match'>fo\u003c/span>r\u003c/li>\n  <li><span class='match'>fo\u003c/span>rce\u003c/li>\n  <li><span class='match'>fo\u003c/span>rget\u003c/li>\n  <li><span class='match'>fo\u003c/span>rm\u003c/li>\n  <li><span class='match'>fo\u003c/span>rtune\u003c/li>\n  <li><span class='match'>fo\u003c/span>rward\u003c/li>\n  <li><span class='match'>fo\u003c/span>ur\u003c/li>\n  <li><span class='match'>fr\u003c/span>ance\u003c/li>\n  <li><span class='match'>fr\u003c/span>ee\u003c/li>\n  <li><span class='match'>fr\u003c/span>iday\u003c/li>\n  <li><span class='match'>fr\u003c/span>iend\u003c/li>\n  <li><span class='match'>fr\u003c/span>om\u003c/li>\n  <li><span class='match'>fr\u003c/span>ont\u003c/li>\n  <li><span class='match'>fu\u003c/span>ll\u003c/li>\n  <li><span class='match'>fu\u003c/span>n\u003c/li>\n  <li><span class='match'>fu\u003c/span>nction\u003c/li>\n  <li><span class='match'>fu\u003c/span>nd\u003c/li>\n  <li><span class='match'>fu\u003c/span>rther\u003c/li>\n  <li><span class='match'>fu\u003c/span>ture\u003c/li>\n  <li><span class='match'>ga\u003c/span>me\u003c/li>\n  <li><span class='match'>ga\u003c/span>rden\u003c/li>\n  <li><span class='match'>ga\u003c/span>s\u003c/li>\n  <li><span class='match'>ge\u003c/span>neral\u003c/li>\n  <li><span class='match'>ge\u003c/span>rmany\u003c/li>\n  <li><span class='match'>ge\u003c/span>t\u003c/li>\n  <li><span class='match'>gi\u003c/span>rl\u003c/li>\n  <li><span class='match'>gi\u003c/span>ve\u003c/li>\n  <li><span class='match'>gl\u003c/span>ass\u003c/li>\n  <li><span class='match'>go\u003c/span>\u003c/li>\n  <li><span class='match'>go\u003c/span>d\u003c/li>\n  <li><span class='match'>go\u003c/span>od\u003c/li>\n  <li><span class='match'>go\u003c/span>odbye\u003c/li>\n  <li><span class='match'>go\u003c/span>vern\u003c/li>\n  <li><span class='match'>gr\u003c/span>and\u003c/li>\n  <li><span class='match'>gr\u003c/span>ant\u003c/li>\n  <li><span class='match'>gr\u003c/span>eat\u003c/li>\n  <li><span class='match'>gr\u003c/span>een\u003c/li>\n  <li><span class='match'>gr\u003c/span>ound\u003c/li>\n  <li><span class='match'>gr\u003c/span>oup\u003c/li>\n  <li><span class='match'>gr\u003c/span>ow\u003c/li>\n  <li><span class='match'>gu\u003c/span>ess\u003c/li>\n  <li><span class='match'>gu\u003c/span>y\u003c/li>\n  <li><span class='match'>ha\u003c/span>ir\u003c/li>\n  <li><span class='match'>ha\u003c/span>lf\u003c/li>\n  <li><span class='match'>ha\u003c/span>ll\u003c/li>\n  <li><span class='match'>ha\u003c/span>nd\u003c/li>\n  <li><span class='match'>ha\u003c/span>ng\u003c/li>\n  <li><span class='match'>ha\u003c/span>ppen\u003c/li>\n  <li><span class='match'>ha\u003c/span>ppy\u003c/li>\n  <li><span class='match'>ha\u003c/span>rd\u003c/li>\n  <li><span class='match'>ha\u003c/span>te\u003c/li>\n  <li><span class='match'>ha\u003c/span>ve\u003c/li>\n  <li><span class='match'>he\u003c/span>\u003c/li>\n  <li><span class='match'>he\u003c/span>ad\u003c/li>\n  <li><span class='match'>he\u003c/span>alth\u003c/li>\n  <li><span class='match'>he\u003c/span>ar\u003c/li>\n  <li><span class='match'>he\u003c/span>art\u003c/li>\n  <li><span class='match'>he\u003c/span>at\u003c/li>\n  <li><span class='match'>he\u003c/span>avy\u003c/li>\n  <li><span class='match'>he\u003c/span>ll\u003c/li>\n  <li><span class='match'>he\u003c/span>lp\u003c/li>\n  <li><span class='match'>he\u003c/span>re\u003c/li>\n  <li><span class='match'>hi\u003c/span>gh\u003c/li>\n  <li><span class='match'>hi\u003c/span>story\u003c/li>\n  <li><span class='match'>hi\u003c/span>t\u003c/li>\n  <li><span class='match'>ho\u003c/span>ld\u003c/li>\n  <li><span class='match'>ho\u003c/span>liday\u003c/li>\n  <li><span class='match'>ho\u003c/span>me\u003c/li>\n  <li><span class='match'>ho\u003c/span>nest\u003c/li>\n  <li><span class='match'>ho\u003c/span>pe\u003c/li>\n  <li><span class='match'>ho\u003c/span>rse\u003c/li>\n  <li><span class='match'>ho\u003c/span>spital\u003c/li>\n  <li><span class='match'>ho\u003c/span>t\u003c/li>\n  <li><span class='match'>ho\u003c/span>ur\u003c/li>\n  <li><span class='match'>ho\u003c/span>use\u003c/li>\n  <li><span class='match'>ho\u003c/span>w\u003c/li>\n  <li><span class='match'>ho\u003c/span>wever\u003c/li>\n  <li><span class='match'>hu\u003c/span>llo\u003c/li>\n  <li><span class='match'>hu\u003c/span>ndred\u003c/li>\n  <li><span class='match'>hu\u003c/span>sband\u003c/li>\n  <li><span class='match'>id\u003c/span>ea\u003c/li>\n  <li><span class='match'>id\u003c/span>entify\u003c/li>\n  <li><span class='match'>if\u003c/span>\u003c/li>\n  <li><span class='match'>im\u003c/span>agine\u003c/li>\n  <li><span class='match'>im\u003c/span>portant\u003c/li>\n  <li><span class='match'>im\u003c/span>prove\u003c/li>\n  <li><span class='match'>in\u003c/span>\u003c/li>\n  <li><span class='match'>in\u003c/span>clude\u003c/li>\n  <li><span class='match'>in\u003c/span>come\u003c/li>\n  <li><span class='match'>in\u003c/span>crease\u003c/li>\n  <li><span class='match'>in\u003c/span>deed\u003c/li>\n  <li><span class='match'>in\u003c/span>dividual\u003c/li>\n  <li><span class='match'>in\u003c/span>dustry\u003c/li>\n  <li><span class='match'>in\u003c/span>form\u003c/li>\n  <li><span class='match'>in\u003c/span>side\u003c/li>\n  <li><span class='match'>in\u003c/span>stead\u003c/li>\n  <li><span class='match'>in\u003c/span>sure\u003c/li>\n  <li><span class='match'>in\u003c/span>terest\u003c/li>\n  <li><span class='match'>in\u003c/span>to\u003c/li>\n  <li><span class='match'>in\u003c/span>troduce\u003c/li>\n  <li><span class='match'>in\u003c/span>vest\u003c/li>\n  <li><span class='match'>in\u003c/span>volve\u003c/li>\n  <li><span class='match'>is\u003c/span>sue\u003c/li>\n  <li><span class='match'>it\u003c/span>\u003c/li>\n  <li><span class='match'>it\u003c/span>em\u003c/li>\n  <li><span class='match'>je\u003c/span>sus\u003c/li>\n  <li><span class='match'>jo\u003c/span>b\u003c/li>\n  <li><span class='match'>jo\u003c/span>in\u003c/li>\n  <li><span class='match'>ju\u003c/span>dge\u003c/li>\n  <li><span class='match'>ju\u003c/span>mp\u003c/li>\n  <li><span class='match'>ju\u003c/span>st\u003c/li>\n  <li><span class='match'>ke\u003c/span>ep\u003c/li>\n  <li><span class='match'>ke\u003c/span>y\u003c/li>\n  <li><span class='match'>ki\u003c/span>d\u003c/li>\n  <li><span class='match'>ki\u003c/span>ll\u003c/li>\n  <li><span class='match'>ki\u003c/span>nd\u003c/li>\n  <li><span class='match'>ki\u003c/span>ng\u003c/li>\n  <li><span class='match'>ki\u003c/span>tchen\u003c/li>\n  <li><span class='match'>kn\u003c/span>ock\u003c/li>\n  <li><span class='match'>kn\u003c/span>ow\u003c/li>\n  <li><span class='match'>la\u003c/span>bour\u003c/li>\n  <li><span class='match'>la\u003c/span>d\u003c/li>\n  <li><span class='match'>la\u003c/span>dy\u003c/li>\n  <li><span class='match'>la\u003c/span>nd\u003c/li>\n  <li><span class='match'>la\u003c/span>nguage\u003c/li>\n  <li><span class='match'>la\u003c/span>rge\u003c/li>\n  <li><span class='match'>la\u003c/span>st\u003c/li>\n  <li><span class='match'>la\u003c/span>te\u003c/li>\n  <li><span class='match'>la\u003c/span>ugh\u003c/li>\n  <li><span class='match'>la\u003c/span>w\u003c/li>\n  <li><span class='match'>la\u003c/span>y\u003c/li>\n  <li><span class='match'>le\u003c/span>ad\u003c/li>\n  <li><span class='match'>le\u003c/span>arn\u003c/li>\n  <li><span class='match'>le\u003c/span>ave\u003c/li>\n  <li><span class='match'>le\u003c/span>ft\u003c/li>\n  <li><span class='match'>le\u003c/span>g\u003c/li>\n  <li><span class='match'>le\u003c/span>ss\u003c/li>\n  <li><span class='match'>le\u003c/span>t\u003c/li>\n  <li><span class='match'>le\u003c/span>tter\u003c/li>\n  <li><span class='match'>le\u003c/span>vel\u003c/li>\n  <li><span class='match'>li\u003c/span>e\u003c/li>\n  <li><span class='match'>li\u003c/span>fe\u003c/li>\n  <li><span class='match'>li\u003c/span>ght\u003c/li>\n  <li><span class='match'>li\u003c/span>ke\u003c/li>\n  <li><span class='match'>li\u003c/span>kely\u003c/li>\n  <li><span class='match'>li\u003c/span>mit\u003c/li>\n  <li><span class='match'>li\u003c/span>ne\u003c/li>\n  <li><span class='match'>li\u003c/span>nk\u003c/li>\n  <li><span class='match'>li\u003c/span>st\u003c/li>\n  <li><span class='match'>li\u003c/span>sten\u003c/li>\n  <li><span class='match'>li\u003c/span>ttle\u003c/li>\n  <li><span class='match'>li\u003c/span>ve\u003c/li>\n  <li><span class='match'>lo\u003c/span>ad\u003c/li>\n  <li><span class='match'>lo\u003c/span>cal\u003c/li>\n  <li><span class='match'>lo\u003c/span>ck\u003c/li>\n  <li><span class='match'>lo\u003c/span>ndon\u003c/li>\n  <li><span class='match'>lo\u003c/span>ng\u003c/li>\n  <li><span class='match'>lo\u003c/span>ok\u003c/li>\n  <li><span class='match'>lo\u003c/span>rd\u003c/li>\n  <li><span class='match'>lo\u003c/span>se\u003c/li>\n  <li><span class='match'>lo\u003c/span>t\u003c/li>\n  <li><span class='match'>lo\u003c/span>ve\u003c/li>\n  <li><span class='match'>lo\u003c/span>w\u003c/li>\n  <li><span class='match'>lu\u003c/span>ck\u003c/li>\n  <li><span class='match'>lu\u003c/span>nch\u003c/li>\n  <li><span class='match'>ma\u003c/span>chine\u003c/li>\n  <li><span class='match'>ma\u003c/span>in\u003c/li>\n  <li><span class='match'>ma\u003c/span>jor\u003c/li>\n  <li><span class='match'>ma\u003c/span>ke\u003c/li>\n  <li><span class='match'>ma\u003c/span>n\u003c/li>\n  <li><span class='match'>ma\u003c/span>nage\u003c/li>\n  <li><span class='match'>ma\u003c/span>ny\u003c/li>\n  <li><span class='match'>ma\u003c/span>rk\u003c/li>\n  <li><span class='match'>ma\u003c/span>rket\u003c/li>\n  <li><span class='match'>ma\u003c/span>rry\u003c/li>\n  <li><span class='match'>ma\u003c/span>tch\u003c/li>\n  <li><span class='match'>ma\u003c/span>tter\u003c/li>\n  <li><span class='match'>ma\u003c/span>y\u003c/li>\n  <li><span class='match'>ma\u003c/span>ybe\u003c/li>\n  <li><span class='match'>me\u003c/span>an\u003c/li>\n  <li><span class='match'>me\u003c/span>aning\u003c/li>\n  <li><span class='match'>me\u003c/span>asure\u003c/li>\n  <li><span class='match'>me\u003c/span>et\u003c/li>\n  <li><span class='match'>me\u003c/span>mber\u003c/li>\n  <li><span class='match'>me\u003c/span>ntion\u003c/li>\n  <li><span class='match'>mi\u003c/span>ddle\u003c/li>\n  <li><span class='match'>mi\u003c/span>ght\u003c/li>\n  <li><span class='match'>mi\u003c/span>le\u003c/li>\n  <li><span class='match'>mi\u003c/span>lk\u003c/li>\n  <li><span class='match'>mi\u003c/span>llion\u003c/li>\n  <li><span class='match'>mi\u003c/span>nd\u003c/li>\n  <li><span class='match'>mi\u003c/span>nister\u003c/li>\n  <li><span class='match'>mi\u003c/span>nus\u003c/li>\n  <li><span class='match'>mi\u003c/span>nute\u003c/li>\n  <li><span class='match'>mi\u003c/span>ss\u003c/li>\n  <li><span class='match'>mi\u003c/span>ster\u003c/li>\n  <li><span class='match'>mo\u003c/span>ment\u003c/li>\n  <li><span class='match'>mo\u003c/span>nday\u003c/li>\n  <li><span class='match'>mo\u003c/span>ney\u003c/li>\n  <li><span class='match'>mo\u003c/span>nth\u003c/li>\n  <li><span class='match'>mo\u003c/span>re\u003c/li>\n  <li><span class='match'>mo\u003c/span>rning\u003c/li>\n  <li><span class='match'>mo\u003c/span>st\u003c/li>\n  <li><span class='match'>mo\u003c/span>ther\u003c/li>\n  <li><span class='match'>mo\u003c/span>tion\u003c/li>\n  <li><span class='match'>mo\u003c/span>ve\u003c/li>\n  <li><span class='match'>mr\u003c/span>s\u003c/li>\n  <li><span class='match'>mu\u003c/span>ch\u003c/li>\n  <li><span class='match'>mu\u003c/span>sic\u003c/li>\n  <li><span class='match'>mu\u003c/span>st\u003c/li>\n  <li><span class='match'>na\u003c/span>me\u003c/li>\n  <li><span class='match'>na\u003c/span>tion\u003c/li>\n  <li><span class='match'>na\u003c/span>ture\u003c/li>\n  <li><span class='match'>ne\u003c/span>ar\u003c/li>\n  <li><span class='match'>ne\u003c/span>cessary\u003c/li>\n  <li><span class='match'>ne\u003c/span>ed\u003c/li>\n  <li><span class='match'>ne\u003c/span>ver\u003c/li>\n  <li><span class='match'>ne\u003c/span>w\u003c/li>\n  <li><span class='match'>ne\u003c/span>ws\u003c/li>\n  <li><span class='match'>ne\u003c/span>xt\u003c/li>\n  <li><span class='match'>ni\u003c/span>ce\u003c/li>\n  <li><span class='match'>ni\u003c/span>ght\u003c/li>\n  <li><span class='match'>ni\u003c/span>ne\u003c/li>\n  <li><span class='match'>no\u003c/span>\u003c/li>\n  <li><span class='match'>no\u003c/span>n\u003c/li>\n  <li><span class='match'>no\u003c/span>ne\u003c/li>\n  <li><span class='match'>no\u003c/span>rmal\u003c/li>\n  <li><span class='match'>no\u003c/span>rth\u003c/li>\n  <li><span class='match'>no\u003c/span>t\u003c/li>\n  <li><span class='match'>no\u003c/span>te\u003c/li>\n  <li><span class='match'>no\u003c/span>tice\u003c/li>\n  <li><span class='match'>no\u003c/span>w\u003c/li>\n  <li><span class='match'>nu\u003c/span>mber\u003c/li>\n  <li><span class='match'>ob\u003c/span>vious\u003c/li>\n  <li><span class='match'>oc\u003c/span>casion\u003c/li>\n  <li><span class='match'>od\u003c/span>d\u003c/li>\n  <li><span class='match'>of\u003c/span>\u003c/li>\n  <li><span class='match'>of\u003c/span>f\u003c/li>\n  <li><span class='match'>of\u003c/span>fer\u003c/li>\n  <li><span class='match'>of\u003c/span>fice\u003c/li>\n  <li><span class='match'>of\u003c/span>ten\u003c/li>\n  <li><span class='match'>ok\u003c/span>ay\u003c/li>\n  <li><span class='match'>ol\u003c/span>d\u003c/li>\n  <li><span class='match'>on\u003c/span>\u003c/li>\n  <li><span class='match'>on\u003c/span>ce\u003c/li>\n  <li><span class='match'>on\u003c/span>e\u003c/li>\n  <li><span class='match'>on\u003c/span>ly\u003c/li>\n  <li><span class='match'>op\u003c/span>en\u003c/li>\n  <li><span class='match'>op\u003c/span>erate\u003c/li>\n  <li><span class='match'>op\u003c/span>portunity\u003c/li>\n  <li><span class='match'>op\u003c/span>pose\u003c/li>\n  <li><span class='match'>or\u003c/span>\u003c/li>\n  <li><span class='match'>or\u003c/span>der\u003c/li>\n  <li><span class='match'>or\u003c/span>ganize\u003c/li>\n  <li><span class='match'>or\u003c/span>iginal\u003c/li>\n  <li><span class='match'>ot\u003c/span>her\u003c/li>\n  <li><span class='match'>ot\u003c/span>herwise\u003c/li>\n  <li><span class='match'>ou\u003c/span>ght\u003c/li>\n  <li><span class='match'>ou\u003c/span>t\u003c/li>\n  <li><span class='match'>ov\u003c/span>er\u003c/li>\n  <li><span class='match'>ow\u003c/span>n\u003c/li>\n  <li><span class='match'>pa\u003c/span>ck\u003c/li>\n  <li><span class='match'>pa\u003c/span>ge\u003c/li>\n  <li><span class='match'>pa\u003c/span>int\u003c/li>\n  <li><span class='match'>pa\u003c/span>ir\u003c/li>\n  <li><span class='match'>pa\u003c/span>per\u003c/li>\n  <li><span class='match'>pa\u003c/span>ragraph\u003c/li>\n  <li><span class='match'>pa\u003c/span>rdon\u003c/li>\n  <li><span class='match'>pa\u003c/span>rent\u003c/li>\n  <li><span class='match'>pa\u003c/span>rk\u003c/li>\n  <li><span class='match'>pa\u003c/span>rt\u003c/li>\n  <li><span class='match'>pa\u003c/span>rticular\u003c/li>\n  <li><span class='match'>pa\u003c/span>rty\u003c/li>\n  <li><span class='match'>pa\u003c/span>ss\u003c/li>\n  <li><span class='match'>pa\u003c/span>st\u003c/li>\n  <li><span class='match'>pa\u003c/span>y\u003c/li>\n  <li><span class='match'>pe\u003c/span>nce\u003c/li>\n  <li><span class='match'>pe\u003c/span>nsion\u003c/li>\n  <li><span class='match'>pe\u003c/span>ople\u003c/li>\n  <li><span class='match'>pe\u003c/span>r\u003c/li>\n  <li><span class='match'>pe\u003c/span>rcent\u003c/li>\n  <li><span class='match'>pe\u003c/span>rfect\u003c/li>\n  <li><span class='match'>pe\u003c/span>rhaps\u003c/li>\n  <li><span class='match'>pe\u003c/span>riod\u003c/li>\n  <li><span class='match'>pe\u003c/span>rson\u003c/li>\n  <li><span class='match'>ph\u003c/span>otograph\u003c/li>\n  <li><span class='match'>pi\u003c/span>ck\u003c/li>\n  <li><span class='match'>pi\u003c/span>cture\u003c/li>\n  <li><span class='match'>pi\u003c/span>ece\u003c/li>\n  <li><span class='match'>pl\u003c/span>ace\u003c/li>\n  <li><span class='match'>pl\u003c/span>an\u003c/li>\n  <li><span class='match'>pl\u003c/span>ay\u003c/li>\n  <li><span class='match'>pl\u003c/span>ease\u003c/li>\n  <li><span class='match'>pl\u003c/span>us\u003c/li>\n  <li><span class='match'>po\u003c/span>int\u003c/li>\n  <li><span class='match'>po\u003c/span>lice\u003c/li>\n  <li><span class='match'>po\u003c/span>licy\u003c/li>\n  <li><span class='match'>po\u003c/span>litic\u003c/li>\n  <li><span class='match'>po\u003c/span>or\u003c/li>\n  <li><span class='match'>po\u003c/span>sition\u003c/li>\n  <li><span class='match'>po\u003c/span>sitive\u003c/li>\n  <li><span class='match'>po\u003c/span>ssible\u003c/li>\n  <li><span class='match'>po\u003c/span>st\u003c/li>\n  <li><span class='match'>po\u003c/span>und\u003c/li>\n  <li><span class='match'>po\u003c/span>wer\u003c/li>\n  <li><span class='match'>pr\u003c/span>actise\u003c/li>\n  <li><span class='match'>pr\u003c/span>epare\u003c/li>\n  <li><span class='match'>pr\u003c/span>esent\u003c/li>\n  <li><span class='match'>pr\u003c/span>ess\u003c/li>\n  <li><span class='match'>pr\u003c/span>essure\u003c/li>\n  <li><span class='match'>pr\u003c/span>esume\u003c/li>\n  <li><span class='match'>pr\u003c/span>etty\u003c/li>\n  <li><span class='match'>pr\u003c/span>evious\u003c/li>\n  <li><span class='match'>pr\u003c/span>ice\u003c/li>\n  <li><span class='match'>pr\u003c/span>int\u003c/li>\n  <li><span class='match'>pr\u003c/span>ivate\u003c/li>\n  <li><span class='match'>pr\u003c/span>obable\u003c/li>\n  <li><span class='match'>pr\u003c/span>oblem\u003c/li>\n  <li><span class='match'>pr\u003c/span>oceed\u003c/li>\n  <li><span class='match'>pr\u003c/span>ocess\u003c/li>\n  <li><span class='match'>pr\u003c/span>oduce\u003c/li>\n  <li><span class='match'>pr\u003c/span>oduct\u003c/li>\n  <li><span class='match'>pr\u003c/span>ogramme\u003c/li>\n  <li><span class='match'>pr\u003c/span>oject\u003c/li>\n  <li><span class='match'>pr\u003c/span>oper\u003c/li>\n  <li><span class='match'>pr\u003c/span>opose\u003c/li>\n  <li><span class='match'>pr\u003c/span>otect\u003c/li>\n  <li><span class='match'>pr\u003c/span>ovide\u003c/li>\n  <li><span class='match'>pu\u003c/span>blic\u003c/li>\n  <li><span class='match'>pu\u003c/span>ll\u003c/li>\n  <li><span class='match'>pu\u003c/span>rpose\u003c/li>\n  <li><span class='match'>pu\u003c/span>sh\u003c/li>\n  <li><span class='match'>pu\u003c/span>t\u003c/li>\n  <li><span class='match'>qu\u003c/span>ality\u003c/li>\n  <li><span class='match'>qu\u003c/span>arter\u003c/li>\n  <li><span class='match'>qu\u003c/span>estion\u003c/li>\n  <li><span class='match'>qu\u003c/span>ick\u003c/li>\n  <li><span class='match'>qu\u003c/span>id\u003c/li>\n  <li><span class='match'>qu\u003c/span>iet\u003c/li>\n  <li><span class='match'>qu\u003c/span>ite\u003c/li>\n  <li><span class='match'>ra\u003c/span>dio\u003c/li>\n  <li><span class='match'>ra\u003c/span>il\u003c/li>\n  <li><span class='match'>ra\u003c/span>ise\u003c/li>\n  <li><span class='match'>ra\u003c/span>nge\u003c/li>\n  <li><span class='match'>ra\u003c/span>te\u003c/li>\n  <li><span class='match'>ra\u003c/span>ther\u003c/li>\n  <li><span class='match'>re\u003c/span>ad\u003c/li>\n  <li><span class='match'>re\u003c/span>ady\u003c/li>\n  <li><span class='match'>re\u003c/span>al\u003c/li>\n  <li><span class='match'>re\u003c/span>alise\u003c/li>\n  <li><span class='match'>re\u003c/span>ally\u003c/li>\n  <li><span class='match'>re\u003c/span>ason\u003c/li>\n  <li><span class='match'>re\u003c/span>ceive\u003c/li>\n  <li><span class='match'>re\u003c/span>cent\u003c/li>\n  <li><span class='match'>re\u003c/span>ckon\u003c/li>\n  <li><span class='match'>re\u003c/span>cognize\u003c/li>\n  <li><span class='match'>re\u003c/span>commend\u003c/li>\n  <li><span class='match'>re\u003c/span>cord\u003c/li>\n  <li><span class='match'>re\u003c/span>d\u003c/li>\n  <li><span class='match'>re\u003c/span>duce\u003c/li>\n  <li><span class='match'>re\u003c/span>fer\u003c/li>\n  <li><span class='match'>re\u003c/span>gard\u003c/li>\n  <li><span class='match'>re\u003c/span>gion\u003c/li>\n  <li><span class='match'>re\u003c/span>lation\u003c/li>\n  <li><span class='match'>re\u003c/span>member\u003c/li>\n  <li><span class='match'>re\u003c/span>port\u003c/li>\n  <li><span class='match'>re\u003c/span>present\u003c/li>\n  <li><span class='match'>re\u003c/span>quire\u003c/li>\n  <li><span class='match'>re\u003c/span>search\u003c/li>\n  <li><span class='match'>re\u003c/span>source\u003c/li>\n  <li><span class='match'>re\u003c/span>spect\u003c/li>\n  <li><span class='match'>re\u003c/span>sponsible\u003c/li>\n  <li><span class='match'>re\u003c/span>st\u003c/li>\n  <li><span class='match'>re\u003c/span>sult\u003c/li>\n  <li><span class='match'>re\u003c/span>turn\u003c/li>\n  <li><span class='match'>ri\u003c/span>d\u003c/li>\n  <li><span class='match'>ri\u003c/span>ght\u003c/li>\n  <li><span class='match'>ri\u003c/span>ng\u003c/li>\n  <li><span class='match'>ri\u003c/span>se\u003c/li>\n  <li><span class='match'>ro\u003c/span>ad\u003c/li>\n  <li><span class='match'>ro\u003c/span>le\u003c/li>\n  <li><span class='match'>ro\u003c/span>ll\u003c/li>\n  <li><span class='match'>ro\u003c/span>om\u003c/li>\n  <li><span class='match'>ro\u003c/span>und\u003c/li>\n  <li><span class='match'>ru\u003c/span>le\u003c/li>\n  <li><span class='match'>ru\u003c/span>n\u003c/li>\n  <li><span class='match'>sa\u003c/span>fe\u003c/li>\n  <li><span class='match'>sa\u003c/span>le\u003c/li>\n  <li><span class='match'>sa\u003c/span>me\u003c/li>\n  <li><span class='match'>sa\u003c/span>turday\u003c/li>\n  <li><span class='match'>sa\u003c/span>ve\u003c/li>\n  <li><span class='match'>sa\u003c/span>y\u003c/li>\n  <li><span class='match'>sc\u003c/span>heme\u003c/li>\n  <li><span class='match'>sc\u003c/span>hool\u003c/li>\n  <li><span class='match'>sc\u003c/span>ience\u003c/li>\n  <li><span class='match'>sc\u003c/span>ore\u003c/li>\n  <li><span class='match'>sc\u003c/span>otland\u003c/li>\n  <li><span class='match'>se\u003c/span>at\u003c/li>\n  <li><span class='match'>se\u003c/span>cond\u003c/li>\n  <li><span class='match'>se\u003c/span>cretary\u003c/li>\n  <li><span class='match'>se\u003c/span>ction\u003c/li>\n  <li><span class='match'>se\u003c/span>cure\u003c/li>\n  <li><span class='match'>se\u003c/span>e\u003c/li>\n  <li><span class='match'>se\u003c/span>em\u003c/li>\n  <li><span class='match'>se\u003c/span>lf\u003c/li>\n  <li><span class='match'>se\u003c/span>ll\u003c/li>\n  <li><span class='match'>se\u003c/span>nd\u003c/li>\n  <li><span class='match'>se\u003c/span>nse\u003c/li>\n  <li><span class='match'>se\u003c/span>parate\u003c/li>\n  <li><span class='match'>se\u003c/span>rious\u003c/li>\n  <li><span class='match'>se\u003c/span>rve\u003c/li>\n  <li><span class='match'>se\u003c/span>rvice\u003c/li>\n  <li><span class='match'>se\u003c/span>t\u003c/li>\n  <li><span class='match'>se\u003c/span>ttle\u003c/li>\n  <li><span class='match'>se\u003c/span>ven\u003c/li>\n  <li><span class='match'>se\u003c/span>x\u003c/li>\n  <li><span class='match'>sh\u003c/span>all\u003c/li>\n  <li><span class='match'>sh\u003c/span>are\u003c/li>\n  <li><span class='match'>sh\u003c/span>e\u003c/li>\n  <li><span class='match'>sh\u003c/span>eet\u003c/li>\n  <li><span class='match'>sh\u003c/span>oe\u003c/li>\n  <li><span class='match'>sh\u003c/span>oot\u003c/li>\n  <li><span class='match'>sh\u003c/span>op\u003c/li>\n  <li><span class='match'>sh\u003c/span>ort\u003c/li>\n  <li><span class='match'>sh\u003c/span>ould\u003c/li>\n  <li><span class='match'>sh\u003c/span>ow\u003c/li>\n  <li><span class='match'>sh\u003c/span>ut\u003c/li>\n  <li><span class='match'>si\u003c/span>ck\u003c/li>\n  <li><span class='match'>si\u003c/span>de\u003c/li>\n  <li><span class='match'>si\u003c/span>gn\u003c/li>\n  <li><span class='match'>si\u003c/span>milar\u003c/li>\n  <li><span class='match'>si\u003c/span>mple\u003c/li>\n  <li><span class='match'>si\u003c/span>nce\u003c/li>\n  <li><span class='match'>si\u003c/span>ng\u003c/li>\n  <li><span class='match'>si\u003c/span>ngle\u003c/li>\n  <li><span class='match'>si\u003c/span>r\u003c/li>\n  <li><span class='match'>si\u003c/span>ster\u003c/li>\n  <li><span class='match'>si\u003c/span>t\u003c/li>\n  <li><span class='match'>si\u003c/span>te\u003c/li>\n  <li><span class='match'>si\u003c/span>tuate\u003c/li>\n  <li><span class='match'>si\u003c/span>x\u003c/li>\n  <li><span class='match'>si\u003c/span>ze\u003c/li>\n  <li><span class='match'>sl\u003c/span>eep\u003c/li>\n  <li><span class='match'>sl\u003c/span>ight\u003c/li>\n  <li><span class='match'>sl\u003c/span>ow\u003c/li>\n  <li><span class='match'>sm\u003c/span>all\u003c/li>\n  <li><span class='match'>sm\u003c/span>oke\u003c/li>\n  <li><span class='match'>so\u003c/span>\u003c/li>\n  <li><span class='match'>so\u003c/span>cial\u003c/li>\n  <li><span class='match'>so\u003c/span>ciety\u003c/li>\n  <li><span class='match'>so\u003c/span>me\u003c/li>\n  <li><span class='match'>so\u003c/span>n\u003c/li>\n  <li><span class='match'>so\u003c/span>on\u003c/li>\n  <li><span class='match'>so\u003c/span>rry\u003c/li>\n  <li><span class='match'>so\u003c/span>rt\u003c/li>\n  <li><span class='match'>so\u003c/span>und\u003c/li>\n  <li><span class='match'>so\u003c/span>uth\u003c/li>\n  <li><span class='match'>sp\u003c/span>ace\u003c/li>\n  <li><span class='match'>sp\u003c/span>eak\u003c/li>\n  <li><span class='match'>sp\u003c/span>ecial\u003c/li>\n  <li><span class='match'>sp\u003c/span>ecific\u003c/li>\n  <li><span class='match'>sp\u003c/span>eed\u003c/li>\n  <li><span class='match'>sp\u003c/span>ell\u003c/li>\n  <li><span class='match'>sp\u003c/span>end\u003c/li>\n  <li><span class='match'>sq\u003c/span>uare\u003c/li>\n  <li><span class='match'>st\u003c/span>aff\u003c/li>\n  <li><span class='match'>st\u003c/span>age\u003c/li>\n  <li><span class='match'>st\u003c/span>airs\u003c/li>\n  <li><span class='match'>st\u003c/span>and\u003c/li>\n  <li><span class='match'>st\u003c/span>andard\u003c/li>\n  <li><span class='match'>st\u003c/span>art\u003c/li>\n  <li><span class='match'>st\u003c/span>ate\u003c/li>\n  <li><span class='match'>st\u003c/span>ation\u003c/li>\n  <li><span class='match'>st\u003c/span>ay\u003c/li>\n  <li><span class='match'>st\u003c/span>ep\u003c/li>\n  <li><span class='match'>st\u003c/span>ick\u003c/li>\n  <li><span class='match'>st\u003c/span>ill\u003c/li>\n  <li><span class='match'>st\u003c/span>op\u003c/li>\n  <li><span class='match'>st\u003c/span>ory\u003c/li>\n  <li><span class='match'>st\u003c/span>raight\u003c/li>\n  <li><span class='match'>st\u003c/span>rategy\u003c/li>\n  <li><span class='match'>st\u003c/span>reet\u003c/li>\n  <li><span class='match'>st\u003c/span>rike\u003c/li>\n  <li><span class='match'>st\u003c/span>rong\u003c/li>\n  <li><span class='match'>st\u003c/span>ructure\u003c/li>\n  <li><span class='match'>st\u003c/span>udent\u003c/li>\n  <li><span class='match'>st\u003c/span>udy\u003c/li>\n  <li><span class='match'>st\u003c/span>uff\u003c/li>\n  <li><span class='match'>st\u003c/span>upid\u003c/li>\n  <li><span class='match'>su\u003c/span>bject\u003c/li>\n  <li><span class='match'>su\u003c/span>cceed\u003c/li>\n  <li><span class='match'>su\u003c/span>ch\u003c/li>\n  <li><span class='match'>su\u003c/span>dden\u003c/li>\n  <li><span class='match'>su\u003c/span>ggest\u003c/li>\n  <li><span class='match'>su\u003c/span>it\u003c/li>\n  <li><span class='match'>su\u003c/span>mmer\u003c/li>\n  <li><span class='match'>su\u003c/span>n\u003c/li>\n  <li><span class='match'>su\u003c/span>nday\u003c/li>\n  <li><span class='match'>su\u003c/span>pply\u003c/li>\n  <li><span class='match'>su\u003c/span>pport\u003c/li>\n  <li><span class='match'>su\u003c/span>ppose\u003c/li>\n  <li><span class='match'>su\u003c/span>re\u003c/li>\n  <li><span class='match'>su\u003c/span>rprise\u003c/li>\n  <li><span class='match'>sw\u003c/span>itch\u003c/li>\n  <li><span class='match'>sy\u003c/span>stem\u003c/li>\n  <li><span class='match'>ta\u003c/span>ble\u003c/li>\n  <li><span class='match'>ta\u003c/span>ke\u003c/li>\n  <li><span class='match'>ta\u003c/span>lk\u003c/li>\n  <li><span class='match'>ta\u003c/span>pe\u003c/li>\n  <li><span class='match'>ta\u003c/span>x\u003c/li>\n  <li><span class='match'>te\u003c/span>a\u003c/li>\n  <li><span class='match'>te\u003c/span>ach\u003c/li>\n  <li><span class='match'>te\u003c/span>am\u003c/li>\n  <li><span class='match'>te\u003c/span>lephone\u003c/li>\n  <li><span class='match'>te\u003c/span>levision\u003c/li>\n  <li><span class='match'>te\u003c/span>ll\u003c/li>\n  <li><span class='match'>te\u003c/span>n\u003c/li>\n  <li><span class='match'>te\u003c/span>nd\u003c/li>\n  <li><span class='match'>te\u003c/span>rm\u003c/li>\n  <li><span class='match'>te\u003c/span>rrible\u003c/li>\n  <li><span class='match'>te\u003c/span>st\u003c/li>\n  <li><span class='match'>th\u003c/span>an\u003c/li>\n  <li><span class='match'>th\u003c/span>ank\u003c/li>\n  <li><span class='match'>th\u003c/span>e\u003c/li>\n  <li><span class='match'>th\u003c/span>en\u003c/li>\n  <li><span class='match'>th\u003c/span>ere\u003c/li>\n  <li><span class='match'>th\u003c/span>erefore\u003c/li>\n  <li><span class='match'>th\u003c/span>ey\u003c/li>\n  <li><span class='match'>th\u003c/span>ing\u003c/li>\n  <li><span class='match'>th\u003c/span>ink\u003c/li>\n  <li><span class='match'>th\u003c/span>irteen\u003c/li>\n  <li><span class='match'>th\u003c/span>irty\u003c/li>\n  <li><span class='match'>th\u003c/span>is\u003c/li>\n  <li><span class='match'>th\u003c/span>ou\u003c/li>\n  <li><span class='match'>th\u003c/span>ough\u003c/li>\n  <li><span class='match'>th\u003c/span>ousand\u003c/li>\n  <li><span class='match'>th\u003c/span>ree\u003c/li>\n  <li><span class='match'>th\u003c/span>rough\u003c/li>\n  <li><span class='match'>th\u003c/span>row\u003c/li>\n  <li><span class='match'>th\u003c/span>ursday\u003c/li>\n  <li><span class='match'>ti\u003c/span>e\u003c/li>\n  <li><span class='match'>ti\u003c/span>me\u003c/li>\n  <li><span class='match'>to\u003c/span>\u003c/li>\n  <li><span class='match'>to\u003c/span>day\u003c/li>\n  <li><span class='match'>to\u003c/span>gether\u003c/li>\n  <li><span class='match'>to\u003c/span>morrow\u003c/li>\n  <li><span class='match'>to\u003c/span>night\u003c/li>\n  <li><span class='match'>to\u003c/span>o\u003c/li>\n  <li><span class='match'>to\u003c/span>p\u003c/li>\n  <li><span class='match'>to\u003c/span>tal\u003c/li>\n  <li><span class='match'>to\u003c/span>uch\u003c/li>\n  <li><span class='match'>to\u003c/span>ward\u003c/li>\n  <li><span class='match'>to\u003c/span>wn\u003c/li>\n  <li><span class='match'>tr\u003c/span>ade\u003c/li>\n  <li><span class='match'>tr\u003c/span>affic\u003c/li>\n  <li><span class='match'>tr\u003c/span>ain\u003c/li>\n  <li><span class='match'>tr\u003c/span>ansport\u003c/li>\n  <li><span class='match'>tr\u003c/span>avel\u003c/li>\n  <li><span class='match'>tr\u003c/span>eat\u003c/li>\n  <li><span class='match'>tr\u003c/span>ee\u003c/li>\n  <li><span class='match'>tr\u003c/span>ouble\u003c/li>\n  <li><span class='match'>tr\u003c/span>ue\u003c/li>\n  <li><span class='match'>tr\u003c/span>ust\u003c/li>\n  <li><span class='match'>tr\u003c/span>y\u003c/li>\n  <li><span class='match'>tu\u003c/span>esday\u003c/li>\n  <li><span class='match'>tu\u003c/span>rn\u003c/li>\n  <li><span class='match'>tw\u003c/span>elve\u003c/li>\n  <li><span class='match'>tw\u003c/span>enty\u003c/li>\n  <li><span class='match'>tw\u003c/span>o\u003c/li>\n  <li><span class='match'>ty\u003c/span>pe\u003c/li>\n  <li><span class='match'>un\u003c/span>der\u003c/li>\n  <li><span class='match'>un\u003c/span>derstand\u003c/li>\n  <li><span class='match'>un\u003c/span>ion\u003c/li>\n  <li><span class='match'>un\u003c/span>it\u003c/li>\n  <li><span class='match'>un\u003c/span>ite\u003c/li>\n  <li><span class='match'>un\u003c/span>iversity\u003c/li>\n  <li><span class='match'>un\u003c/span>less\u003c/li>\n  <li><span class='match'>un\u003c/span>til\u003c/li>\n  <li><span class='match'>up\u003c/span>\u003c/li>\n  <li><span class='match'>up\u003c/span>on\u003c/li>\n  <li><span class='match'>us\u003c/span>e\u003c/li>\n  <li><span class='match'>us\u003c/span>ual\u003c/li>\n  <li><span class='match'>va\u003c/span>lue\u003c/li>\n  <li><span class='match'>va\u003c/span>rious\u003c/li>\n  <li><span class='match'>ve\u003c/span>ry\u003c/li>\n  <li><span class='match'>vi\u003c/span>deo\u003c/li>\n  <li><span class='match'>vi\u003c/span>ew\u003c/li>\n  <li><span class='match'>vi\u003c/span>llage\u003c/li>\n  <li><span class='match'>vi\u003c/span>sit\u003c/li>\n  <li><span class='match'>vo\u003c/span>te\u003c/li>\n  <li><span class='match'>wa\u003c/span>ge\u003c/li>\n  <li><span class='match'>wa\u003c/span>it\u003c/li>\n  <li><span class='match'>wa\u003c/span>lk\u003c/li>\n  <li><span class='match'>wa\u003c/span>ll\u003c/li>\n  <li><span class='match'>wa\u003c/span>nt\u003c/li>\n  <li><span class='match'>wa\u003c/span>r\u003c/li>\n  <li><span class='match'>wa\u003c/span>rm\u003c/li>\n  <li><span class='match'>wa\u003c/span>sh\u003c/li>\n  <li><span class='match'>wa\u003c/span>ste\u003c/li>\n  <li><span class='match'>wa\u003c/span>tch\u003c/li>\n  <li><span class='match'>wa\u003c/span>ter\u003c/li>\n  <li><span class='match'>wa\u003c/span>y\u003c/li>\n  <li><span class='match'>we\u003c/span>\u003c/li>\n  <li><span class='match'>we\u003c/span>ar\u003c/li>\n  <li><span class='match'>we\u003c/span>dnesday\u003c/li>\n  <li><span class='match'>we\u003c/span>e\u003c/li>\n  <li><span class='match'>we\u003c/span>ek\u003c/li>\n  <li><span class='match'>we\u003c/span>igh\u003c/li>\n  <li><span class='match'>we\u003c/span>lcome\u003c/li>\n  <li><span class='match'>we\u003c/span>ll\u003c/li>\n  <li><span class='match'>we\u003c/span>st\u003c/li>\n  <li><span class='match'>wh\u003c/span>at\u003c/li>\n  <li><span class='match'>wh\u003c/span>en\u003c/li>\n  <li><span class='match'>wh\u003c/span>ere\u003c/li>\n  <li><span class='match'>wh\u003c/span>ether\u003c/li>\n  <li><span class='match'>wh\u003c/span>ich\u003c/li>\n  <li><span class='match'>wh\u003c/span>ile\u003c/li>\n  <li><span class='match'>wh\u003c/span>ite\u003c/li>\n  <li><span class='match'>wh\u003c/span>o\u003c/li>\n  <li><span class='match'>wh\u003c/span>ole\u003c/li>\n  <li><span class='match'>wh\u003c/span>y\u003c/li>\n  <li><span class='match'>wi\u003c/span>de\u003c/li>\n  <li><span class='match'>wi\u003c/span>fe\u003c/li>\n  <li><span class='match'>wi\u003c/span>ll\u003c/li>\n  <li><span class='match'>wi\u003c/span>n\u003c/li>\n  <li><span class='match'>wi\u003c/span>nd\u003c/li>\n  <li><span class='match'>wi\u003c/span>ndow\u003c/li>\n  <li><span class='match'>wi\u003c/span>sh\u003c/li>\n  <li><span class='match'>wi\u003c/span>th\u003c/li>\n  <li><span class='match'>wi\u003c/span>thin\u003c/li>\n  <li><span class='match'>wi\u003c/span>thout\u003c/li>\n  <li><span class='match'>wo\u003c/span>man\u003c/li>\n  <li><span class='match'>wo\u003c/span>nder\u003c/li>\n  <li><span class='match'>wo\u003c/span>od\u003c/li>\n  <li><span class='match'>wo\u003c/span>rd\u003c/li>\n  <li><span class='match'>wo\u003c/span>rk\u003c/li>\n  <li><span class='match'>wo\u003c/span>rld\u003c/li>\n  <li><span class='match'>wo\u003c/span>rry\u003c/li>\n  <li><span class='match'>wo\u003c/span>rse\u003c/li>\n  <li><span class='match'>wo\u003c/span>rth\u003c/li>\n  <li><span class='match'>wo\u003c/span>uld\u003c/li>\n  <li><span class='match'>wr\u003c/span>ite\u003c/li>\n  <li><span class='match'>wr\u003c/span>ong\u003c/li>\n  <li><span class='match'>ye\u003c/span>ar\u003c/li>\n  <li><span class='match'>ye\u003c/span>s\u003c/li>\n  <li><span class='match'>ye\u003c/span>sterday\u003c/li>\n  <li><span class='match'>ye\u003c/span>t\u003c/li>\n  <li><span class='match'>yo\u003c/span>u\u003c/li>\n  <li><span class='match'>yo\u003c/span>ung\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
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


df %>% 
  filter(str_detect(words, "x$")) ##filter find rows having specific values or string patterns
```

```
## Warning in filter_impl(.data, dots): '.Random.seed' is not an integer
## vector but of type 'NULL', so ignored
```

```
## # A tibble: 4 × 2
##    word     i
##   <chr> <int>
## 1   box   108
## 2   sex   747
## 3   six   772
## 4   tax   841
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
## # A tibble: 980 × 4
##        word     i vowels consonants
##       <chr> <int>  <int>      <int>
## 1         a     1      1          0
## 2      able     2      2          2
## 3     about     3      3          2
## 4  absolute     4      4          4
## 5    accept     5      2          4
## 6   account     6      3          4
## 7   achieve     7      4          3
## 8    across     8      2          4
## 9       act     9      1          2
## 10   active    10      3          3
## # ... with 970 more rows
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

<!--html_preserve--><div id="htmlwidget-4783859a717d93629f82" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-4783859a717d93629f82">{"x":{"html":"<ul>\n  <li><span class='match'>aba\u003c/span>b<span class='match'>aba\u003c/span>\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
## 14.4.2 Exercises

## 1. For each of the following challenges, try solving it by using both a single regular expression, and a combination of multiple str_detect() calls.

## Find all words that start or end with x.
df %>% filter(str_detect(words, "x$")) # Four Words
```

```
## # A tibble: 4 × 2
##    word     i
##   <chr> <int>
## 1   box   108
## 2   sex   747
## 3   six   772
## 4   tax   841
```

```r
df %>% filter(str_detect(words, "^x")) # Zero Words
```

```
## # A tibble: 0 × 2
## # ... with 2 variables: word <chr>, i <int>
```

```r
df %>% filter(str_detect(words, "^(x)|(x)$")) 
```

```
## # A tibble: 4 × 2
##    word     i
##   <chr> <int>
## 1   box   108
## 2   sex   747
## 3   six   772
## 4   tax   841
```

```r
## Find all words that start with a vowel and end with a consonant.
df %>% filter(str_detect(words, "^[aeiou].*[^aeiou]$"))
```

```
## # A tibble: 122 × 2
##       word     i
##      <chr> <int>
## 1    about     3
## 2   accept     5
## 3  account     6
## 4   across     8
## 5      act     9
## 6   actual    11
## 7      add    12
## 8  address    13
## 9    admit    14
## 10  affect    16
## # ... with 112 more rows
```

```r
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
```

```
## Warning in merge.data.frame(., o, by = "word"): column names 'i.x', 'i.y'
## are duplicated in the result
```

```
## Warning in merge.data.frame(., u, by = "word"): column names 'i.x', 'i.y'
## are duplicated in the result
```

```
## [1] word i.x  i.y  i.x  i.y  i   
## <0 rows> (or 0-length row.names)
```

```r
## What word has the highest number of vowels? What word has the highest proportion of vowels? (Hint: what is the denominator?)
df2 <- df %>% 
  mutate(
    vowels = str_count(word, "[aeiou]"),
    letters = str_count(word, "[\\w]"),
    vowels.proportion = vowels/letters)

df2 %>%
  filter(vowels == max(vowels))
```

```
## # A tibble: 8 × 5
##          word     i vowels letters vowels.proportion
##         <chr> <int>  <int>   <int>             <dbl>
## 1 appropriate    48      5      11         0.4545455
## 2   associate    57      5       9         0.5555556
## 3   available    62      5       9         0.5555556
## 4   colleague   166      5       9         0.5555556
## 5   encourage   268      5       9         0.5555556
## 6  experience   292      5      10         0.5000000
## 7  individual   423      5      10         0.5000000
## 8  television   846      5      10         0.5000000
```

```r
df2 %>%
  filter(vowels.proportion == max(vowels.proportion))
```

```
## # A tibble: 1 × 5
##    word     i vowels letters vowels.proportion
##   <chr> <int>  <int>   <int>             <dbl>
## 1     a     1      1       1                 1
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

<!--html_preserve--><div id="htmlwidget-b036591451419c340253" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-b036591451419c340253">{"x":{"html":"<ul>\n  <li>It is hard to erase <span class='match'>blue\u003c/span> or <span class='match'>red\u003c/span> ink.\u003c/li>\n  <li>The <span class='match'>green\u003c/span> light in the brown box flicke<span class='match'>red\u003c/span>.\u003c/li>\n  <li>The sky in the west is tinged with <span class='match'>orange\u003c/span> <span class='match'>red\u003c/span>.\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
str_view(more, colour_match) ## Differences?
```

<!--html_preserve--><div id="htmlwidget-b18693c7ec994cbd5e69" style="width:960px;height:auto;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-b18693c7ec994cbd5e69">{"x":{"html":"<ul>\n  <li>It is hard to erase <span class='match'>blue\u003c/span> or red ink.\u003c/li>\n  <li>The <span class='match'>green\u003c/span> light in the brown box flickered.\u003c/li>\n  <li>The sky in the west is tinged with <span class='match'>orange\u003c/span> red.\u003c/li>\n\u003c/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

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
## # A tibble: 720 × 3
##                                       sentence article    noun
## *                                        <chr>   <chr>   <chr>
## 1   The birch canoe slid on the smooth planks.     the  smooth
## 2  Glue the sheet to the dark blue background.     the   sheet
## 3       It's easy to tell the depth of a well.     the   depth
## 4     These days a chicken leg is a rare dish.       a chicken
## 5         Rice is often served in round bowls.    <NA>    <NA>
## 6        The juice of lemons makes fine punch.    <NA>    <NA>
## 7  The box was thrown beside the parked truck.     the  parked
## 8  The hogs were fed chopped corn and garbage.    <NA>    <NA>
## 9          Four hours of steady work faced us.    <NA>    <NA>
## 10    Large size in stockings is hard to sell.    <NA>    <NA>
## # ... with 710 more rows
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

