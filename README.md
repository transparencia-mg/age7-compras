# Conjunto de dados - Compras

Em virtude do tamanho (11911737 linhas; 28 colunas; 7.3GB) do arquivo `dm_empenho_desp.csv`, para viabilizar a análise do conteúdo do conjunto de dados de compras foi necessário adotar uma estratégia de análise que não fizesse armazenamento dos dados na memória RAM.

Os arquivos finais que foram alterados em relação aos inicialmente disponibilizados foram:

* `data/dm_empenho_desp/*`
* `data/ft_compras/*`
* `data/dm_processo.csv`

As instruções abaixo possibilitam reproduzir a análise a partir dos dados extraídos pelo NUCC. Além das dependências usuais (ie. git bash e R), é necessário instalar

* [csvkit](https://csvkit.readthedocs.io/en/latest/)
* [csvfix](https://neilb.bitbucket.io/csvfix/)

## Extração

Faça o dowload dos arquivos disponibilizados pelo NUCC e armazene em `data-raw/`. O quantitativo de arquivos é:

* Compras: 21 arquivos
* Despesa: 5 arquivos

Altere o nome dos arquivos da despesa para o padrão dos arquivos de compras, utilizando "_" como separador. Para referência, as seguintes alterações devem ser feitas:

* dmprograma.csv -> dm_programa.csv
* dmitemdesp.csv -> dm_item_desp.csv
* dmempenhodesp.csv -> dm_empenho_desp.csv
* dmelementodesp.csv -> dm_elemento_desp.csv
* dmacao.csv -> dm_acao.csv

Na linha de comando essas duas etapas podem ser realizadas pelos seguintes comandos, com cuidado de adaptação das variáveis `SOURCE_COMPRAS`, `SOURCE_DESPESA`, `DEST`.

```sh
SOURCE_COMPRAS="/Volumes/Fotos/nucc/2020-04-03/compras/."
SOURCE_DESPESA="/Volumes/Fotos/nucc/2020-04-03/despesa"
DEST="$HOME/Local/age7-compras/data-raw"

cp -r $SOURCE_COMPRAS $DEST
cp ${SOURCE_DESPESA}/dmprograma.csv ${DEST}/dm_programa.csv
cp ${SOURCE_DESPESA}/dmitemdesp.csv ${DEST}/dm_item_desp.csv
cp ${SOURCE_DESPESA}/dmempenhodesp.csv ${DEST}/dm_empenho_desp.csv
cp ${SOURCE_DESPESA}/dmelementodesp.csv ${DEST}/dm_elemento_desp.csv
cp ${SOURCE_DESPESA}/dmacao.csv ${DEST}/dm_acao.csv
```

## Diagnóstico e correção

Para verificar se os arquivos csv são estruturalmente válidos execute

```sh
sh scripts/check-valid-csv.sh
```

Para visualizar somente as linhas problematicas armazenadas em `logs/` execute

```sh
grep -o "Line \d*" logs/*
```

O output indica que os problemas do arquivo `dm_processo.csv` foram nas linhas 

* 27482
* 209039
* 318551

Já no no arquivo `dm_empenho_desp.csv` nas linhas 

* 287465
* 5457638
* 6853306
* 6867723
* 8207156

O processo de investigação dos problemas dos arquivos é manual. 
O arquivo `dm_processo.csv` pode ser inspecionado em um editor de texto. 

Tendo em vista o tamanho do arquivo `dm_empenho_desp.csv`, utilizamos o comando abaixo para extrair somente as linhas problemáticas e armazenar em um novo arquivo `logs/dm_empenho_desp_err.csv`

```sh
sed '1p;287465p;5457638p;6853306p;6867723p;8207156q;d' data-raw/dm_empenho_desp.csv > logs/dm_empenho_desp_err.csv
```

A correção dos arquivos é efetuada pelos comandos abaixo. Os arquivos em `data-raw/` não são alterados, o script cria novos arquivos em `data/`

```sh
sed -e '27482 s/""ABNT 14.865""/""ABNT 14.865"""/' \
    -e '209039 s/Papa""/Papa"/' \
    -e '318551 s/Adm.Pública""/Adm.Pública"""/' \
    data-raw/dm_processo.csv > data/dm_processo.csv

sed -e '287465 s/$/"/' \
    -e '5457638 s/$/"/' \
    -e '6853306 s/$/"/' \
    -e '6867723 s/$/"/' \
    -e '8207156 s/$/"/' \
    data-raw/dm_empenho_desp.csv > data/dm_empenho_desp.csv
```

Para verificar que a correção funcionou execute os comandos

```sh
csvclean -d ';' -n data/dm_processo.csv
csvclean -d ';' -n data/dm_empenho_desp.csv
```

__As correções ainda devem ser realizadas pelo NUCC para fins do novo CKAN. Em todas as linhas problemáticas as regras de aspas duplas não foram respeitadas.__

## Diminuição do arquivo `dm_empenho_desp`

O processo acima corrigiu os arquivos, mas a análise do `dm_empenho_desp.csv` ainda é problemática devido ao seu tamanho.
Nossa estratégia vai ser em dividir o arquivo por ano. 
Para isso execute o comando abaixo

```sh
mkdir data/split
csvfix file_split -f 2 -fd data/split -ifn -ufn data/dm_empenho_desp.csv
```

## Transformação

Para diminuição do tamanho do arquivo `dm_empenho_desp.csv` para carga no CKAN a estratégia utilizada foi remover a coluna `desc_historico`, e exclusão das linhas que não estão presentes na tabela fato `fl_compras_empenho`.

Essa transformação foi implementada com R no script `scripts/semi-join.R` e pode ser executado na linha de comando com

```sh
mkdir data/merged
Rscript scripts/semi-join.R
```

## Divisão dos arquivos por ano

Para facilitar a carga no CKAN, os dois maiores arquivos `dm_empenho_desp.csv` e `ft_compras.csv` foram divididos por ano.

```sh
mkdir data/dm_empenho_desp data/ft_compras
Rscript scripts/split_csv.R
```