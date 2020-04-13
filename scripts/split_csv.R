source("scripts/utils.R")

split_csv("data/merged/dm_empenho_desp.csv", split_at = "ano_exercicio", stem = "dm_empenho_desp")
split_csv("data-raw/ft_compras.csv", split_at = "ano_particao", stem = "ft_compras")
