CREATE TABLE dm_acao (
    id_acao        INTEGER NOT NULL,
    ano_exercicio  INTEGER NOT NULL,
    cd_acao        INTEGER NOT NULL,
    nome           TEXT NOT NULL,
    primary key(id_acao)
);


CREATE TABLE dm_classe_matserv (
    id_classe_matserv  INTEGER NOT NULL,
    cd_classe_matserv  INTEGER NOT NULL,
    nome               TEXT NOT NULL,
    primary key(id_classe_matserv)
);


CREATE TABLE dm_contratado (
    id_contratado   INTEGER NOT NULL,
    sqa_fornecedor  INTEGER NOT NULL,
    tp_documento    INTEGER NOT NULL,
    nr_documento    INTEGER NOT NULL,
    nome            TEXT NOT NULL,
    primary key(id_contratado)
);


CREATE TABLE dm_contrato (
    id_contrato            INTEGER NOT NULL,
    sqa_contrato           INTEGER NOT NULL,
    nr_contrato            INTEGER NOT NULL,
    url_contrato           TEXT,
    objeto                 TEXT NOT NULL,
    situacao               TEXT NOT NULL,
    tipo                   TEXT NOT NULL,
    dt_publicacao          TEXT NOT NULL,
    dt_inicio_vigencia     TEXT NOT NULL,
    dt_fim_vigencia        TEXT NOT NULL,
    dt_fim_vigencia_atual  TEXT NOT NULL,
    vr_homologado          REAL NOT NULL,
    vr_atualizado          REAL NOT NULL,
    primary key(id_contrato)
);


CREATE TABLE dm_elemento_desp (
    id_elemento  INTEGER NOT NULL,
    cd_elemento  INTEGER NOT NULL,
    nome         TEXT NOT NULL,
    primary key(id_elemento)
);

CREATE TABLE dm_empenho_desp (
    id_empenho            INTEGER NOT NULL,
    ano_exercicio         INTEGER NOT NULL,
    sqa_gmifp             INTEGER NOT NULL,
    sqa_credor            INTEGER NOT NULL,
    sqa_natureza          INTEGER NOT NULL,
    sqa_unidade_orc       INTEGER NOT NULL,
    sqa_progtrab          INTEGER NOT NULL,
    sqa_unidade_exec      INTEGER NOT NULL,
    sqa_empenho           INTEGER NOT NULL,
    nr_empenho            INTEGER NOT NULL,
    dt_empenho            TEXT NOT NULL,
    unidade_orcamentaria  TEXT NOT NULL,
    unidade_executora     TEXT NOT NULL,
    funcao                TEXT NOT NULL,
    subfuncao             TEXT NOT NULL,
    programa              TEXT NOT NULL,
    acao                  TEXT NOT NULL,
    categoria_econ        TEXT NOT NULL,
    grupo_desp            TEXT NOT NULL,
    elemento_desp         TEXT NOT NULL,
    item_desp             TEXT NOT NULL,
    modalidade_aplic      TEXT NOT NULL,
    tipo_empenho          TEXT NOT NULL,
    fonte_recurso         TEXT NOT NULL,
    identificador_orc     TEXT NOT NULL,
    razao_social_credor   TEXT NOT NULL,
    vr_empenho            REAL NOT NULL,
    desc_historico        TEXT NOT NULL,
    primary key(id_empenho)
);

CREATE TABLE dm_grupo_matserv (
    id_grupo_matserv  INTEGER NOT NULL,
    cd_grupo_matserv  INTEGER NOT NULL,
    nome              TEXT NOT NULL,
    primary key(id_grupo_matserv)
);


CREATE TABLE dm_item_desp (
    id_item  INTEGER NOT NULL,
    cd_item  INTEGER NOT NULL,
    nome     TEXT NOT NULL,
    primary key(id_item)
);


CREATE TABLE dm_item_matserv (
    id_item_matserv   INTEGER NOT NULL,
    sqa_item_matserv  INTEGER,
    cd_item_matserv   INTEGER NOT NULL,
    nome              TEXT NOT NULL,
    natureza_despesa  TEXT NOT NULL,
    primary key(id_item_matserv)
);


CREATE TABLE dm_linha_fornec (
    id_linha_fornec   INTEGER NOT NULL,
    sqa_linha_fornec  INTEGER NOT NULL,
    cd_linha_fornec   INTEGER NOT NULL,
    nome              TEXT NOT NULL,
    primary key(id_linha_fornec)
);


CREATE TABLE dm_material_servico (
    id_material_servico  INTEGER NOT NULL,
    cd_material_servico  INTEGER NOT NULL,
    nome                 TEXT NOT NULL,
    primary key(id_material_servico)
);


CREATE TABLE dm_municipio (
    id_municipio       INTEGER NOT NULL,
    cd_municipio_ibge  INTEGER NOT NULL,
    nome               TEXT NOT NULL,
    primary key(id_municipio)
);


CREATE TABLE dm_orgao_contrato (
    id_orgao_contrato  INTEGER NOT NULL,
    cd_orgao_contrato  INTEGER NOT NULL,
    nome               TEXT NOT NULL,
    primary key(id_orgao_contrato)
);


CREATE TABLE dm_orgao_demanda (
    id_orgao_demanda  INTEGER NOT NULL,
    cd_orgao_demanda  INTEGER NOT NULL,
    nome              TEXT NOT NULL,
    primary key(id_orgao_demanda)
);


CREATE TABLE dm_procedimento (
    id_procedimento  INTEGER NOT NULL,
    nome             TEXT NOT NULL,
    primary key(id_procedimento)
);


CREATE TABLE dm_processo (
    id_processo            INTEGER NOT NULL,
    cd_orgao               INTEGER NOT NULL,
    cd_processo            INTEGER NOT NULL,
    cd_processo_formatado  TEXT NOT NULL,
    url_edital             TEXT,
    orgao                  TEXT NOT NULL,
    procedimento           TEXT NOT NULL,
    objeto                 TEXT,
    situacao               TEXT NOT NULL,
    criterio_julgamento    TEXT NOT NULL,
    tp_licitacao           TEXT NOT NULL,
    dt_cad_processo        TEXT NOT NULL,
    vr_referencia          REAL NOT NULL,
    vr_homologado          REAL NOT NULL,
    primary key(id_processo)
);


CREATE TABLE dm_programa (
    id_programa    INTEGER NOT NULL,
    ano_exercicio  INTEGER NOT NULL,
    cd_programa    INTEGER NOT NULL,
    nome           TEXT NOT NULL,
    primary key(id_programa)
);


CREATE TABLE dm_situacao_cont (
    id_situacao_cont  INTEGER NOT NULL,
    cd_situacao_cont  INTEGER NOT NULL,
    nome              TEXT NOT NULL,
    primary key(id_situacao_cont)
);


CREATE TABLE dm_situacao_proc (
    id_situacao_proc  INTEGER NOT NULL,
    cd_situacao_proc  INTEGER NOT NULL,
    nome              TEXT NOT NULL,
    primary key(id_situacao_proc)
);

CREATE TABLE dm_tempo_diario (
    id_tempo        INTEGER NOT NULL,
    data_iso        INTEGER NOT NULL,
    dia             INTEGER NOT NULL,
    mes             INTEGER NOT NULL,
    ano             INTEGER NOT NULL,
    data_formatada  TEXT NOT NULL,
    primary key(id_tempo)  
);

CREATE TABLE dm_tipo_licitacao (
    id_tipo_licitacao  INTEGER NOT NULL,
    cd_tipo_licitacao  INTEGER NOT NULL,
    nome               TEXT NOT NULL,
    primary key(id_tipo_licitacao)
);


CREATE TABLE dm_unidade_medida (
    id_unidade_medida   INTEGER NOT NULL,
    sqa_unidade_medida  INTEGER NOT NULL,
    cd_unidade_medida   INTEGER NOT NULL,
    nome                TEXT NOT NULL,
    primary key(id_unidade_medida)
);

CREATE TABLE dm_unidade_orc (
     id_unidade_orc INTEGER NOT NULL,
     sqa_unidade_orcam INTEGER NOT NULL,
     ano_exercicio INTEGER NOT NULL,
     cd_unidade_orc INTEGER NOT NULL,
     id_grupo_administracao INTEGER NOT NULL,
     grupo_administracao TEXT NOT NULL,
     id_administracao INTEGER NOT NULL,
     administracao TEXT NOT NULL,
     nome TEXT NOT NULL,
     primary key(id_unidade_orc)
);

CREATE TABLE fl_compras_empenho (
    id_processo           INTEGER NOT NULL,
    id_empenho            INTEGER NOT NULL,
    id_programa           INTEGER NOT NULL,
    id_acao               INTEGER NOT NULL,
    id_elemento           INTEGER NOT NULL,
    id_item               INTEGER NOT NULL,
    dotacao_orcamentaria  TEXT NOT NULL
);

CREATE TABLE ft_compras (
    id_tempo             INTEGER NOT NULL,
    id_procedimento      INTEGER NOT NULL,
    id_orgao_demanda     INTEGER NOT NULL,
    id_orgao_contrato    INTEGER NOT NULL,
    id_situacao_proc     INTEGER NOT NULL,
    id_situacao_cont     INTEGER NOT NULL,
    id_municipio         INTEGER NOT NULL,
    id_contratado        INTEGER NOT NULL,
    id_grupo_matserv     INTEGER NOT NULL,
    id_classe_matserv    INTEGER NOT NULL,
    id_material_servico  INTEGER NOT NULL,
    id_item_matserv      INTEGER NOT NULL,
    id_processo          INTEGER NOT NULL,
    id_contrato          INTEGER NOT NULL,
    id_unidade_medida    INTEGER NOT NULL,
    id_linha_fornec      INTEGER NOT NULL,
    id_item              INTEGER NOT NULL,
    id_unidade_orc       INTEGER,
    sqa_procedimento     INTEGER NOT NULL,
    sqa_item_pedido      INTEGER NOT NULL,
    ano_particao         INTEGER NOT NULL,
    dt_item_homologa     TEXT NOT NULL,
    qt_item_pedido       REAL NOT NULL,
    vr_un_referencia     REAL NOT NULL,
    vr_referencia        REAL NOT NULL,
    vr_un_homologado     REAL NOT NULL,
    vr_homologado        REAL NOT NULL,
    vr_atualizado        REAL NOT NULL
);

CREATE TABLE ft_compras_contrato (
    id_tempo           INTEGER NOT NULL,
    id_processo        INTEGER NOT NULL,
    id_orgao_contrato  INTEGER NOT NULL,
    id_contrato        INTEGER NOT NULL,
    id_contratado      INTEGER NOT NULL,
    id_situacao_cont   INTEGER NOT NULL,
    ano_particao       INTEGER NOT NULL,
    vr_homologado      REAL NOT NULL,
    vr_atualizado      REAL NOT NULL
);

