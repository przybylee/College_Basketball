library(NFLpredictions)
library(dplyr)
library(tidyr)

df <- read.csv("data/scores_2-21.csv")
head(df)
names(regssn2021)

df <- df %>% 
  mutate(Score = Final, Year = 2021) %>% 
  select(Team, Score, Year) %>% 
  filter(!is.na(Score))

List <- get_design(df)

List_nfl <- get_design(regssn2021)
over_under_ols(List_nfl, "Chiefs", "Bills")
over_under_ols(List_nfl, "Bengals", "Rams")


over_under_ols(List, "UCSanDiego", "California")
point_spread_ols(List, "Baylor", "OklahomaState")

team_detect(List, "Oklahoma")

