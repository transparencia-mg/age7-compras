# Conjunto de dados - Compras

Em virtude do tamanho (11911737 linhas; 28 colunas; 7.3GB) do arquivo `dm_empenho_desp.csv`, para viabilizar a análise do conteúdos do conjunto de dados de compras foi necessário adotar uma estratégia de armazenamento dos dados em disco.

Esse projeto faz a carga dos dados de compras no sqlite, gerando a base `data/age7-compras.db`. 

As instruções abaixo são apenas para reproduzir o processo a partir dos dados extraídos pelo NUCC.

## Instruções

Faça o dowload dos arquivos disponibilizados pelo NUCC e armazene em `data-raw/`. O quantitativo de arquivos é:

* Compras: 21 arquivos
* Despesa: 5 arquivos

Altere o nome dos arquivos da despesa para o padrão dos arquivos de compras, utilizando "_" como separador. As seguintes alterações devem ser feitas:

* dmprograma.csv -> dm_programa.csv
* dmitemdesp.csv -> dm_item_desp.csv
* dmempenhodesp.csv -> dm_empenho_desp.csv
* dmelementodesp.csv -> dm_elemento_desp.csv
* dmacao.csv -> dm_acao.csv

Na linha de comando execute 

```bash
sh scripts/remove-first-line.sh
```

Esse script remove a primeira linha dos arquivos em `data-raw/`. Essa etapa é necessária para que o processo de importação no sqlite ocorra de forma adequada.

Na linha de comando execute

```bash
sqlite3 data/age7-compras.db < scripts/import.sql
```

Em um macOS Catalina com processador 2,6 GHz Dual-Core Intel Core i5 e memória 8 GB 1600 MHz DDR3 a importação teve duração de 10 minutos.

## Problemas

Os seguintes problemas ocorreram durante a importação e ainda precisam de ser investigados e resolvidos.

```
data/dm_empenho_desp.csv:287465: unescaped " character
data/dm_empenho_desp.csv:287464: expected 28 columns but found 45 - extras ignored
data/dm_empenho_desp.csv:5457638: unescaped " character
data/dm_empenho_desp.csv:5457637: expected 28 columns but found 45 - extras ignored
data/dm_empenho_desp.csv:6853306: unescaped " character
data/dm_empenho_desp.csv:6853305: expected 28 columns but found 45 - extras ignored
data/dm_empenho_desp.csv:6867723: unescaped " character
data/dm_empenho_desp.csv:6867722: expected 28 columns but found 45 - extras ignored
data/dm_empenho_desp.csv:8207156: unescaped " character
data/dm_empenho_desp.csv:8207155: expected 28 columns but found 45 - extras ignored
```