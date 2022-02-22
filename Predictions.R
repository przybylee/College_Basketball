library(NFLpredictions)
library(dplyr)
library(tidyr)

df <- read.csv("data/scores_2-21.csv")
head(df)
names(regssn2021)

df <- df %>% 
  mutate(Score = Final, Year = 2021) %>% 
  select(Team, Score, Year)
