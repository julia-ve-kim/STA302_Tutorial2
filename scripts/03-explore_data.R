#### Preamble ####
# Purpose: Read in data from the 2004-2020 dataset of homicide rates in Toronto and make a graph 
# of the number of seats each party won.
# Author: Julia Kim
# Email: juliaym.kim@mail.utoronto.ca
# Date: 12/02/24
# Prerequisites: Know where to get the 2004-2020 dataset of homocide rates in Toronto. 


#### Workspace setup ####
install.packages('tidyverse')
install.packages('janitor')
install.packages('formatR')
install.packages('opendatatoronto')
library(tidyverse)
library(janitor)
library(formatR)
library(opendatatoronto)
knitr::opts_chunk$set(tidy.opts=list(width.cutoff=80), tidy=TRUE) # prevent source code from running off PDF page 

#### Explore data ####
cleaned_toronto_homicides <-  
  read_csv(
    file = "outputs/data/cleaned_toronto_homicides.csv", 
    show_col_types = FALSE
  )
# obtain a count of the number of homicides per month 
cleaned_toronto_homicides |> 
  # arrange the months in chronological order from January to December
  mutate(occ_month = factor(occ_month, levels = month.name)) |> 
  group_by(occ_month) |> 
  summarise(num_homicides = n())

# plot data
cleaned_toronto_homicides |>
  mutate(occ_month = factor(occ_month, levels = month.name, labels = month.abb)) |> 
  ggplot(aes(x = occ_month)) +
  geom_bar() +
  theme_minimal() + # Make the theme neater
  labs(
    x = "Month",
    y = "Number of Homicides", 
    caption = "Figure 2: Number of Homicides per month in Toronto in 2020"
  ) + 
  theme(plot.caption = element_text(hjust = 0.5, size = 10)) 