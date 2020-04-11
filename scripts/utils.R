remove_rows <- function(x) {
  
  schema <- c(    
    id_empenho            = "integer",
    ano_exercicio         = "integer",
    sqa_gmifp             = "integer",
    sqa_credor            = "integer",
    sqa_natureza          = "integer",
    sqa_unidade_orc       = "integer",
    sqa_progtrab          = "integer",
    sqa_unidade_exec      = "integer",
    sqa_empenho           = "integer",
    nr_empenho            = "integer",
    dt_empenho            = "character",
    unidade_orcamentaria  = "character",
    unidade_executora     = "character",
    funcao                = "character",
    subfuncao             = "character",
    programa              = "character",
    acao                  = "character",
    categoria_econ        = "character",
    grupo_desp            = "character",
    elemento_desp         = "character",
    item_desp             = "character",
    modalidade_aplic      = "character",
    tipo_empenho          = "character",
    fonte_recurso         = "character",
    identificador_orc     = "character",
    razao_social_credor   = "character",
    vr_empenho            = "numeric",
    desc_historico        = "character")
  
  dm_empenho_desp <- fread(x, header = FALSE, col.names = names(schema), colClasses = unname(schema), sep = ";", dec = ",")
  dm_empenho_desp[, desc_historico := NULL]
  
  dm_empenho_desp_keep <- semi_join(dm_empenho_desp, fl_compras_empenho, by = "id_empenho")
  dm_empenho_desp_trash <- anti_join(dm_empenho_desp, fl_compras_empenho, by = "id_empenho")
  
  stopifnot((nrow(dm_empenho_desp_keep) + nrow(dm_empenho_desp_trash)) == nrow(dm_empenho_desp))
  
  dm_empenho_desp_keep
}
