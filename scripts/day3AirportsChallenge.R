# Challenge Day 3
library(dplyr)
library(readr)
library(purrr)
library(ggplot2)

airports <- read_csv("data/Airports.csv")
airports

airports$Country %>% unique %>% sort

australia <- airports[airports$Country=="Australia",]
australia_years <- australia$Year
australia_years

brazil <- airports[airports$Country=="Brazil",]
brazil_years <- brazil$Year
brazil_years

canada <- airports[airports$Country=="Canada",]
canada_years <- canada$Year
canada_years

china <-  airports[airports$Country=="China",]
china_years <- china$Year
china_years
duplicated(china_years)

china2016 <- china[china$Year==2016,]
china2016
china2016busiest <- china2016[which(china2016$Rank==min(china2016$Rank)),]
china2016busiest

china2017 <- china[china$Year==2017,]
china2017busiest <- china2017[which(china2017$Rank==min(china2017$Rank)),]
china2017busiest


china2018 <- china[china$Year==2018,]
china2018busiest <- china2018[which(china2018$Rank==min(china2018$Rank)),]
china2018busiest


cy1 <-
  airports %>% group_by(Country,Year) %>% slice_min(Rank,n=1) %>% ungroup()
cy1

cy1  %>%  group_by(Country) %>% summarise(n_top_airports=n_distinct(Code)) %>%
  filter(n_top_airports>1)




# NBA exercise

#load openintro and make the nba_players_19 data available
library(openintro)
data("nba_players_19")

# group the data by team then to create a list of data frames, one for each team

teamslist <- nba_players_19 %>% group_by(team) %>% group_split()

#create a vector of team names
team_names <- nba_players_19 %>% distinct(team)

library(here)
# Create the folder "nbateams" inside your "Data" folder
fs::dir_create("data/nbateams")

team_names
here("data","nbateams","Nets")

map2()

- Use `here()` to build file (safe and portable) paths for each team in the vector of team names

- Feed the list of data frames and the vector of file paths to `readr::write_csv`
