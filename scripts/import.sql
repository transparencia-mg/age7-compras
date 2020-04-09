.read scripts/schema.sql

.mode csv
.separator ";"

.import data/dm_acao.csv dm_acao
.import data/dm_classe_matserv.csv dm_classe_matserv
.import data/dm_contratado.csv dm_contratado
.import data/dm_contrato.csv dm_contrato
.import data/dm_elemento_desp.csv dm_elemento_desp
.import data/dm_empenho_desp.csv dm_empenho_desp
.import data/dm_grupo_matserv.csv dm_grupo_matserv
.import data/dm_item_desp.csv dm_item_desp
.import data/dm_item_matserv.csv dm_item_matserv
.import data/dm_linha_fornec.csv dm_linha_fornec
.import data/dm_material_servico.csv dm_material_servico
.import data/dm_municipio.csv dm_municipio
.import data/dm_orgao_contrato.csv dm_orgao_contrato
.import data/dm_orgao_demanda.csv dm_orgao_demanda
.import data/dm_procedimento.csv dm_procedimento
.import data/dm_processo.csv dm_processo
.import data/dm_programa.csv dm_programa
.import data/dm_situacao_cont.csv dm_situacao_cont
.import data/dm_situacao_proc.csv dm_situacao_proc
.import data/dm_tempo_diario.csv dm_tempo_diario
.import data/dm_tipo_licitacao.csv dm_tipo_licitacao
.import data/dm_unidade_medida.csv dm_unidade_medida
.import data/dm_unidade_orc.csv dm_unidade_orc
.import data/fl_compras_empenho.csv fl_compras_empenho
.import data/ft_compras.csv ft_compras
.import data/ft_compras_contrato.csv ft_compras_contrato