
# Install libraries if necessary ------------------------------------------

install.packages("tidyverse")
install.packages("countrycode")
install.packages("gt")

# Load libraries ----------------------------------------------------------

library(tidyverse)
library(countrycode)
library(gt)

# Load data ---------------------------------------------------------------

tf.wch2025 <- read_csv("data/processed/tf_wch2025_clean.csv")
population <- read_csv("data/processed/population.csv")

# Run query ---------------------------------------------------------------

tf.wch2025 %>%
  unique() %>%
  group_by(country) %>%
  summarise(`Number of Athletes` = n()) %>%
  mutate(iso3c = countrycode(country, "ioc", "iso3c")) %>%
  left_join(population, by = c("iso3c" = "Country Code")) %>%
  rename(Population = `2024`) %>%
  select(`Country Name`, Population, `Number of Athletes`) %>%
  mutate(`Number of Athletes per 100k` = `Number of Athletes` / (Population / 100000)) %>%
  arrange(desc(`Number of Athletes per 100k`)) %>%
  drop_na() %>%
  gt() %>%
  fmt_number(dec_mark = ",", sep_mark = "&#8239;", decimals = 0) %>%
  fmt_number(columns = `Number of Athletes per 100k`, decimals = 4)