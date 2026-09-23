data= read.csv('http://manctsui.github.io/datasets/countries.csv')
library(dplyr)
library(tidyr)
####
data |>
  filter(Net.migration > 0, Region == "EASTERN EUROPE") |> 
  select(Country) |> 
  nrow()
############# 2) list 3 eastern europe countries with most positive net migration
data |>
  filter(Region == "EASTERN EUROPE") |>
  arrange(Net.migration) |>
  select(Country) |>
  tail(3)
############# 3) list 3 eastern europe countries with most negative net migration
data |>
  filter(Region == "EASTERN EUROPE") |>
  arrange(Net.migration) |>
  select(Country) |>
  head(3)
############# 4) report countries whose net migration is NA
data |>
  filter(is.na(Net.migration)| Net.migration == 0) |>
  select(Country)
############# 5) countries with 2,000,000 sqr miles, or pop > 25 million
data |>
  filter( Area..sq..mi.. >2000000 | Population > 25000000 ) |>
  select(Country, Population, Area..sq..mi..)
############# 6) find countries with birthrate < deathrate and countries with unknown birthrate or deathrate
data |>
  filter(Birthrate < Deathrate) |>
  select(Country) |>
  nrow()
data |>
  filter(is.na(Birthrate) | is.na(Deathrate)) |>
  select(Country) |>
  nrow()
############# 7) make a column of birthrate - deathrate
data |>
  mutate(Natural_population_change = Birthrate-Deathrate)
############# 8) Identify the 3 most populous countries in the dataset
data |> 
  arrange(desc(Population)) |>
  select(Country) |> 
  head(3)
############# 9) Which countries have a population which is at least 30% the size of the population of the 3rd most populous country?
data |> 
  arrange(desc(Population)) |>
  select(Country, Population) |> 
  slice(3)
min_pop = 298444215
data |>
  filter(Population >= .3*min_pop) |>
  select(Country)
############# 10) Use the aggregate function to determine the typical population size of each region.
data |> 
  group_by(Region) |>
  summarize(mean(Population))
