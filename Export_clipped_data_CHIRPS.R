## This file deletes other chirps data not is not within the boundary watershed of choice

#load library

library(tidyverse)

setwd("C:\\Users\\E-HydroLab\\Documents\\CIA_data\\PML")

## read 2 dfs containing full list of stations and selected stations

data_full <- read_csv("PH_CHIRPS-CHIRTS.csv")
dim(data_full)

data_selected <- read_csv("stationsfile_PML.csv")
dim(data_selected)

## convert data selected into list

stations <- data_full |> 
  filter(!NAME %in%data_selected$NAME)

dim(stations)

write.csv(stations, 'removed_stations.csv')

## remove files in pcp

setwd("C:/Users/E-HydroLab/Documents/CIA_data/PML/pcp")

  ## load df containing list of clipped chirps

  df <- read_csv('removed_stations.csv') %>% 
  select(NAME) |> 
  mutate(NAME = paste0(NAME,".txt"))

  View(df)

  # convert into list

  removed_stations <- as.list(df)

  # remove
  sapply(removed_stations, file.remove)
  
## remove files in tmp
  
  setwd("C:/Users/E-HydroLab/Documents/CIA_data/PML/tmp")
  
  ## load df containing list of clipped chirps
  
  df <- read_csv('removed_stations.csv') %>% 
    select(NAME) |> 
    mutate(NAME = paste0(NAME,".txt"))
  
  View(df)
  
  # convert into list
  
  removed_stations <- as.list(df)
  
  # remove
  sapply(removed_stations, file.remove)
  