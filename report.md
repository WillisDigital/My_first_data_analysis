Gun murders
================
Pramay Jain
9/29/2021

## R Markdown

This my report on Gun murders in USA with summary and a plot

``` r
library(dslabs)
library(tidyverse)
```

    ## -- Attaching packages --------------------------------------- tidyverse 1.3.1 --

    ## v ggplot2 3.3.5     v purrr   0.3.4
    ## v tibble  3.1.2     v dplyr   1.0.7
    ## v tidyr   1.1.3     v stringr 1.4.0
    ## v readr   1.4.0     v forcats 0.5.1

    ## -- Conflicts ------------------------------------------ tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
murders <- read.csv("data/murders.csv")
murders <- murders %>% mutate (region = factor(region), rate = total / population * 10^5)
save(murders, file = "rda/murders.rda")
summary(murders)
```

    ##     state               abb                      region     population      
    ##  Length:51          Length:51          North Central:12   Min.   :  563626  
    ##  Class :character   Class :character   Northeast    : 9   1st Qu.: 1696962  
    ##  Mode  :character   Mode  :character   South        :17   Median : 4339367  
    ##                                        West         :13   Mean   : 6075769  
    ##                                                           3rd Qu.: 6636084  
    ##                                                           Max.   :37253956  
    ##      total             rate        
    ##  Min.   :   2.0   Min.   : 0.3196  
    ##  1st Qu.:  24.5   1st Qu.: 1.2526  
    ##  Median :  97.0   Median : 2.6871  
    ##  Mean   : 184.4   Mean   : 2.7791  
    ##  3rd Qu.: 268.0   3rd Qu.: 3.3861  
    ##  Max.   :1257.0   Max.   :16.4528

## Including Plots

You can also embed plots, for example:

``` r
library(tidyverse)
load("rda/murders.rda")

bar_plot  <- murders %>% mutate(abb = reorder(abb, rate)) %>%
  ggplot(aes(abb,rate)) + 
  geom_bar(width = 0.5 , stat = "identity", color = "black") + 
  coord_flip()
bar_plot
```

![](report_files/figure-gfm/unnamed-chunk-2-1.png)<!-- -->

Note that the `echo = FALSE` parameter was added to the code chunk to
prevent printing of the R code that generated the plot.
