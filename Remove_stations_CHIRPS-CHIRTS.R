## This file deletes other CHIRPS?CHIRTS data that is not within the boundary of your study site

## load library

library(tidyverse)

## Set the directory to where you have extracted the data files of Asia, Part 2 grids (downloaded from https://swat.tamu.edu/data/chirps-chirts/)
setwd("C:\\Users\\E-HydroLab\\Documents\\CIA_data\\PML")

## read 2 dfs containing full list of stations and selected stations

data_full <- read_csv("asia_02_grids.csv") ## This contains the CSV containing all pseudostations from the Asia, Part 2 grids
data_selected <- read_csv("stationsfile_PML.csv") ## This contains the CSV containing all pseudostations that is within your study site

## convert data selected into a list

stations <- data_full |> 
  filter(!NAME %in%data_selected$NAME)

write.csv(stations, 'removed_stations.csv') ## This outputs a CSV containing a list of stations NOT included in your study site
