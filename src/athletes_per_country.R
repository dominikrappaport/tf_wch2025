
# Load libraries ----------------------------------------------------------

library(tidyverse)
library(countrycode)
library(knitr)
library(kableExtra)

# Load data ---------------------------------------------------------------

tf.wch2025 <- read_csv("data/processed/tf_wch2025_clean.csv")
population <- read_csv("data/processed/population.csv")

# Run query ---------------------------------------------------------------

tbl <- tf.wch2025 %>%
  unique() %>%
  group_by(country) %>%
  summarise(`Number of Athletes` = n()) %>%
  mutate(iso3c = countrycode(country, "ioc", "iso3c")) %>%
  left_join(population, by = c("iso3c" = "Country Code")) %>%
  rename(Population = `2024`) %>%
  mutate(`Number of Athletes per 100k` = `Number of Athletes` / (Population / 100000)) %>%
  arrange(desc(`Number of Athletes per 100k`)) %>%
  mutate(Position = row_number()) %>%
  select(Position,
         `Country Name`,
         Population,
         `Number of Athletes`,
         `Number of Athletes per 100k`) %>%
  drop_na()

tbl.md <- kable(tbl, format = "markdown", digits = c(0, 0, 0, 0, 4))
writeLines(tbl.md, "output/athletes_per_country.md")
