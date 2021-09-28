library(tidyverse)
murders <- read.csv("data/murders.csv")
murders <- murders %>% mutate (region = factor(region), rate = total / population * 10^5)
save(murders, file = "rda/murders.rda")

