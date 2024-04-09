library(tidyverse)
library(openxlsx)
source("R/reshape_to_data_merge.R")


# In case of single file as input
analysis_result <- read.xlsx("input/Analysis_result.xlsx")
datamerge_file <- reshape_to_datamerge(analysis_result)
write.xlsx(datamerge_file, "output/reshaped_for_datamerge.xlsx")


# In case of multiple files as input
# analysis_results_path <- list.files("input/", full.names = T, pattern = "*.xlsx") |> setNames(gsub(pattern="Analysis.xlsx$", "", list.files("input/", pattern=".xlsx")))
# analysis_results <- map(analysis_results_path, read.xlsx)
# datamerge_files <- map(analysis_results, reshape_to_datamerge)
# map2(datamerge_files, names(datamerge_files), ~write.xlsx(.x, paste0("output/", .y, "'s_datamerge_file.xlsx")))