library(NFLpredictions)
library(dplyr)
library(tidyr)

df <- read.csv("data/scores_3-13.csv")
head(df)
names(regssn2021)

df <- df %>% 
  mutate(Score = Final, Year = 2021) %>% 
  select(Team, Score, Year) %>% 
  filter(!is.na(Score))

df2 <- drop_incomplete_games(df)
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
eSpread_ols(design, "Iowa", "Purdue", hspread = 2.5, aspread = -2.5, home_effect = FALSE)
over_under_ols(design, "Iowa", "Purdue")


#
team_detect(design, "TexasSouther")
winprob_emp(design, "TexasA&MCorpus", "TexasSouthern", home_effect = FALSE)
eSpread_ols(design, "TexasA&MCorpus", "TexasSouthern", hspread = 3.5, home_effect = FALSE)
eML_emp(design, "TexasA&MCorpus", "TexasSouthern", hBL = 145, aBL = -165, home_effect = FALSE)
over_under_ols(design, "TexasA&MCorpus", "TexasSouthern")

team_detect(design, "IndianaU")
team_detect(design, "Wyoming")
winprob_emp(design, "IndianaU", "Wyoming", home_effect = FALSE)
eSpread_ols(design, "IndianaU", "Wyoming", hspread = -3.5, home_effect = FALSE)
eML_emp(design, "IndianaU", "Wyoming", hBL = -170, aBL = 150, home_effect = FALSE)
over_under_ols(design, "IndianaU", "Wyoming")

team_detect(design, "NotreDame")
team_detect(design, "Rutgers")
winprob_emp(design, "NotreDame", "Rutgers", home_effect = FALSE)
eSpread_ols(design, "NotreDame", "Rutgers", hspread = 1, home_effect = FALSE)
eML_emp(design, "NotreDame", "Rutgers", hBL = -105, aBL = -115, home_effect = FALSE)
over_under_ols(design, "NotreDame", "Rutgers")

team_detect(design, "Michigan")
team_detect(design, "Rutgers")
winprob_emp(design, "NotreDame", "Rutgers", home_effect = FALSE)
eSpread_ols(design, "NotreDame", "Rutgers", hspread = 1, home_effect = FALSE)
eML_emp(design, "NotreDame", "Rutgers", hBL = -105, aBL = -115, home_effect = FALSE)
over_under_ols(design, "NotreDame", "Rutgers")
