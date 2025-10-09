## Automatically remove unwanted stations in your PCP directory, since it contains all pseudostations from Asia, Part 2 data.

## Set directory to where your PCP folder is located

setwd("C:/Users/E-HydroLab/Documents/CIA_data/PML/pcp")

  ## load df containing list of clipped chirps

  df <- read_csv('removed_stations.csv') %>%  ## This CSV reads the produced list of stations that are not within your study site
  select(NAME) |> 
  mutate(NAME = paste0(NAME,".txt"))

  # convert into a list

  removed_stations <- as.list(df)

  # remove
  sapply(removed_stations, file.remove) ## This line will automatically delete all .txt files containing stations that are NOT within your study
                                        ## This line will retain all stations WITHIN your study site 

  
