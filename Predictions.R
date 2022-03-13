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

#df2 <- drop_incomplete_games(df)
design <- get_design(df)

List_nfl <- get_design(regssn2021)
over_under_ols(List_nfl, "Chiefs", "Bills")
over_under_ols(List_nfl, "Bengals", "Rams")


over_under_ols(design, "UCSanDiego", "California")
point_spread_ols(design, "Baylor", "OklahomaState")
winprob_emp(design, "Baylor", "OklahomaStat")

team_detect(design, "Iowa")
team_detect(design, "Purdue")

winprob_emp(design, "Purdue", "Iowa", home_effect = FALSE)
winprob_ols(design, "Purdue", "Iowa", home_effect = FALSE)

eML_ols(design, "Iowa", "Purdue", hBL = 105, aBL = -125, home_effect = FALSE)
eSpread_ols(design, "Iowa", "Purdue", hspread = 1.5, aspread = -1.5, home_effect = FALSE)
over_under_ols(design, "Iowa", "Purdue")
