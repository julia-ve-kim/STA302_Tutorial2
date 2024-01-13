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

#### Download data ####
raw_toronto_homicides_data <- 
  read_csv(
    file = "homicides_4326.csv",
    show_col_types = FALSE
  )

#### Save data ####
write_csv(
  x = raw_toronto_homicides_data,
  file = 'inputs/data/raw_toronto_homicides.csv'
)
         
