library(NFLpredictions)
library(dplyr)
library(tidyr)

df <- read.csv("data/scores_2-21.csv")
head(df)
names(regssn2021)

df <- df %>% 
  mutate(Score = Final, Year = 2021) %>% 
  select(Team, Score, Year)

List <- get_design(df)

over_under_ols(List, "Baylor", "Oklahoma State")
point_spread_ols(List, "Baylor", "Oklahoma State")

team_detect(List, "Baylor")

#For some reason the estimate is not available so we check for bugs
N <- length(df$Score)
M <- length(unique(df$Team))
X <- matrix(data = 0, nrow = N/2, ncol = M+1)
teams <- sort(unique(df$Team))
X <- matrix(data = 0, nrow = N/2, ncol = M+1)
colnames(X) <- c("home", teams)
Y_diff <- rep(0, N/2)
Y_sum <- rep(0, N/2)
#Fill in cols of X with 1's where appropriate
row = 1
for(n in seq(2,N, by = 2)){
  X[row,"home"] <- 1
  X[row, df$Team[n-1]] <- -1
  X[row, df$Team[n]] <- 1
  Y_diff[row] <- df$Score[n] - df$Score[n-1]
  Y_sum[row] <- df$Score[n] + df$Score[n-1]
  row <- row +1
}
Y_binary <- ifelse(Y_diff >= 0, 1, 0)
X_sum <- abs(X)
colnames(X)[1] <- "int"
#start <- paste(data$Year[1], ", week ", data$Week[1])
#end <- paste(data$Year[N], ", week ", data$Week[N])

head(X)
