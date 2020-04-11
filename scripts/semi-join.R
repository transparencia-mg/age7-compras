library(tidyverse); library(data.table)

source("scripts/utils.R")

fl_compras_empenho <- fread("data-raw/fl_compras_empenho.csv", sep = ";", dec = ",")

dm_empenho_desp <- list.files("data/split", full.names = TRUE) %>% 
                    map(remove_rows) %>% 
                    bind_rows()

write.csv2(dm_empenho_desp, "data/merged/dm_empenho_desp.csv", row.names = FALSE)
