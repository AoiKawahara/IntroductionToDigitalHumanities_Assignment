library(haven)
library(survival)
library(ggplot2)
library(dplyr)
library(tidyr)
library(gmodels)
library(reshape2)
library(nnet)

setwd('/Users/aoikawahara/Library/CloudStorage/OneDrive-KULeuven/Leuven/02_Introduction to Humanities/Assignments/2nd Wrokplace')
getwd()

df <- read.csv('animelist.csv')

target_studios <- c("Toei Animation", "Sunrise", "Madhouse", "Studio Pierrot", "J.C.Staff")

filtered_df <- df %>%
  filter(studio %in% target_studios)

studio_counts <- filtered_df %>%
  group_by(aired_from_year, studio) %>%
  summarise(count = n(), .groups = 'drop')

ggplot(data = studio_counts, aes(x = aired_from_year, y = count, color = studio)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Number of Anime Produced by Studio", x = "Year", y = "Number of Productions", color = "Studio") +
  theme_minimal()


