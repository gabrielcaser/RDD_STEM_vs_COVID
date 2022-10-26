

## Libraries ---------------------------------------------------------------

#library("basedosdados")
library("readstata13")
library("stargazer")
#library("gt")
library("modelsummary")
library("rdrobust")
library("rddtools")
library("plyr")
library("tidyverse")


## Setting -----------------------------------------------------------------

setwd("C:/Users/GabrielCaserDosPasso/Documents/RAIS")


## Creating Hospitalization and Deaths Database ----------------------------
## Based on: Escola de Dados -> https://escoladedados.org/coda2021/

formato_data <- "%d/%m/%Y"


### 2020 ------------------------------------------------------------------
 ### source: https://opendatasus.saude.gov.br/dataset/srag-2020

sivep_2020 <- read_csv2("Dados/input/220613_srag_base_oficial_2020.csv", col_types = cols(
  DT_NOTIFIC = col_date(format = formato_data),
  SEM_NOT = col_double(),
  DT_SIN_PRI = col_date(format = formato_data),
  SEM_PRI = col_double(),
  SG_UF_NOT = col_character(),
  ID_REGIONA = col_character(),
  CO_REGIONA = col_double(),
  ID_MUNICIP = col_character(),
  CO_MUN_NOT = col_double(),
  ID_UNIDADE = col_character(),
  CO_UNI_NOT = col_double(),
  CS_SEXO = col_character(),
  DT_NASC = col_date(format = formato_data),
  NU_IDADE_N = col_double(),
  TP_IDADE = col_double(),
  COD_IDADE = col_double(),
  CS_GESTANT = col_double(),
  CS_RACA = col_double(),
  CS_ETINIA = col_character(),
  CS_ESCOL_N = col_double(),
  ID_PAIS = col_character(),
  CO_PAIS = col_double(),
  SG_UF = col_character(),
  ID_RG_RESI = col_character(),
  CO_RG_RESI = col_double(),
  ID_MN_RESI = col_character(),
  CO_MUN_RES = col_double(),
  CS_ZONA = col_double(),
  SURTO_SG = col_double(),
  NOSOCOMIAL = col_double(),
  AVE_SUINO = col_double(),
  FEBRE = col_double(),
  TOSSE = col_double(),
  GARGANTA = col_double(),
  DISPNEIA = col_double(),
  DESC_RESP = col_double(),
  SATURACAO = col_double(),
  DIARREIA = col_double(),
  VOMITO = col_double(),
  OUTRO_SIN = col_double(),
  OUTRO_DES = col_character(),
  PUERPERA = col_double(),
  FATOR_RISC = col_character(),
  CARDIOPATI = col_double(),
  HEMATOLOGI = col_double(),
  SIND_DOWN = col_double(),
  HEPATICA = col_double(),
  ASMA = col_double(),
  DIABETES = col_double(),
  NEUROLOGIC = col_double(),
  PNEUMOPATI = col_double(),
  IMUNODEPRE = col_double(),
  RENAL = col_double(),
  OBESIDADE = col_double(),
  OBES_IMC = col_double(),
  OUT_MORBI = col_double(),
  MORB_DESC = col_character(),
  VACINA = col_double(),
  DT_UT_DOSE = col_date(format = formato_data),
  MAE_VAC = col_double(),
  DT_VAC_MAE = col_date(format = formato_data),
  M_AMAMENTA = col_double(),
  DT_DOSEUNI = col_date(format = formato_data),
  DT_1_DOSE = col_date(format = formato_data),
  DT_2_DOSE = col_date(format = formato_data),
  ANTIVIRAL = col_double(),
  TP_ANTIVIR = col_double(),
  OUT_ANTIV = col_character(),
  DT_ANTIVIR = col_date(format = formato_data),
  HOSPITAL = col_double(),
  DT_INTERNA = col_date(format = formato_data),
  SG_UF_INTE = col_character(),
  ID_RG_INTE = col_character(),
  CO_RG_INTE = col_double(),
  ID_MN_INTE = col_character(),
  CO_MU_INTE = col_double(),
  UTI = col_double(),
  DT_ENTUTI = col_date(format = formato_data),
  DT_SAIDUTI = col_date(format = formato_data),
  SUPORT_VEN = col_double(),
  RAIOX_RES = col_double(),
  RAIOX_OUT = col_character(),
  DT_RAIOX = col_date(format = formato_data),
  AMOSTRA = col_double(),
  DT_COLETA = col_date(format = formato_data),
  TP_AMOSTRA = col_double(),
  OUT_AMOST = col_character(),
  PCR_RESUL = col_double(),
  DT_PCR = col_date(format = formato_data),
  POS_PCRFLU = col_double(),
  TP_FLU_PCR = col_double(),
  PCR_FLUASU = col_double(),
  FLUASU_OUT = col_character(),
  PCR_FLUBLI = col_double(),
  FLUBLI_OUT = col_character(),
  POS_PCROUT = col_double(),
  PCR_VSR = col_double(),
  PCR_PARA1 = col_double(),
  PCR_PARA2 = col_character(),
  PCR_PARA3 = col_double(),
  PCR_PARA4 = col_character(),
  PCR_ADENO = col_double(),
  PCR_METAP = col_double(),
  PCR_BOCA = col_character(),
  PCR_RINO = col_double(),
  PCR_OUTRO = col_double(),
  DS_PCR_OUT = col_character(),
  CLASSI_FIN = col_double(),
  CLASSI_OUT = col_character(),
  CRITERIO = col_double(),
  EVOLUCAO = col_double(),
  DT_EVOLUCA = col_date(format = formato_data),
  DT_ENCERRA = col_date(format = formato_data),
  DT_DIGITA = col_date(format = formato_data),
  HISTO_VGM = col_double(),
  PAIS_VGM = col_character(),
  CO_PS_VGM = col_double(),
  LO_PS_VGM = col_character(),
  DT_VGM = col_date(format = formato_data),
  DT_RT_VGM = col_date(format = formato_data),
  PCR_SARS2 = col_double(),
  PAC_COCBO = col_character(),
  PAC_DSCBO = col_character(),
  OUT_ANIM = col_character(),
  DOR_ABD = col_double(),
  FADIGA = col_double(),
  PERD_OLFT = col_double(),
  PERD_PALA = col_double(),
  TOMO_RES = col_double(),
  TOMO_OUT = col_character(),
  DT_TOMO = col_date(format = formato_data),
  TP_TES_AN = col_double(),
  DT_RES_AN = col_date(format = formato_data),
  RES_AN = col_double(),
  POS_AN_FLU = col_double(),
  TP_FLU_AN = col_character(),
  POS_AN_OUT = col_double(),
  AN_SARS2 = col_double(),
  AN_VSR = col_character(),
  AN_PARA1 = col_character(),
  AN_PARA2 = col_character(),
  AN_PARA3 = col_character(),
  AN_ADENO = col_character(),
  AN_OUTRO = col_double(),
  DS_AN_OUT = col_character(),
  TP_AM_SOR = col_double(),
  SOR_OUT = col_character(),
  DT_CO_SOR = col_date(format = formato_data),
  TP_SOR = col_double(),
  OUT_SOR = col_character(),
  DT_RES = col_date(format = formato_data),
  RES_IGG = col_character(),
  RES_IGM = col_character(),
  RES_IGA = col_character()
))

head(sivep_2020)

### 2021 --------------------------------------------------------------------
 ### source: https://opendatasus.saude.gov.br/dataset/srag-2021-e-2022

sivep_2021 <- read_csv2("Dados/input/220613_srag_base_oficial_2021.csv", col_types = cols(
  DT_NOTIFIC = col_date(format = formato_data),
  SEM_NOT = col_double(),
  DT_SIN_PRI = col_date(format = formato_data),
  SEM_PRI = col_double(),
  SG_UF_NOT = col_character(),
  ID_REGIONA = col_character(),
  CO_REGIONA = col_double(),
  ID_MUNICIP = col_character(),
  CO_MUN_NOT = col_double(),
  ID_UNIDADE = col_character(),
  CO_UNI_NOT = col_double(),
  CS_SEXO = col_character(),
  DT_NASC = col_date(format = formato_data),
  NU_IDADE_N = col_double(),
  TP_IDADE = col_double(),
  COD_IDADE = col_double(),
  CS_GESTANT = col_double(),
  CS_RACA = col_double(),
  CS_ETINIA = col_character(),
  CS_ESCOL_N = col_double(),
  ID_PAIS = col_character(),
  CO_PAIS = col_double(),
  SG_UF = col_character(),
  ID_RG_RESI = col_character(),
  CO_RG_RESI = col_double(),
  ID_MN_RESI = col_character(),
  CO_MUN_RES = col_double(),
  CS_ZONA = col_double(),
  SURTO_SG = col_double(),
  NOSOCOMIAL = col_double(),
  AVE_SUINO = col_double(),
  FEBRE = col_double(),
  TOSSE = col_double(),
  GARGANTA = col_double(),
  DISPNEIA = col_double(),
  DESC_RESP = col_double(),
  SATURACAO = col_double(),
  DIARREIA = col_double(),
  VOMITO = col_double(),
  OUTRO_SIN = col_double(),
  OUTRO_DES = col_character(),
  PUERPERA = col_double(),
  FATOR_RISC = col_character(),
  CARDIOPATI = col_double(),
  HEMATOLOGI = col_double(),
  SIND_DOWN = col_double(),
  HEPATICA = col_double(),
  ASMA = col_double(),
  DIABETES = col_double(),
  NEUROLOGIC = col_double(),
  PNEUMOPATI = col_double(),
  IMUNODEPRE = col_double(),
  RENAL = col_double(),
  OBESIDADE = col_double(),
  OBES_IMC = col_double(),
  OUT_MORBI = col_double(),
  MORB_DESC = col_character(),
  VACINA = col_double(),
  DT_UT_DOSE = col_date(format = formato_data),
  MAE_VAC = col_double(),
  DT_VAC_MAE = col_date(format = formato_data),
  M_AMAMENTA = col_double(),
  DT_DOSEUNI = col_date(format = formato_data),
  DT_1_DOSE = col_date(format = formato_data),
  DT_2_DOSE = col_date(format = formato_data),
  ANTIVIRAL = col_double(),
  TP_ANTIVIR = col_double(),
  OUT_ANTIV = col_character(),
  DT_ANTIVIR = col_date(format = formato_data),
  HOSPITAL = col_double(),
  DT_INTERNA = col_date(format = formato_data),
  SG_UF_INTE = col_character(),
  ID_RG_INTE = col_character(),
  CO_RG_INTE = col_double(),
  ID_MN_INTE = col_character(),
  CO_MU_INTE = col_double(),
  UTI = col_double(),
  DT_ENTUTI = col_date(format = formato_data),
  DT_SAIDUTI = col_date(format = formato_data),
  SUPORT_VEN = col_double(),
  RAIOX_RES = col_double(),
  RAIOX_OUT = col_character(),
  DT_RAIOX = col_date(format = formato_data),
  AMOSTRA = col_double(),
  DT_COLETA = col_date(format = formato_data),
  TP_AMOSTRA = col_double(),
  OUT_AMOST = col_character(),
  PCR_RESUL = col_double(),
  DT_PCR = col_date(format = formato_data),
  POS_PCRFLU = col_double(),
  TP_FLU_PCR = col_double(),
  PCR_FLUASU = col_double(),
  FLUASU_OUT = col_character(),
  PCR_FLUBLI = col_double(),
  FLUBLI_OUT = col_character(),
  POS_PCROUT = col_double(),
  PCR_VSR = col_double(),
  PCR_PARA1 = col_double(),
  PCR_PARA2 = col_character(),
  PCR_PARA3 = col_double(),
  PCR_PARA4 = col_character(),
  PCR_ADENO = col_double(),
  PCR_METAP = col_double(),
  PCR_BOCA = col_character(),
  PCR_RINO = col_double(),
  PCR_OUTRO = col_double(),
  DS_PCR_OUT = col_character(),
  CLASSI_FIN = col_double(),
  CLASSI_OUT = col_character(),
  CRITERIO = col_double(),
  EVOLUCAO = col_double(),
  DT_EVOLUCA = col_date(format = formato_data),
  DT_ENCERRA = col_date(format = formato_data),
  DT_DIGITA = col_date(format = formato_data),
  HISTO_VGM = col_double(),
  PAIS_VGM = col_character(),
  CO_PS_VGM = col_double(),
  LO_PS_VGM = col_character(),
  DT_VGM = col_date(format = formato_data),
  DT_RT_VGM = col_date(format = formato_data),
  PCR_SARS2 = col_double(),
  PAC_COCBO = col_character(),
  PAC_DSCBO = col_character(),
  OUT_ANIM = col_character(),
  DOR_ABD = col_double(),
  FADIGA = col_double(),
  PERD_OLFT = col_double(),
  PERD_PALA = col_double(),
  TOMO_RES = col_double(),
  TOMO_OUT = col_character(),
  DT_TOMO = col_date(format = formato_data),
  TP_TES_AN = col_double(),
  DT_RES_AN = col_date(format = formato_data),
  RES_AN = col_double(),
  POS_AN_FLU = col_double(),
  TP_FLU_AN = col_character(),
  POS_AN_OUT = col_double(),
  AN_SARS2 = col_double(),
  AN_VSR = col_character(),
  AN_PARA1 = col_character(),
  AN_PARA2 = col_character(),
  AN_PARA3 = col_character(),
  AN_ADENO = col_character(),
  AN_OUTRO = col_double(),
  DS_AN_OUT = col_character(),
  TP_AM_SOR = col_double(),
  SOR_OUT = col_character(),
  DT_CO_SOR = col_date(format = formato_data),
  TP_SOR = col_double(),
  OUT_SOR = col_character(),
  DT_RES = col_date(format = formato_data),
  RES_IGG = col_character(),
  RES_IGM = col_character(),
  RES_IGA = col_character()
))

head(sivep_2021)



### Merging ----------------------------------------------------------------


sivep_full <- bind_rows(sivep_2020, sivep_2021)
rm(sivep_2020, sivep_2021)

## Garbage collector
gc()

dim(sivep_full)


### Recoding variables ------------------------------------------------------
 ### based on: https://s3.sa-east-1.amazonaws.com/ckan.saude.gov.br/SRAG/pdfs/dicionario_de_dados_srag_hosp_17_02_2022.pdf

sivep_full <- sivep_full %>%
  mutate(CS_SEXO = recode(CS_SEXO,
                          "F" = "Feminino",
                          "M" = "Masculino",
                          "I" = "Ignorado",
                          .default = NA_character_)) %>%
  mutate(CS_SEXO = replace_na(CS_SEXO, "Não preenchido")) %>%
  mutate(TP_IDADE = recode(TP_IDADE,
                           "1" = "Dia",
                           "2" = "Mês",
                           "3" = "Ano",
                           .default = NA_character_)) %>%
  mutate(CS_GESTANT = recode(CS_GESTANT,
                             "1" = "1o trimestre",
                             "2" = "2o trimestre",
                             "3" = "3o trimestre",
                             "4" = "Idade gestacional ignorada",
                             "5" = "Não",
                             "6" = "Não se aplica",
                             "9" = "Ignorado",
                             "0" = "Ignorado",
                             .default = "Ignorado")) %>%
  mutate(CS_GESTANT = replace_na(CS_GESTANT, "Não preenchido")) %>%
  mutate(CS_RACA = recode(CS_RACA,
                          "1" = "Branca",
                          "2" = "Preta",
                          "3" = "Amarela",
                          "4" = "Parda",
                          "5" = "Indígena",
                          "9" = "Ignorado",
                          .default = "Ignorado")) %>%
  mutate(CS_RACA = replace_na(CS_RACA, "Não preenchido")) %>%
  mutate(CS_ESCOL_N = recode(CS_ESCOL_N,
                             "0" = "Sem escolaridade/Analfabeto",
                             "1" = "Fundamental 1o ciclo (1a a 5a série)",
                             "2" = "Fundamental 2o ciclo (6a a 9a série",
                             "3" = "Médio (1o ao 3o ano)",
                             "4" = "Superior",
                             "5" = "Não se aplica",
                             "9" = "Ignorado",
                             .default = "Ignorado")) %>%
  mutate(CS_ESCOL_N = replace_na(CS_ESCOL_N, "Não preenchido")) %>%
  mutate(CS_ZONA = recode(CS_ZONA, 
                          "1" = "Urbana",
                          "2" = "Rural",
                          "3" = "Periurbana",
                          "9" = "Ignorado",
                          .default = "Ignorado")) %>%
  mutate(CS_ZONA = replace_na(CS_ZONA, "Não preenchido")) %>%
  mutate(HISTO_VGM = recode(HISTO_VGM,
                            "1" = "Sim",
                            "2" = "Não",
                            "9" = "Ignorado",
                            "0" = "Ignorado",
                            .default = "Ignorado")) %>%
  mutate(SURTO_SG = recode(SURTO_SG,
                           "1" = "Sim",
                           "2" = "Não",
                           "9" = "Ignorado",
                           .default = "Ignorado")) %>%
  mutate(NOSOCOMIAL = recode(NOSOCOMIAL,
                             "1" = "Sim",
                             "2" = "Não",
                             "9" = "Ignorado",
                             .default = "Ignorado")) %>%
  mutate(NOSOCOMIAL = replace_na(NOSOCOMIAL, "Não preenchido")) %>%
  mutate(AVE_SUINO = recode(AVE_SUINO,
                            "1" = "Sim",
                            "2" = "Não",
                            "9" = "Ignorado",
                            .default = "Ignorado")) %>%
  mutate(FEBRE = recode(FEBRE,
                        "1" = "Sim",
                        "2" = "Não",
                        "9" = "Ignorado",
                        .default = "Ignorado")) %>%
  mutate(TOSSE = recode(TOSSE,
                        "1" = "Sim",
                        "2" = "Não",
                        "9" = "Ignorado",
                        .default = "Ignorado")) %>%
  mutate(GARGANTA = recode(GARGANTA,
                           "1" = "Sim",
                           "2" = "Não",
                           "9" = "Ignorado",
                           .default = "Ignorado")) %>%
  mutate(DISPNEIA = recode(DISPNEIA,
                           "1" = "Sim",
                           "2" = "Não",
                           "9" = "Ignorado",
                           .default = "Ignorado")) %>%
  mutate(DESC_RESP = recode(DESC_RESP,
                            "1" = "Sim",
                            "2" = "Não",
                            "9" = "Ignorado",
                            .default = "Ignorado")) %>%
  mutate(SATURACAO = recode(SATURACAO,
                            "1" = "Sim",
                            "2" = "Não",
                            "9" = "Ignorado",
                            .default = "Ignorado")) %>%
  mutate(DIARREIA = recode(DIARREIA,
                           "1" = "Sim",
                           "2" = "Não",
                           "9" = "Ignorado",
                           .default = "Ignorado")) %>%
  mutate(VOMITO = recode(VOMITO,
                         "1" = "Sim",
                         "2" = "Não",
                         "9" = "Ignorado",
                         .default = "Ignorado")) %>%
  mutate(OUTRO_SIN = recode(OUTRO_SIN,
                            "1" = "Sim",
                            "2" = "Não",
                            "9" = "Ignorado",
                            .default = "Ignorado")) %>%
  mutate(PUERPERA = recode(PUERPERA,
                           "1" = "Sim",
                           "2" = "Não",
                           "9" = "Ignorado",
                           .default = "Ignorado")) %>%
  mutate(CARDIOPATI = recode(CARDIOPATI,
                             "1" = "Sim",
                             "2" = "Não",
                             "9" = "Ignorado",
                             .default = "Ignorado")) %>%
  mutate(HEMATOLOGI = recode(HEMATOLOGI,
                             "1" = "Sim",
                             "2" = "Não",
                             "9" = "Ignorado",
                             .default = "Ignorado")) %>%
  mutate(SIND_DOWN = recode(SIND_DOWN,
                            "1" = "Sim",
                            "2" = "Não",
                            "9" = "Ignorado",
                            .default = "Ignorado")) %>%
  mutate(HEPATICA = recode(HEPATICA,
                           "1" = "Sim",
                           "2" = "Não",
                           "9" = "Ignorado",
                           .default = "Ignorado")) %>%
  mutate(ASMA = recode(ASMA,
                       "1" = "Sim",
                       "2" = "Não",
                       "9" = "Ignorado",
                       .default = "Ignorado")) %>%
  mutate(DIABETES = recode(DIABETES,
                           "1" = "Sim",
                           "2" = "Não",
                           "9" = "Ignorado",
                           .default = "Ignorado")) %>%
  mutate(NEUROLOGIC = recode(NEUROLOGIC,
                             "1" = "Sim",
                             "2" = "Não",
                             "9" = "Ignorado",
                             .default = "Ignorado")) %>%
  mutate(PNEUMOPATI = recode(PNEUMOPATI,
                             "1" = "Sim",
                             "2" = "Não",
                             "9" = "Ignorado",
                             .default = "Ignorado")) %>%
  mutate(IMUNODEPRE = recode(IMUNODEPRE,
                             "1" = "Sim",
                             "2" = "Não",
                             "9" = "Ignorado",
                             .default = "Ignorado")) %>%
  mutate(RENAL = recode(RENAL,
                        "1" = "Sim",
                        "2" = "Não",
                        "9" = "Ignorado",
                        .default = "Ignorado")) %>%
  mutate(OBESIDADE = recode(OBESIDADE,
                            "1" = "Sim",
                            "2" = "Não",
                            "9" = "Ignorado",
                            .default = "Ignorado")) %>%
  mutate(OUT_MORBI = recode(OUT_MORBI,
                            "1" = "Sim",
                            "2" = "Não",
                            "9" = "Ignorado",
                            .default = "Ignorado")) %>%
  mutate(VACINA = recode(VACINA,
                         "1" = "Sim",
                         "2" = "Não",
                         "9" = "Ignorado",
                         .default = "Ignorado")) %>%
  mutate(MAE_VAC = recode(MAE_VAC,
                          "1" = "Sim",
                          "2" = "Não",
                          "9" = "Ignorado",
                          .default = "Ignorado")) %>%
  mutate(M_AMAMENTA = recode(M_AMAMENTA,
                             "1" = "Sim",
                             "2" = "Não",
                             "9" = "Ignorado",
                             .default = "Ignorado")) %>%
  mutate(ANTIVIRAL = recode(ANTIVIRAL,
                            "1" = "Sim",
                            "2" = "Não",
                            "9" = "Ignorado")) %>%
  mutate(ANTIVIRAL = replace_na(ANTIVIRAL, "Não preenchido")) %>%
  mutate(TP_ANTIVIR = recode(TP_ANTIVIR,
                             "1" = "Oseltamivir",
                             "2" = "Zanamivir",
                             "3" = "Outro",
                             .default = "Ignorado")) %>%
  mutate(HOSPITAL = recode(HOSPITAL,
                           "1" = "Sim",
                           "2" = "Não",
                           "9" = "Ignorado",
                           .default = "Ignorado")) %>%
  mutate(UTI = recode(UTI,
                      "1" = "Sim",
                      "2" = "Não",
                      "9" = "Ignorado",
                      .default = "Ignorado")) %>%
  mutate(SUPORT_VEN = recode(SUPORT_VEN,
                             "1" = "Sim, invasivo",
                             "2" = "Sim, não invasivo",
                             "3" = "Não",
                             "9" = "Ignorado",
                             .default = "Ignorado")) %>%
  mutate(RAIOX_RES = recode(RAIOX_RES,
                            "1" = "Normal",
                            "2" = "Infiltrado intersticial",
                            "3" = "Consolidação",
                            "4" = "Misto",
                            "5" = "Outro",
                            "6" = "Não realizado",
                            "9" = "Ignorado",
                            .default = "Ignorado")) %>%
  mutate(AMOSTRA = recode(AMOSTRA,
                          "1" = "Sim",
                          "2" = "Não",
                          "9" = "Ignorado",
                          .default = "Ignorado")) %>%
  mutate(TP_AMOSTRA = recode(TP_AMOSTRA,
                             "1" = "Secreção de naso-orofaringe",
                             "2" = "Lavado broco-alveolar",
                             "3" = "Tecido post mortem",
                             "4" = "Outra",
                             "9" = "Ignorado",
                             .default = "Ignorado")) %>%
  mutate(PCR_RESUL = recode(PCR_RESUL,
                            "1" = "Detectável",
                            "2" = "Não detectável",
                            "3" = "Inconclusivo",
                            "4" = "Não realizado",
                            "5" = "Aguardando resultado",
                            "9" = "Ignorado",
                            .default = "Ignorado")) %>%
  mutate(TP_FLU_PCR = recode(TP_FLU_PCR,
                             "1" = "Influenza A",
                             "2" = "Influenza B")) %>%
  mutate(PCR_FLUASU = recode(PCR_FLUASU,
                             "1" = "Influenza A (H1N1)",
                             "2" = "Influenza A (H3N2)",
                             "3" = "Influenza A (Não subtipado)",
                             "4" = "Influenza A (Não subtipável)",
                             "5" = "Inconclusivo",
                             "6" = "Outro",
                             .default = "Ignorado")) %>%
  mutate(PCR_FLUBLI = recode(PCR_FLUBLI,
                             "1" = "Victoria",
                             "2" = "Yamagatha",
                             "3" = "Não realizado",
                             "4" = "Inconclusivo",
                             "5" = "Outro",
                             .default = "Ignorado")) %>%
  mutate(POS_PCROUT = recode(POS_PCROUT,
                             "1" = "Sim",
                             "2" = "Não",
                             "9" = "Ignorado",
                             .default = "Ignorado")) %>%
  mutate(CLASSI_FIN = recode(CLASSI_FIN,
                             "1" = "SRAG por influenza",
                             "2" = "SRAG por outro vírus respiratório",
                             "3" = "SRAG por outro agente etiológico",
                             "4" = "SRAG não especificado",
                             "5" = "SRAG COVID-19",
                             .default = "Ignorado")) %>%
  mutate(CRITERIO = recode(CRITERIO,
                           "1" = "Laboratorial",
                           "2" = "Vínculo epidemiológico",
                           "3" = "Clínico",
                           .default = "Ignorado")) %>%
  mutate(EVOLUCAO = recode(EVOLUCAO,
                           "1" = "Cura",
                           "2" = "Óbito",
                           "3" = "Óbito por outras causas",
                           "9" = "Ignorado",
                           .default = "Ignorado")) %>%
  mutate(VACINA_COV = recode(VACINA_COV,
                             "1" = "Sim",
                             "2" = "Não",
                             "9" = "Ignorado")) %>%                
  mutate(VACINA_COV = replace_na(VACINA_COV, "Não preenchido")) %>%                                  
  mutate(PAC_DSCBO = replace_na(PAC_DSCBO, "Não preenchido")) %>%
  mutate(ID_UNIDADE = replace_na(ID_UNIDADE, "Unidade não informada")) %>%
  mutate(EVOLUCAO = replace_na(EVOLUCAO, "Em andamento")) %>%
  mutate(idade = if_else(TP_IDADE == "Ano", NU_IDADE_N, 0)) %>%
  mutate(fx_etaria = cut(idade, 
                         breaks = c(-Inf, 2, 4, 9, 19, 29, 39, 49, 59, +Inf),
                         labels = c("< 2 anos", "2-4 anos", "5-9 anos", "10-19 anos", "20-29 anos", "30-39 anos", "40-49 anos", "50-59 anos", "60+ anos")
  )
  ) %>%
  select(-idade)


### Cleaning ----------------------------------------------------------------

length(unique(sivep_full$ID_MN_RESI)) # ou seja, faltam uns 200 municípios aqui... Talvez não tenha tido nenhum reporte mesmo
length(unique(sivep_full$CO_MUN_RES)) # aqui tenho 30 a mais, o que talvez indique erro ao reportar

head(sivep_full$ID_MN_RESI)
head(sivep_full$CO_MUN_RES)


### Creating Outcome Variables ----------------------------------------------


sivep_2020 <- sivep_full %>%
  filter((CLASSI_FIN == "SRAG COVID-19" | CLASSI_FIN == "SRAG não especificado") & DT_SIN_PRI >= "2020-03-01" & DT_SIN_PRI <= "2020-12-31") %>%
  group_by(CO_MUN_RES) %>%
  summarise(deaths = sum(EVOLUCAO == "Óbito", na.rm = TRUE),
            hosp = sum(HOSPITAL == "Sim", na.rm = TRUE),
            coorte = 2016) %>%
  arrange(desc(deaths)) 

sivep_2021 <- sivep_full %>%
  filter(CLASSI_FIN == "SRAG COVID-19" & DT_SIN_PRI >= "2021-03-01" & DT_SIN_PRI <= "2021-12-31") %>% 
  group_by(CO_MUN_RES) %>%
  summarise(deaths = sum(EVOLUCAO == "Óbito", na.rm = TRUE),
            hosp = sum(HOSPITAL == "Sim", na.rm = TRUE),
            coorte = 2020) %>%
  arrange(desc(deaths)) 


sivep <- bind_rows(sivep_2020, sivep_2021)
rm(sivep_2020, sivep_2021)
sivep <- sivep %>% 
  rename(id_municipio = CO_MUN_RES)
sivep <- sivep %>% 
  rename(deaths_sivep = deaths, hosp_sivep = hosp)

sivep %>% 
  group_by(id_municipio) %>% 
  count() %>% 
  arrange(n) %>% 
  filter(n == 1) # 202 municípios só estão aparecendo uma vez, tenho que descobrir o porquê -> Aparentemente é porque não houve hospitalizações para eles em 2016

sivep <- sivep %>% 
  mutate(id_municipio = as.character(id_municipio))


sivep <- sivep %>% 
  group_by(id_municipio) %>% 
  arrange(coorte) %>% 
  mutate(delta_deaths_sivep = deaths_sivep - lag(deaths_sivep, n = 1, default = NA),
         delta_hosp_sivep = deaths_sivep - lag(deaths_sivep, n = 1, default = NA)) %>% 
  arrange(desc(coorte))



# Oppening RDD Database ----------------------------------------------------

#df <- readRDS("Dados/output/220927_base_rdd_covid_stem.rds")


# Creating dataframe with multiple coortes --------------------------------------------------------

df <- read.csv("Dados/output/220921_base_rdd_covid_stem_2016.csv", sep = ";") # source: https://brasil.io/dataset/covid19/caso/

df2 <- read.csv("Dados/output/220921_base_rdd_covid_stem_2020.csv", sep = ";") # source: https://brasil.io/dataset/covid19/caso/

#df <- rbind(df, df2) # por enquanto elas têm colunas diferentes, então tenho que usar outro comando que não o rbind
df <- rbind.fill(df, df2)

df_baseline <- read.csv("Dados/input/220718_stem_baseline_vaccination_municipialities.csv", sep = ";") # source: https://basedosdados.org/dataset/mundo-onu-adh?bdm_table=brasil

df_baseline$id_municipio = substr(df_baseline$id_municipio,1,6)

# Merging the data --------------------------------------------------------


df <- df %>% 
  dplyr::rename(coorte = ano) %>% 
  mutate(id_municipio_2 = id_municipio, id_municipio = substr(id_municipio_2,1,6))

df <- left_join(df, sivep, by = c("id_municipio","coorte"))
dim(df)

df <- left_join(df, df_baseline, by = c("id_municipio"))
dim(df)




# Joining with cases 2021

df <- df %>% 
  rename(confirmed_per_100k_inhabitants_total = confirmed_per_100k_inhabitants)

df_cases <- read.csv("Dados/output/220809_confirmed_cases_2021.csv", sep = ";") # source: https://basedosdados.org/dataset/mundo-onu-adh?bdm_table=brasil

df_cases$id_municipio = substr(df_cases$id_municipio,1,6)

df_cases$coorte = 2020

df_cases <- df_cases %>% 
  summarise(id_municipio, confirmed_per_100k_inhabitants, coorte)

df <- left_join(df, df_cases, by = c("id_municipio","coorte"))


df$confirmed_per_100k_inhabitants = ifelse(df$coorte == 2016, df$confirmed_per_100k_inhabitants_total, df$confirmed_per_100k_inhabitants)

df %>%
 mutate(confirmed_per_100k_inhabitants_previous_year = confirmed_per_100k_inhabitants_total - confirmed_per_100k_inhabitants) %>% 
  summarise(id_municipio, coorte, confirmed_per_100k_inhabitants, confirmed_per_100k_inhabitants_total, confirmed_per_100k_inhabitants_previous_year) %>% 
  arrange(desc(coorte))

# Adding Health data for baseline

df_health <- read.csv2("Dados/input/220922_28_indicadores_mun_data_ieps_2015.csv", sep = ",") # source: https://iepsdata.org.br/data-downloads

df_health <- df_health %>% 
  rename(id_municipio = codmun)

df_health <- df_health %>% 
  summarise(id_municipio, desp_tot_saude_pc_uf_def, tx_med_ch, pct_desp_recp_saude_mun, cob_esf, tx_leito_sus)

df_health$id_municipio <- as.character(df_health$id_municipio)

df <- left_join(df, df_health, by = c("id_municipio"))
dim(df)


# Adding political scores
## source: https://dataverse.harvard.edu/file.xhtml?persistentId=doi:10.7910/DVN/8USPML/20URAD&version=2.0

df_political <- read.csv("Dados/input/223007_partidos_ano_v2018.csv", sep = ";") 

df_political <- df_political %>% 
  filter(ANO_ELEICAO == 2016) %>% 
  mutate(sigla_partido = recode(SIGLA_PARTIDO,
                                "SD" = "SOLIDARIEDADE",
                                "PPS" = "CIDADANIA",
                                "PRB" = "REPUBLICANOS",
                                "PMDB" = "MDB",
                                "PEN" = "PATRIOTA",
                                "PR" = "PL",
                                "PTN" = "PODE",
                                "PSDC" = "DC",
                                "PT do B" = "AVANTE",
                                .default = SIGLA_PARTIDO)) %>% 
  transmute(sigla_partido, ideology_2018 = IDEO_IMPUTED)

df <- left_join(df, df_political, by = 'sigla_partido')

# Adding undergraduate degree database

df_formacao <- read.csv("Dados/output/220923_curso_stem.csv", sep = ",")

df_formacao$graduacao_stem = df_formacao$curso_stem

df_formacao <- df_formacao %>%
  summarise(cpf, graduacao_stem)

df_formacao <- df_formacao %>% 
  distinct()

df <- left_join(df, df_formacao, by = 'cpf')

df %>% 
  group_by(cpf) %>% 
  count() %>% 
  arrange(desc(n))

# Adding NFI database

df_nfi <- read_excel("Dados/input/220927_cnm_medidas_sanitarias.xlsx")

as.numeric(as.factor(df_nfi$`Q1. Barreiras sanitárias (posto de monitoramento de entrada e saída de pessoas no Município)`)) - 1

df_nfi <- df_nfi %>% 
  transmute(id_municipio = substr(Ibge,1,6),
            barreiras_sanitarias = as.numeric(as.factor(df_nfi$`Q1. Barreiras sanitárias (posto de monitoramento de entrada e saída de pessoas no Município)`)) - 1,
            mascaras = as.numeric(as.factor(df_nfi$`Q4. Uso obrigatório de máscaras faciais.`)) - 1,
            restricao_atv_nao_essenciais = as.numeric(as.factor(df_nfi$`Q3. Medidas de isolamento social, permitindo APENAS serviços essenciais.`)) - 1,
            restricao_circulacao = as.numeric(as.factor(df_nfi$`Q2. Medidas restritivas para diminuição da circulação/aglomeração de pessoas.`)) - 1,
            restricao_transporte_publico = as.numeric(as.factor(df_nfi$`Q5. Foram adotadas medidas de redução na oferta de transporte público?`)) - 1)

df_nfi <- df_nfi %>%
  group_by(id_municipio) %>% 
  mutate(total_nfi = sum(barreiras_sanitarias, mascaras, restricao_atv_nao_essenciais, restricao_circulacao, restricao_transporte_publico, na.rm = TRUE)) %>% 
  ungroup()

summary(df_nfi)

df <- left_join(df, df_nfi, by = c("id_municipio"))

#Saving the database -----------------------------------------------------

saveRDS(df, "Dados/Output/220927_base_rdd_covid_stem.rds")

# Choosing the definition of STEM -----------------------------------------

df <- df %>%
  mutate(stem_job_2 = stem_job == 1 | ocupacao == "medico" | ocupacao == "engenheiro" | ocupacao == "biomedico"| ocupacao == "quimico" | ocupacao == "biologo" | ocupacao == "estatistico" | ocupacao == "tecnico em informatica") %>% 
  mutate(stem_job_3 = stem_job_2 == 1 & ocupacao != "medico") %>% 
  mutate(medico = ocupacao == "medico") %>% 
  mutate(stem_job_4 = stem_job == 1 & graduacao_stem == 1 & tenure >= 12)



df <- df %>% 
  #dplyr::filter((resultado == "eleito" | X2_lugar == 'True')) %>%  # escolhendo só o primeiro e o segundo colocado
  dplyr::group_by(id_municipio, coorte) %>% 
  dplyr::mutate(rdd1 = ifelse(sum(stem_job == 1) == 1, 1, 0),
                rdd2 = ifelse(sum(stem_job_2 == 1) == 1, 1, 0),
                rdd3 = ifelse(sum(stem_job_3 == 1) == 1, 1, 0),
                rdd4 = ifelse(sum(stem_job_4 == 1) == 1, 1, 0))
         
df %>% 
  filter(rdd4 == 1)


### Creating "variables"


df$he_non_stem_cdt = ifelse(str_detect(df$instrucao, "ensino superior completo") & df$stem_job_4 == 0 & df$rdd4 == 1, 1, 0)


df <- df %>% 
  group_by(id_municipio, coorte) %>%
  mutate(stem_cdt_tenure = sum(tenure),
         deaths_per_100k_inhabitants = (deaths / estimated_population) * 100000,
         hosp_per_100k_inhabitants = (hosp_sivep / estimated_population) * 100000,
         deaths_sivep_per_100k_inhabitants = (deaths_sivep / estimated_population) * 100000,
         sch_non_stem_cdt = sum(he_non_stem_cdt, na.rm = TRUE),
         #delta_hosp_per_100k_inhabitants = (delta_hosp_sivep / estimated_population) * 100000,
         #deaths_per_100k_inhabitants = (delta_deaths_sivep / estimated_population) * 100000,
         )



df2 <- df %>%
filter(resultado == "eleito")

df_stem <- df %>%
  dplyr::filter(rdd4 == 1)

df %>% 
  summarise(coorte,id_municipio,rdd,rdd1,rdd4) %>% 
  arrange(desc(rdd))

df <- df %>%
  dplyr::filter(rdd4 == 1)


## Criando tabela de candidatos stem

stem_eleitos <- df_stem %>% 
  filter(stem_job_4 == 1) %>% 
  summarise(coorte,
            resultado,
            id_municipio,
            city,
            state,
            sigla_partido,
            cpf,
            nome,
            ocupacao,
            instrucao,
            cbo_2002,
            tenure,
            idade,
            genero)


#write.table(stem_eleitos, "C:\\Users\\GabrielCaserDosPasso\\Documents\\RAIS\\Dados\\Output\\220922_stem_eleitos.csv", sep = ',', row.names = FALSE, fileEncoding = "latin1")

# voltando

df <- df %>%
  dplyr::filter(resultado == "eleito")



df$dif_votos = ifelse(df$stem_job_4 == 1, df$dif_votos, -df$dif_votos)


df <- df %>%
  mutate(reeleito = ocupacao == "prefeito")
df <- df %>%
  mutate(mulher = genero == "feminino")

df <- df %>% 
  mutate(cbo_agregado = substr(cbo_2002,1,4))

df$ens_sup = ifelse(str_detect(df$instrucao, "ensino superior completo"),1,0)

#### crating confirmed cases previous year

df <- df %>%
  mutate(confirmed_per_100k_inhabitants_previous_year = confirmed_per_100k_inhabitants_total - confirmed_per_100k_inhabitants)


#### creating agregated occupation code 'cbo'

df <- df %>% 
  mutate(cbo_agregado_nome = recode(cbo_agregado,
                                    "1425" = "Gerentes de TI",
                                    "2124" = "Analistas de TI",
                                    "2142" = "Engenheiros civis e afins",
                                    "2221" = "Engenheiros agrossilvipecuários",
                                    "2344" = "Prof. de ciências biológicas e da saúde do Ens. Sup.",
                                    "3171" = "Técnicos de desenvolvimento de sistemas e aplicações",
                                    "3172" = "Técnicos em operação e monitoração de computadores",
                                    .default = cbo_agregado))



## Creating variables X e Y E T

df$X = df$dif_votos

df$Y_deaths = df$deaths_per_100k_inhabitants

df$Y_deaths_sivep = df$deaths_sivep_per_100k_inhabitants

df$Y_cases = df$confirmed_per_100k_inhabitants

df$Y_hosp = df$hosp_per_100k_inhabitants


## Creating dummy = 1 if STEM candidate won

df$T = ifelse(df$X >= 0, 1, 0)

df$T_X = df$X * df$T

# Cleaning the data -------------------------------------------------------

df <- df %>% 
  summarise(coorte,
            sigla_uf,
            city,
            id_municipio,
            resultado,
            situacao,
            nome,
            cpf,
            instrucao,
            ocupacao,
            graduacao_stem,
            cbo_2002,
            cbo_agregado,
            cbo_agregado_nome,
            stem_job_4,
            medico,
            tenure,
            sigla_partido,
            idade,
            genero,
            estimated_population,
            populacao_2010,
            taxa_analfabetismo_18_mais,
            indice_gini,
            idhm,
            renda_pc,
            per_populacao_urbana,
            per_populacao_homens,
            total_vacinados,
            per_vacinados,
            tx_med_ch,
            pct_desp_recp_saude_mun,
            cob_esf,
            tx_leito_sus,
            ideology_2018,
            reeleito,
            mulher,
            ens_sup,
            sch_non_stem_cdt,
            X,
            Y_deaths_sivep,
            Y_cases,
            Y_hosp,
            cbo_agregado_nome,
            barreiras_sanitarias,
            mascaras,
            restricao_atv_nao_essenciais,
            restricao_circulacao,
            restricao_transporte_publico,
            total_nfi)

df <- df %>% 
  filter(situacao != "cassado com recurso" & situacao != "indeferido")

df %>% 
  group_by(id_municipio, coorte) %>% 
  count() %>% 
  arrange(desc(n))



# Running MSE-optimal bandwidth selector -----------------------------------

#### Criando tabela

tidy.rdrobust <- function(model, ...) {
  ret <- data.frame(
    term = row.names(model$coef),
    estimate = model$coef[, 1],
    std.error = model$se[, 1],
    p.value = model$pv[, 1]
  )
  row.names(ret) <- NULL
  ret
}

glance.rdrobust <- function(model, ...) {
  ret <- data.frame(
    "Eff number obs." = as.character(model$N_h[1] + model$N_h[2]),
    "Bandwidth" = as.character(round(model$bws[1,1] * 100, 2))
  )
  ret
}


# Creating state dummies for fixed effects --------------------------------


state.f = factor(df$sigla_uf)

state.d = model.matrix(~state.f+0)


            
# Sum stats ---------------------------------------------------------------

datasummary_skim(df[1:50], output = 'latex')
datasummary_skim(df[50:81])

## deaths and hospitalizations ---------------------------------------------

sivep %>% 
  group_by(coorte) %>% 
  count() # tenho que descobrir porque estão aparecendo municípios a mais -> aparentemente são algumas classificações diferentes (Brasília - Asa Norte, Brasília - Asa Sul, dentre outros typos)


## stem candidates ---------------------------------------------------------


profi2 <- df %>%
  group_by(coorte) %>% 
  dplyr::summarise(per_stem_candidates_elected = (sum(stem_job_4 == 1)), #/ sum(stem_job != 99)) * 100,
            total_stem_candidates = (sum(stem_job_4 == 1)))


q <- ggplot(profi2, aes(x = as.character(coorte), y = per_stem_candidates_elected)) +
  geom_bar(stat = "identity") +
  theme_minimal() + 
  #ggtitle("Number of STEM candidates elected in the sample ") +
  xlab("cohort") +
  ylab("number of STEM mayors")

q

#ggsave("Dados/output/220901_barplot_stem_candidates.png", height = 4, width = 4)

profi <- df %>% 
  filter(stem_job_4 == 1) %>%
  group_by(coorte, cbo_agregado_nome) %>%
  dplyr::summarise(number = n()) %>%
  ungroup() %>% 
  group_by(coorte) %>%
  slice_max(order_by = number, n = 5) %>%
  arrange(desc(number))


p <- ggplot(profi, aes(x = as.character(coorte), y = number, fill = as.character(cbo_agregado_nome))) +
  geom_bar(stat = "identity") +
  theme_minimal() + 
  #ggtitle("Top 5 STEM candidates' occupations") +
  xlab("coorte") +
  ylab("number of STEM mayors")
  
p <- p + scale_fill_discrete(name = "cbo_2002")
p

#ggsave("Dados/output/220921_barplot_stem_cbos.png", height = 4, width = 6)


profi_RO <- df %>% 
  filter(stem_job_4 == 1 & sigla_uf == "RO") %>%
  group_by(coorte, cbo_agregado_nome) %>%
  dplyr::summarise(number = n()) %>%
  ungroup() %>% 
  group_by(coorte) %>%
  slice_max(order_by = number, n = 5) %>%
  arrange(desc(number))


p_RO <- ggplot(profi_RO, aes(x = as.character(coorte), y = number, fill = as.character(cbo_agregado_nome))) +
  geom_bar(stat = "identity") +
  theme_minimal() + 
  ggtitle("Top 5 STEM candidate's occupations (TSE)") +
  xlab("coorte") +
  ylab("number of STEM mayors")

p_RO <- p_RO + scale_fill_discrete(name = "cbo_2002")
p_RO


## tenure

box <- ggplot(subset(df, stem_job_4 == 1)) + 
  geom_boxplot(aes(y=tenure, fill = as.factor(coorte)))
box


#df<- df %>% 
  #filter(estimated_population < 200000)




## % of STEM candidates per state

states <- df2 %>% 
  group_by(state, coorte) %>% 
  dplyr::summarise(perc_stem = sum(stem_job_4 == 1, na.rm = TRUE) / sum(stem_job_4 == 1 | stem_job_4 == 0, na.rm = TRUE)) %>% 
  arrange(desc(perc_stem))

box2 <- ggplot(states, aes(y = perc_stem, group = coorte, x = as.character(coorte))) + 
  geom_boxplot() + 
  theme_minimal() + 
  xlab("coorte") +
  ylab("% of STEM mayors")

box2 # bem estranho esses outliers, tenho que investigar porque RO e AC estão com tantos prefeitos STEM

mean(states$perc_stem[states$coorte == 2016])
mean(states$perc_stem[states$coorte == 2020])

### Investigando outliers

MG <- df2 %>% ## o estranho aqui é o tanto de stem com cbo '317110' que é 'Programador de sistemas de informação'
  filter(state == 'MG' & coorte == 2020) %>%
  summarise(id_municipio, city, cpf, nome, sigla_partido, stem_job_4, tenure, ocupacao, cbo_2002, instrucao, confirmed_per_100k_inhabitants, deaths_per_100k_inhabitants)


df2 %>% 
  filter(coorte == 2020) %>% 
  group_by(id_municipio) %>% 
  dplyr::count() %>% 
  arrange(desc(n)) # está repetindo apenas um município na amostra, tenho que apagá-lo




# Criando mapa ---------------------------------------------------------

## estados
#utils::remove.packages('geobr')
#devtools::install_github("ipeaGIT/geobr", subdir = "r-package")
#library('geobr')
##dados_mapa <- read_state(year=2019, showProgress = FALSE, simplified = FALSE)

dados_mapa <- readRDS("Dados/input/220811_geo_dados_estados_2019.rds")

sf2 <- states %>% 
  filter(coorte == 2016)

sf2 <- sf2 %>% 
  rename(sigla_uf = state)

dados_mapa <- dados_mapa %>% 
  rename(sigla_uf = abbrev_state)


sf2 <- left_join(dados_mapa, sf2, by = c("sigla_uf"))
dim(df)

sf2$perc_stem = sf2$perc_stem * 100


sf2 %>% 
  ggplot() +
  geom_sf(aes(fill = perc_stem), alpha = 0.9, color = NA) +
  labs(title="Percentage of STEM mayors per state (2016)",
       caption='Source: Author', size = 8) +
  viridis::scale_fill_viridis(
                       direction = 1,
                       name="% of STEM mayors",
                       na.value = "white"
  ) +
  theme_minimal()

#ggsave("Dados/output/220831_mapa_stem_estados.png", height = 7, width = 7)


## municipios

mun <- readRDS("Dados/input/220811_geo_dados_municipios_2019.rds")

mun <- mun %>% 
  rename(id_municipio = code_muni)

mun$id_municipio = substr(mun$id_municipio,1,6)

sf3 <- df %>% 
  filter(coorte == 2016)

sf3 <- left_join(mun, sf3, by = c("id_municipio"))

sf3 %>%
  filter(code_region == 3) %>%  # para ver o mapa inteiro é só tirar o code_region
  ggplot() +
  geom_sf(data = subset(dados_mapa, code_region == 3)) +
  geom_sf(aes(fill = stem_job_4), alpha = .7, color = NA) +
  labs(title="Municipalities where a STEM canditate was among the top 2 voted (2016)",
       caption='Source: Author', size = 8) +
  scale_fill_manual(values = c("red", "blue"),
                    name = "STEM candidate",
                    na.value = "grey90",
                    labels = c("Lost","Won", "Not in top 2")) +
  theme_minimal() + 
  theme(axis.title = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        panel.grid = element_blank())

#ggsave("Dados/output/220901_mapa_stem_municipios.png", height = 7, width = 7)



# Gráficos - Discontinuidade ----------------------------------------------

amostra <- cbind(df$coorte == 2016 & df$sch_non_stem_cdt == 1 & df$ens_sup == 1)

poli = 1
covsZ = state.d


rdplot(df$Y_hosp[df$X >= -0.05 & df$X <= 0.05], df$X[df$X >= -0.05 & df$X <= 0.05],
       p = poli,
       kernel = 'uniform',
       x.label = "Vote margin",
       y.label = "Hospitalizations per 100k habitants",
       title = "Discontinuity: STEM Candidates elected in 2016 vs. Covid Hospitalizations in 2020")

rdplot(df$Y_deaths_sivep[df$X >= -0.05 & df$X <= 0.05], df$X[df$X >= -0.05 & df$X <= 0.05],
       p = poli,
       kernel = 'uniform',
       x.label = "Vote margin",
       y.label = "Deaths per 100k habitants",
       title = "Discontinuity: STEM Candidates elected in 2016 vs. Covid Hospitalizations in 2020")




# Montando tabelas --------------------------------------------------------
### Sem efeitos fixos ----------------------------------------------------

#### Optimal bandwidth ---------------------------------------------------

amostra = c(df$coorte == 2016)
covsZ = c(df$sch_non_stem_cdt == 1)

taxa_analfabetismo_18_mais <- rdrobust(df$taxa_analfabetismo_18_mais, df$X, bwselect = "mserd", kernel = 'uniform', subset = amostra, covs = covsZ)
indice_gini <- rdrobust(df$indice_gini, df$X, bwselect = "mserd", kernel = 'uniform', subset = amostra, covs = covsZ)
renda_pc <- rdrobust(df$renda_pc, df$X, bwselect = "mserd", kernel = 'uniform', subset = amostra, covs = covsZ)
populacao_2010 <- rdrobust(df$populacao_2010, df$X, bwselect = "mserd", kernel = 'uniform', subset = amostra, covs = covsZ)
idhm <- rdrobust(df$idhm, df$X,bwselect = "mserd", kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_urbana <- rdrobust(df$per_populacao_urbana, df$X, bwselect = "mserd", kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_homens <- rdrobust(df$per_populacao_homens, df$X, bwselect = "mserd", kernel = 'uniform', subset = amostra, covs = covsZ)
pct_desp_recp_saude_mun <- rdrobust(df$pct_desp_recp_saude_mun, df$X, bwselect = "mserd", kernel = 'uniform', subset = amostra, covs = covsZ)
tx_med_ch <- rdrobust(df$tx_med_ch, df$X, bwselect = "mserd", kernel = 'uniform', subset = amostra, covs = covsZ)
cob_esf <- rdrobust(df$cob_esf, df$X, bwselect = "mserd", kernel = 'uniform', subset = amostra, covs = covsZ)
tx_leito_sus <- rdrobust(df$tx_leito_sus, df$X, bwselect = "mserd", kernel = 'uniform', subset = amostra, covs = covsZ)
ideology_2018 <- rdrobust(df$ideology_2018, df$X, bwselect = "mserd", kernel = 'uniform', subset = amostra, covs = covsZ)



models <- list("Analfabetismo" = taxa_analfabetismo_18_mais,
               "Gini" = indice_gini,
               "Renda PC" = renda_pc,
               "População 2010" = populacao_2010,
               "Idhm" = idhm,
               "% Pop. Urb." = per_populacao_urbana,
               "% Pop. Hom." = per_populacao_homens,
               "% de Saúde na Despesa Total" = pct_desp_recp_saude_mun,
               "Médicos por 1k habitantes" = tx_med_ch,
               "Cobertura Est. Saúde da Família" = cob_esf,
               "Leitos SUS por 100k habitantes" = tx_leito_sus,
               "Ideologia" = ideology_2018)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Baseline Characteristis (mserd optimal bandwidth)")

covsZ = cbind(df$reeleito, df$tenure, df$mulher)

r1 = rdrobust(df$Y_cases, df$X, bwselect = 'mserd', kernel = 'uniform', subset = amostra, covs = covsZ)
r2 = rdrobust(df$Y_hosp, df$X, bwselect = 'mserd', kernel = 'uniform', subset = amostra, covs = covsZ)
r3 = rdrobust(df$Y_deaths_sivep, df$X, bwselect = 'mserd', kernel = 'uniform', subset = amostra, covs = covsZ)
r4 = rdrobust(df$per_vacinados, df$X, bwselect = 'mserd', kernel = 'uniform', subset = amostra, covs = covsZ)

models <- list("Cases" = r1,
               "Hospitalizations" = r2,
               "Deaths" = r3,
               "Vaccine_rate" = r4)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Impact of STEM Candidate Elected in 2016 on COVID-19 Epidemiological Outcomes per 100k inhabitants in 2021 — RD estimates without controls")

#### 3% ------------------------------------------------------------------


janela = 0.03
amostra = c(df$coorte == 2016)
covsZ = cbind()

taxa_analfabetismo_18_mais <- rdrobust(df$taxa_analfabetismo_18_mais, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
indice_gini <- rdrobust(df$indice_gini, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
renda_pc <- rdrobust(df$renda_pc, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
populacao_2010 <- rdrobust(df$populacao_2010, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
idhm <- rdrobust(df$idhm, df$X,h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_urbana <- rdrobust(df$per_populacao_urbana, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_homens <- rdrobust(df$per_populacao_homens, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
pct_desp_recp_saude_mun <- rdrobust(df$pct_desp_recp_saude_mun, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
tx_med_ch <- rdrobust(df$tx_med_ch, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
cob_esf <- rdrobust(df$cob_esf, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
tx_leito_sus <- rdrobust(df$tx_leito_sus, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
ideology_2018 <- rdrobust(df$ideology_2018, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)



models <- list("Analfabetismo" = taxa_analfabetismo_18_mais,
               "Gini" = indice_gini,
               "Renda PC" = renda_pc,
               "População 2010" = populacao_2010,
               "Idhm" = idhm,
               "% Pop. Urb." = per_populacao_urbana,
               "% Pop. Hom." = per_populacao_homens,
               "% de Saúde na Despesa Total" = pct_desp_recp_saude_mun,
               "Médicos por 1k habitantes" = tx_med_ch,
               "Cobertura Est. Saúde da Família" = cob_esf,
               "Leitos SUS por 100k habitantes" = tx_leito_sus,
               "Ideologia" = ideology_2018)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Baseline Characteristis (3% bandwidth)")

covsZ = cbind(df$mulher, df$reeleito, df$tenure, df$populacao_2010)

r1 = rdrobust(df$Y_cases, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r2 = rdrobust(df$Y_hosp, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r3 = rdrobust(df$Y_deaths_sivep, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r4 = rdrobust(df$per_vacinados, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)

models <- list("Cases" = r1,
               "Hospitalizations" = r2,
               "Deaths" = r3,
               "Vaccine_rate" = r4)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Impact of STEM Candidate Elected in 2016 on COVID-19 Epidemiological Outcomes per 100k inhabitants in 2021 — RD estimates without controls")



#### 5% ------------------------------------------------------------------

janela = 0.05
covsZ = cbind()

taxa_analfabetismo_18_mais <- rdrobust(df$taxa_analfabetismo_18_mais, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
indice_gini <- rdrobust(df$indice_gini, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
renda_pc <- rdrobust(df$renda_pc, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
populacao_2010 <- rdrobust(df$populacao_2010, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
idhm <- rdrobust(df$idhm, df$X,h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_urbana <- rdrobust(df$per_populacao_urbana, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_homens <- rdrobust(df$per_populacao_homens, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
pct_desp_recp_saude_mun <- rdrobust(df$pct_desp_recp_saude_mun, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
tx_med_ch <- rdrobust(df$tx_med_ch, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
cob_esf <- rdrobust(df$cob_esf, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
tx_leito_sus <- rdrobust(df$tx_leito_sus, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
ideology_2018 <- rdrobust(df$ideology_2018, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)



models <- list("Analfabetismo" = taxa_analfabetismo_18_mais,
               "Gini" = indice_gini,
               "Renda PC" = renda_pc,
               "População 2010" = populacao_2010,
               "Idhm" = idhm,
               "% Pop. Urb." = per_populacao_urbana,
               "% Pop. Hom." = per_populacao_homens,
               "% de Saúde na Despesa Total" = pct_desp_recp_saude_mun,
               "Médicos por 1k habitantes" = tx_med_ch,
               "Cobertura Est. Saúde da Família" = cob_esf,
               "Leitos SUS por 100k habitantes" = tx_leito_sus,
               "Ideologia" = ideology_2018)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Baseline Characteristis (5% bandwidth)")



r1 = rdrobust(df$Y_cases, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r2 = rdrobust(df$Y_hosp, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r3 = rdrobust(df$Y_deaths_sivep, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r4 = rdrobust(df$per_vacinados, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)

models <- list("Cases" = r1,
               "Hospitalizations" = r2,
               "Deaths" = r3,
               "Vaccine_rate" = r4)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Impact of STEM Candidate Elected in 2016 on COVID-19 Epidemiological Outcomes per 100k inhabitants in 2021 — RD estimates without controls")


#### 7% ------------------------------------------------------------------

janela = 0.07
covsZ = cbind()

taxa_analfabetismo_18_mais <- rdrobust(df$taxa_analfabetismo_18_mais, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
indice_gini <- rdrobust(df$indice_gini, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
renda_pc <- rdrobust(df$renda_pc, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
populacao_2010 <- rdrobust(df$populacao_2010, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
idhm <- rdrobust(df$idhm, df$X,h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_urbana <- rdrobust(df$per_populacao_urbana, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_homens <- rdrobust(df$per_populacao_homens, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
pct_desp_recp_saude_mun <- rdrobust(df$pct_desp_recp_saude_mun, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
tx_med_ch <- rdrobust(df$tx_med_ch, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
cob_esf <- rdrobust(df$cob_esf, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
tx_leito_sus <- rdrobust(df$tx_leito_sus, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
ideology_2018 <- rdrobust(df$ideology_2018, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)



models <- list("Analfabetismo" = taxa_analfabetismo_18_mais,
               "Gini" = indice_gini,
               "Renda PC" = renda_pc,
               "População 2010" = populacao_2010,
               "Idhm" = idhm,
               "% Pop. Urb." = per_populacao_urbana,
               "% Pop. Hom." = per_populacao_homens,
               "% de Saúde na Despesa Total" = pct_desp_recp_saude_mun,
               "Médicos por 1k habitantes" = tx_med_ch,
               "Cobertura Est. Saúde da Família" = cob_esf,
               "Leitos SUS por 100k habitantes" = tx_leito_sus,
               "Ideologia" = ideology_2018)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Baseline Characteristis (mserd optimal bandwidth)")

covsZ = cbind(df$tenure, df$reeleito, df$mulher)

r1 = rdrobust(df$Y_cases, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r2 = rdrobust(df$Y_hosp, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r3 = rdrobust(df$Y_deaths_sivep, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r4 = rdrobust(df$per_vacinados, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)

models <- list("Cases" = r1,
               "Hospitalizations" = r2,
               "Deaths" = r3,
               "Vaccine_rate" = r4)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Impact of STEM Candidate Elected in 2016 on COVID-19 Epidemiological Outcomes per 100k inhabitants in 2021 — RD estimates without controls")


#### 9% ------------------------------------------------------------------

janela = 0.09
covsZ = cbind()

taxa_analfabetismo_18_mais <- rdrobust(df$taxa_analfabetismo_18_mais, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
indice_gini <- rdrobust(df$indice_gini, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
renda_pc <- rdrobust(df$renda_pc, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
populacao_2010 <- rdrobust(df$populacao_2010, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
idhm <- rdrobust(df$idhm, df$X,h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_urbana <- rdrobust(df$per_populacao_urbana, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_homens <- rdrobust(df$per_populacao_homens, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
pct_desp_recp_saude_mun <- rdrobust(df$pct_desp_recp_saude_mun, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
tx_med_ch <- rdrobust(df$tx_med_ch, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
cob_esf <- rdrobust(df$cob_esf, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
tx_leito_sus <- rdrobust(df$tx_leito_sus, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
ideology_2018 <- rdrobust(df$ideology_2018, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)



models <- list("Analfabetismo" = taxa_analfabetismo_18_mais,
               "Gini" = indice_gini,
               "Renda PC" = renda_pc,
               "População 2010" = populacao_2010,
               "Idhm" = idhm,
               "% Pop. Urb." = per_populacao_urbana,
               "% Pop. Hom." = per_populacao_homens,
               "% de Saúde na Despesa Total" = pct_desp_recp_saude_mun,
               "Médicos por 1k habitantes" = tx_med_ch,
               "Cobertura Est. Saúde da Família" = cob_esf,
               "Leitos SUS por 100k habitantes" = tx_leito_sus,
               "Ideologia" = ideology_2018)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Baseline Characteristis (mserd optimal bandwidth)")

covsZ = cbind()

r1 = rdrobust(df$Y_cases, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r2 = rdrobust(df$Y_hosp, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r3 = rdrobust(df$Y_deaths_sivep, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r4 = rdrobust(df$per_vacinados, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)

models <- list("Cases" = r1,
               "Hospitalizations" = r2,
               "Deaths" = r3,
               "Vaccine_rate" = r4)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Impact of STEM Candidate Elected in 2016 on COVID-19 Epidemiological Outcomes per 100k inhabitants in 2021 — RD estimates without controls")




## Com efeitos fixos (fixed) ---------------------------------------------


#### Optimal bandwidth ---------------------------------------------------
amostra = cbind(df$coorte == 2016)
covsZ = cbind(as.factor(df$sch_non_stem_cdt == 1))

taxa_analfabetismo_18_mais <- rdrobust(df$taxa_analfabetismo_18_mais, df$X, bwselect = "mserd", kernel = 'uniform', subset = amostra, covs = covsZ)
indice_gini <- rdrobust(df$indice_gini, df$X, bwselect = "mserd", kernel = 'uniform', subset = amostra, covs = covsZ)
renda_pc <- rdrobust(df$renda_pc, df$X, bwselect = "mserd", kernel = 'uniform', subset = amostra, covs = covsZ)
populacao_2010 <- rdrobust(df$populacao_2010, df$X, bwselect = "mserd", kernel = 'uniform', subset = amostra, covs = covsZ)
idhm <- rdrobust(df$idhm, df$X,bwselect = "mserd", kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_urbana <- rdrobust(df$per_populacao_urbana, df$X, bwselect = "mserd", kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_homens <- rdrobust(df$per_populacao_homens, df$X, bwselect = "mserd", kernel = 'uniform', subset = amostra, covs = covsZ)
pct_desp_recp_saude_mun <- rdrobust(df$pct_desp_recp_saude_mun, df$X, bwselect = "mserd", kernel = 'uniform', subset = amostra, covs = covsZ)
tx_med_ch <- rdrobust(df$tx_med_ch, df$X, bwselect = "mserd", kernel = 'uniform', subset = amostra, covs = covsZ)
cob_esf <- rdrobust(df$cob_esf, df$X, bwselect = "mserd", kernel = 'uniform', subset = amostra, covs = covsZ)
tx_leito_sus <- rdrobust(df$tx_leito_sus, df$X, bwselect = "mserd", kernel = 'uniform', subset = amostra, covs = covsZ)
ideology_2018 <- rdrobust(df$ideology_2018, df$X, bwselect = "mserd", kernel = 'uniform', subset = amostra, covs = covsZ)



models <- list("Analfabetismo" = taxa_analfabetismo_18_mais,
               "Gini" = indice_gini,
               "Renda PC" = renda_pc,
               "População 2010" = populacao_2010,
               "Idhm" = idhm,
               "% Pop. Urb." = per_populacao_urbana,
               "% Pop. Hom." = per_populacao_homens,
               "% de Saúde na Despesa Total" = pct_desp_recp_saude_mun,
               "Médicos por 1k habitantes" = tx_med_ch,
               "Cobertura Est. Saúde da Família" = cob_esf,
               "Leitos SUS por 100k habitantes" = tx_leito_sus,
               "Ideologia" = ideology_2018)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Baseline Characteristis (mserd optimal bandwidth)")

covsZ = cbind()

r1 = rdrobust(df$Y_cases, df$X, bwselect = 'mserd', kernel = 'uniform', subset = amostra, covs = covsZ)
r2 = rdrobust(df$Y_hosp, df$X, bwselect = 'mserd', kernel = 'uniform', subset = amostra, covs = covsZ)
r3 = rdrobust(df$Y_deaths_sivep, df$X, bwselect = 'mserd', kernel = 'uniform', subset = amostra, covs = covsZ)
r4 = rdrobust(df$per_vacinados, df$X, bwselect = 'mserd', kernel = 'uniform', subset = amostra, covs = covsZ)

models <- list("Cases" = r1,
               "Hospitalizations" = r2,
               "Deaths" = r3,
               "Vaccine_rate" = r4)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Impact of STEM Candidate Elected in 2016 on COVID-19 Epidemiological Outcomes per 100k inhabitants in 2021 — RD estimates with controls")




#### 3% ------------------------------------------------------------------

covsZ = fixed

janela = 0.03

taxa_analfabetismo_18_mais <- rdrobust(df$taxa_analfabetismo_18_mais, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
indice_gini <- rdrobust(df$indice_gini, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
renda_pc <- rdrobust(df$renda_pc, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
populacao_2010 <- rdrobust(df$populacao_2010, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
idhm <- rdrobust(df$idhm, df$X,h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_urbana <- rdrobust(df$per_populacao_urbana, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_homens <- rdrobust(df$per_populacao_homens, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
pct_desp_recp_saude_mun <- rdrobust(df$pct_desp_recp_saude_mun, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
tx_med_ch <- rdrobust(df$tx_med_ch, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
cob_esf <- rdrobust(df$cob_esf, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
tx_leito_sus <- rdrobust(df$tx_leito_sus, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
ideology_2018 <- rdrobust(df$ideology_2018, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)



models <- list("Analfabetismo" = taxa_analfabetismo_18_mais,
               "Gini" = indice_gini,
               "Renda PC" = renda_pc,
               "População 2010" = populacao_2010,
               "Idhm" = idhm,
               "% Pop. Urb." = per_populacao_urbana,
               "% Pop. Hom." = per_populacao_homens,
               "% de Saúde na Despesa Total" = pct_desp_recp_saude_mun,
               "Médicos por 1k habitantes" = tx_med_ch,
               "Cobertura Est. Saúde da Família" = cob_esf,
               "Leitos SUS por 100k habitantes" = tx_leito_sus,
               "Ideologia" = ideology_2018)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Baseline Characteristis (3% bandwidth)")

covsZ = cbind(fixed, df$indice_gini, df$populacao_2010, df$per_populacao_homens, df$tx_med_ch)

r1 = rdrobust(df$Y_cases, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r2 = rdrobust(df$Y_hosp, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r3 = rdrobust(df$Y_deaths_sivep, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r4 = rdrobust(df$per_vacinados, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)

models <- list("Cases" = r1,
               "Hospitalizations" = r2,
               "Deaths" = r3,
               "Vaccine_rate" = r4)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Impact of STEM Candidate Elected in 2016 on COVID-19 Epidemiological Outcomes per 100k inhabitants in 2021 — RD estimates without controls")



#### 5% ------------------------------------------------------------------

covsZ = fixed
janela = 0.05

taxa_analfabetismo_18_mais <- rdrobust(df$taxa_analfabetismo_18_mais, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
indice_gini <- rdrobust(df$indice_gini, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
renda_pc <- rdrobust(df$renda_pc, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
populacao_2010 <- rdrobust(df$populacao_2010, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
idhm <- rdrobust(df$idhm, df$X,h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_urbana <- rdrobust(df$per_populacao_urbana, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_homens <- rdrobust(df$per_populacao_homens, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
pct_desp_recp_saude_mun <- rdrobust(df$pct_desp_recp_saude_mun, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
tx_med_ch <- rdrobust(df$tx_med_ch, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
cob_esf <- rdrobust(df$cob_esf, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
tx_leito_sus <- rdrobust(df$tx_leito_sus, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
ideology_2018 <- rdrobust(df$ideology_2018, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)



models <- list("Analfabetismo" = taxa_analfabetismo_18_mais,
               "Gini" = indice_gini,
               "Renda PC" = renda_pc,
               "População 2010" = populacao_2010,
               "Idhm" = idhm,
               "% Pop. Urb." = per_populacao_urbana,
               "% Pop. Hom." = per_populacao_homens,
               "% de Saúde na Despesa Total" = pct_desp_recp_saude_mun,
               "Médicos por 1k habitantes" = tx_med_ch,
               "Cobertura Est. Saúde da Família" = cob_esf,
               "Leitos SUS por 100k habitantes" = tx_leito_sus,
               "Ideologia" = ideology_2018)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Baseline Characteristis (mserd optimal bandwidth)")

covsZ = cbind(fixed, df$populacao_2010, df$per_populacao_urbana, df$per_populacao_homens, df$cob_esf, df$ideology_2018)

r1 = rdrobust(df$Y_cases, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r2 = rdrobust(df$Y_hosp, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r3 = rdrobust(df$Y_deaths_sivep, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r4 = rdrobust(df$per_vacinados, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)

models <- list("Cases" = r1,
               "Hospitalizations" = r2,
               "Deaths" = r3,
               "Vaccine_rate" = r4)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Impact of STEM Candidate Elected in 2016 on COVID-19 Epidemiological Outcomes per 100k inhabitants in 2021 — RD estimates without controls")


#### 7% ------------------------------------------------------------------
covsZ = fixed
janela = 0.07

taxa_analfabetismo_18_mais <- rdrobust(df$taxa_analfabetismo_18_mais, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
indice_gini <- rdrobust(df$indice_gini, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
renda_pc <- rdrobust(df$renda_pc, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
populacao_2010 <- rdrobust(df$populacao_2010, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
idhm <- rdrobust(df$idhm, df$X,h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_urbana <- rdrobust(df$per_populacao_urbana, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_homens <- rdrobust(df$per_populacao_homens, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
pct_desp_recp_saude_mun <- rdrobust(df$pct_desp_recp_saude_mun, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
tx_med_ch <- rdrobust(df$tx_med_ch, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
cob_esf <- rdrobust(df$cob_esf, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
tx_leito_sus <- rdrobust(df$tx_leito_sus, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
ideology_2018 <- rdrobust(df$ideology_2018, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)



models <- list("Analfabetismo" = taxa_analfabetismo_18_mais,
               "Gini" = indice_gini,
               "Renda PC" = renda_pc,
               "População 2010" = populacao_2010,
               "Idhm" = idhm,
               "% Pop. Urb." = per_populacao_urbana,
               "% Pop. Hom." = per_populacao_homens,
               "% de Saúde na Despesa Total" = pct_desp_recp_saude_mun,
               "Médicos por 1k habitantes" = tx_med_ch,
               "Cobertura Est. Saúde da Família" = cob_esf,
               "Leitos SUS por 100k habitantes" = tx_leito_sus,
               "Ideologia" = ideology_2018)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Baseline Characteristis (mserd optimal bandwidth)")

covsZ = cbind(fixed, df$tx_leito_sus)

r1 = rdrobust(df$Y_cases, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r2 = rdrobust(df$Y_hosp, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r3 = rdrobust(df$Y_deaths_sivep, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r4 = rdrobust(df$per_vacinados, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)

models <- list("Cases" = r1,
               "Hospitalizations" = r2,
               "Deaths" = r3,
               "Vaccine_rate" = r4)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Impact of STEM Candidate Elected in 2016 on COVID-19 Epidemiological Outcomes per 100k inhabitants in 2021 — RD estimates without controls")


#### 9% ------------------------------------------------------------------

janela = 0.09

taxa_analfabetismo_18_mais <- rdrobust(df$taxa_analfabetismo_18_mais, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
indice_gini <- rdrobust(df$indice_gini, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
renda_pc <- rdrobust(df$renda_pc, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
populacao_2010 <- rdrobust(df$populacao_2010, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
idhm <- rdrobust(df$idhm, df$X,h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_urbana <- rdrobust(df$per_populacao_urbana, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_homens <- rdrobust(df$per_populacao_homens, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
pct_desp_recp_saude_mun <- rdrobust(df$pct_desp_recp_saude_mun, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
tx_med_ch <- rdrobust(df$tx_med_ch, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
cob_esf <- rdrobust(df$cob_esf, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
tx_leito_sus <- rdrobust(df$tx_leito_sus, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
ideology_2018 <- rdrobust(df$ideology_2018, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)



models <- list("Analfabetismo" = taxa_analfabetismo_18_mais,
               "Gini" = indice_gini,
               "Renda PC" = renda_pc,
               "População 2010" = populacao_2010,
               "Idhm" = idhm,
               "% Pop. Urb." = per_populacao_urbana,
               "% Pop. Hom." = per_populacao_homens,
               "% de Saúde na Despesa Total" = pct_desp_recp_saude_mun,
               "Médicos por 1k habitantes" = tx_med_ch,
               "Cobertura Est. Saúde da Família" = cob_esf,
               "Leitos SUS por 100k habitantes" = tx_leito_sus,
               "Ideologia" = ideology_2018)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Baseline Characteristis (mserd optimal bandwidth)")



r1 = rdrobust(df$Y_cases, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r2 = rdrobust(df$Y_hosp, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r3 = rdrobust(df$Y_deaths_sivep, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r4 = rdrobust(df$per_vacinados, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)

models <- list("Cases" = r1,
               "Hospitalizations" = r2,
               "Deaths" = r3,
               "Vaccine_rate" = r4)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Impact of STEM Candidate Elected in 2016 on COVID-19 Epidemiological Outcomes per 100k inhabitants in 2021 — RD estimates without controls")



# Restringindo a amostra ao invés de usar controles -----------------------

df <- df %>% 
  filter(ens_sup == 1 & coorte == 2016 & sch_non_stem_cdt == 1)


amostra <- cbind(df$ens_sup == 1 & df$coorte == 2016 & df$sch_non_stem_cdt == 1)
poli = 1
covsZ = cbind()

df$pop_maior_200k = ifelse(df$populacao_2010 >= 200000, 1, 0)




estados = unique(df$sigla_uf)


#df$SP <- ifelse(df$sigla_uf == 'SP', 1, 0)
df$MG <- ifelse(df$sigla_uf == 'MG', 1, 0)
df$ES <- ifelse(df$sigla_uf == 'ES', 1, 0)
df$GO <- ifelse(df$sigla_uf == 'GO', 1, 0)
df$PI <- ifelse(df$sigla_uf == 'PI', 1, 0)
df$MA <- ifelse(df$sigla_uf == 'MA', 1, 0)
df$RJ <- ifelse(df$sigla_uf == 'RJ', 1, 0)
df$RO <- ifelse(df$sigla_uf == 'RO', 1, 0)
df$RS <- ifelse(df$sigla_uf == 'RS', 1, 0)
df$RN <- ifelse(df$sigla_uf == 'RN', 1, 0)
df$PB <- ifelse(df$sigla_uf == 'PB', 1, 0)
df$PR <- ifelse(df$sigla_uf == 'PR', 1, 0)
df$BA <- ifelse(df$sigla_uf == 'BA', 1, 0)
df$PE <- ifelse(df$sigla_uf == 'PE', 1, 0)
df$PA <- ifelse(df$sigla_uf == 'PA', 1, 0)
df$CE <- ifelse(df$sigla_uf == 'CE', 1, 0)
df$SC <- ifelse(df$sigla_uf == 'SC', 1, 0)
df$MT <- ifelse(df$sigla_uf == 'MT', 1, 0)
df$SE <- ifelse(df$sigla_uf == 'SE', 1, 0)
df$AC <- ifelse(df$sigla_uf == 'AC', 1, 0)
df$MS <- ifelse(df$sigla_uf == 'MS', 1, 0)
df$AL <- ifelse(df$sigla_uf == 'AL', 1, 0)
df$TO <- ifelse(df$sigla_uf == 'TO', 1, 0)
df$RR <- ifelse(df$sigla_uf == 'RR', 1, 0)
df$AP <- ifelse(df$sigla_uf == 'AP', 1, 0)

fixed = cbind(#df$SP,
              df$MG,
              df$ES,
              df$GO,
              df$PI,
              df$MA,
              df$RJ,
              df$RO,
              df$RS,
              df$RN,
              df$PB,
              df$PR,
              df$BA,
              df$PE,
              df$PA,
              df$CE,
              df$SC,
              df$MT,
              df$SE,
              df$AC,
              df$MS,
              df$AL,
              df$TO,
              df$RR,
              df$AP)

state.f = factor(df$sigla_uf[df$ens_sup == 1 & df$coorte == 2016 & df$sch_non_stem_cdt == 1])

state.d = model.matrix(~state.f+0)


### Sem efeitos fixos ----------------------------------------------------

mulher <- rdrobust(df$mulher, df$X, p = poli,  subset = amostra, covs = covsZ)
summary(mulher)

reeleito <- rdrobust(df$reeleito, df$X, p = poli, h = janela,  subset = amostra, covs = covsZ)
summary(reeleito)

idade <- rdrobust(df$idade, df$X, p = poli,  subset = amostra, covs = covsZ)
summary(idade)


#### Optimal bandwidth mágica ---------------------------------------------------

covsZ = cbind()
poli = 1

taxa_analfabetismo_18_mais <- rdrobust(df$taxa_analfabetismo_18_mais, df$X, p = poli, bwselect = "mserd",  subset = amostra, covs = covsZ)
indice_gini <- rdrobust(df$indice_gini, df$X, p = poli,bwselect = "mserd",  subset = amostra, covs = covsZ)
renda_pc <- rdrobust(df$renda_pc, df$X, p = poli,bwselect = "mserd",  subset = amostra, covs = covsZ)
populacao_2010 <- rdrobust(df$populacao_2010, df$X, p = poli,bwselect = "mserd",  subset = amostra, covs = covsZ)
idhm <- rdrobust(df$idhm, df$X, p = poli,bwselect = "mserd",  subset = amostra, covs = covsZ)
per_populacao_urbana <- rdrobust(df$per_populacao_urbana, df$X, p = poli,bwselect = "mserd",  subset = amostra, covs = covsZ)
per_populacao_homens <- rdrobust(df$per_populacao_homens, df$X, p = poli,bwselect = "mserd",  subset = amostra, covs = covsZ)
pct_desp_recp_saude_mun <- rdrobust(df$pct_desp_recp_saude_mun, df$X, p = poli,bwselect = "mserd",  subset = amostra, covs = covsZ)
tx_med_ch <- rdrobust(df$tx_med_ch, df$X, p = poli,bwselect = "mserd",  subset = amostra, covs = covsZ)
cob_esf <- rdrobust(df$cob_esf, df$X, p = poli,bwselect = "mserd",  subset = amostra, covs = covsZ)
tx_leito_sus <- rdrobust(df$tx_leito_sus, df$X, p = poli,bwselect = "mserd",  subset = amostra, covs = covsZ)
ideology_2018 <- rdrobust(df$ideology_2018, df$X, p = poli,bwselect = "mserd",  subset = amostra, covs = covsZ)



models <- list("Analfabetismo" = taxa_analfabetismo_18_mais,
               "Gini" = indice_gini,
               "Renda PC" = renda_pc,
               "População 2010" = populacao_2010,
               "Idhm" = idhm,
               "% Pop. Urb." = per_populacao_urbana,
               "% Pop. Hom." = per_populacao_homens,
               "% de Saúde na Despesa Total" = pct_desp_recp_saude_mun,
               "Médicos por 1k habitantes" = tx_med_ch,
               "Cobertura Est. Saúde da Família" = cob_esf,
               "Leitos SUS por 100k habitantes" = tx_leito_sus,
               "Ideologia" = ideology_2018)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Baseline Characteristis (mserd optimal bandwidth)")



covsZ = cbind() 
poli = 1

r2 = rdrobust(df$Y_hosp, df$X, p = poli, kernel = "uniform",   bwselect = "mserd", subset = amostra, covs = covsZ)
r3 = rdrobust(df$Y_deaths_sivep, df$X, kernel = "uniform",   bwselect = "mserd", p = poli,  subset = amostra, covs = covsZ)


poli = 2

r3 = rdrobust(df$Y_hosp, df$X, p = poli, kernel = "uniform",   bwselect = "mserd", subset = amostra, covs = covsZ)
r4 = rdrobust(df$Y_deaths_sivep, df$X, kernel = "uniform",   bwselect = "mserd", p = poli,  subset = amostra, covs = covsZ)



models <- list(
               "Hospitalizations" = r2,
               "Deaths" = r3,
               "Hospitalizations" = r4,
               "Deaths" = r5)

teste <- modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             output = "gt",
             title = "Impact of STEM Candidate Elected in 2016 on COVID-19 Epidemiological Outcomes per 100k inhabitants in 2020 — RD estimates without controls")

library(gt)
teste %>%
  tab_spanner(label = "Linear", columns = 2:3) %>% 
  tab_spanner(label = "Quadratic", columns = 4:5)
  

## mecanismo

covsZ = cbind(df$tenure)
poli = 1

r1 = rdrobust(df$total_nfi, df$X, p = poli, bwselect = "mserd",  subset = amostra, covs = covsZ)
r2 = rdrobust(df$mascaras, df$X, p = poli, bwselect = "mserd",  subset = amostra, covs = covsZ)
r3 = rdrobust(df$restricao_atv_nao_essenciais, df$X, p = poli, bwselect = "mserd",  subset = amostra, covs = covsZ)
r4 = rdrobust(df$restricao_circulacao, df$X, p = poli, bwselect = "mserd",  subset = amostra, covs = covsZ)
r5 = rdrobust(df$restricao_transporte_publico, df$X, p = poli, bwselect = "mserd",  subset = amostra, covs = covsZ)
r6 = rdrobust(df$barreiras_sanitarias, df$X, p = poli, bwselect = "mserd",  subset = amostra, covs = covsZ)


models <- list("Total NFI" = r1,
               "Masks" = r2,
               "Restrictions atv." = r3,
               "Restrictions circu." = r4,
               "Restrictions transp." = r5,
               "Sani barriers" = r6)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Impact of STEM Candidate Elected in 2016 on COVID-19 Epidemiological Outcomes per 100k inhabitants in 2021 — RD estimates without controls")


## controlando mecanismo



covsZ = cbind(df$tenure, df$barreiras_sanitarias, df$mascaras) 
poli = 1

r1 = rdrobust(df$Y_cases, df$X, p = poli,  bwselect = "mserd",  subset = amostra, covs = covsZ)
r2 = rdrobust(df$Y_hosp, df$X, p = poli,  bwselect = "mserd",subset = amostra, covs = covsZ)
r3 = rdrobust(df$Y_deaths_sivep, df$X,  bwselect = "mserd", p = poli,  subset = amostra, covs = covsZ)
r4 = rdrobust(df$per_vacinados, df$X,  bwselect = "mserd", p = poli,  subset = amostra, covs = covsZ)

models <- list("Cases" = r1,
               "Hospitalizations" = r2,
               "Deaths" = r3,
               "Vaccine_rate" = r4)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Impact of STEM Candidate Elected in 2016 on COVID-19 Epidemiological Outcomes per 100k inhabitants in 2021 — RD estimates without controls")






#### 3% ------------------------------------------------------------------


janela = 0.03
covsZ = cbind()

taxa_analfabetismo_18_mais <- rdrobust(df$taxa_analfabetismo_18_mais, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
indice_gini <- rdrobust(df$indice_gini, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
renda_pc <- rdrobust(df$renda_pc, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
populacao_2010 <- rdrobust(df$populacao_2010, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
idhm <- rdrobust(df$idhm, df$X,h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_urbana <- rdrobust(df$per_populacao_urbana, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_homens <- rdrobust(df$per_populacao_homens, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
pct_desp_recp_saude_mun <- rdrobust(df$pct_desp_recp_saude_mun, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
tx_med_ch <- rdrobust(df$tx_med_ch, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
cob_esf <- rdrobust(df$cob_esf, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
tx_leito_sus <- rdrobust(df$tx_leito_sus, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
ideology_2018 <- rdrobust(df$ideology_2018, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)



models <- list("Analfabetismo" = taxa_analfabetismo_18_mais,
               "Gini" = indice_gini,
               "Renda PC" = renda_pc,
               "População 2010" = populacao_2010,
               "Idhm" = idhm,
               "% Pop. Urb." = per_populacao_urbana,
               "% Pop. Hom." = per_populacao_homens,
               "% de Saúde na Despesa Total" = pct_desp_recp_saude_mun,
               "Médicos por 1k habitantes" = tx_med_ch,
               "Cobertura Est. Saúde da Família" = cob_esf,
               "Leitos SUS por 100k habitantes" = tx_leito_sus,
               "Ideologia" = ideology_2018)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Baseline Characteristis (3% bandwidth)")


covsZ = cbind(df$tenure, df$pop_maior_200k) 

r1 = rdrobust(df$Y_cases, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r2 = rdrobust(df$Y_hosp, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r3 = rdrobust(df$Y_deaths_sivep, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r4 = rdrobust(df$per_vacinados, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)

models <- list("Cases" = r1,
               "Hospitalizations" = r2,
               "Deaths" = r3,
               "Vaccine_rate" = r4)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Impact of STEM Candidate Elected in 2016 on COVID-19 Epidemiological Outcomes per 100k inhabitants in 2021 — RD estimates without controls")



covsZ = cbind(df$tenure, df$pop_maior_200k) 

r1 = rdrobust(df$total_nfi, h = janela, df$X, p = poli,  subset = amostra, covs = covsZ)
r2 = rdrobust(df$mascaras, df$X, h = janela,  p = poli,  subset = amostra, covs = covsZ)
r3 = rdrobust(df$restricao_atv_nao_essenciais, df$X, h = janela,  p = poli,  subset = amostra, covs = covsZ)
r4 = rdrobust(df$restricao_circulacao, df$X, h = janela,  p = poli,  subset = amostra, covs = covsZ)
r5 = rdrobust(df$restricao_transporte_publico, df$X, h = janela,  p = poli,  subset = amostra, covs = covsZ)
r6 = rdrobust(df$barreiras_sanitarias, df$X, h = janela,  p = poli,  subset = amostra, covs = covsZ)


models <- list("Total NFI" = r1,
               "Masks" = r2,
               "Restrictions atv." = r3,
               "Restrictions circu." = r4,
               "Restrictions transp." = r5,
               "Sani barriers" = r6)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Impact of STEM Candidate Elected in 2016 on COVID-19 Epidemiological Outcomes per 100k inhabitants in 2021 — RD estimates without controls")




#### 4% mágica ------------------------------------------------------------------

janela = 0.04
covsZ = cbind()
poli = 1

taxa_analfabetismo_18_mais <- rdrobust(df$taxa_analfabetismo_18_mais, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
indice_gini <- rdrobust(df$indice_gini, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
renda_pc <- rdrobust(df$renda_pc, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
populacao_2010 <- rdrobust(df$populacao_2010, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
idhm <- rdrobust(df$idhm, df$X,h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_urbana <- rdrobust(df$per_populacao_urbana, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_homens <- rdrobust(df$per_populacao_homens, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
pct_desp_recp_saude_mun <- rdrobust(df$pct_desp_recp_saude_mun, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
tx_med_ch <- rdrobust(df$tx_med_ch, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
cob_esf <- rdrobust(df$cob_esf, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
tx_leito_sus <- rdrobust(df$tx_leito_sus, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
ideology_2018 <- rdrobust(df$ideology_2018, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)



models <- list("Analfabetismo" = taxa_analfabetismo_18_mais,
               "Gini" = indice_gini,
               "Renda PC" = renda_pc,
               "População 2010" = populacao_2010,
               "Idhm" = idhm,
               "% Pop. Urb." = per_populacao_urbana,
               "% Pop. Hom." = per_populacao_homens,
               "% de Saúde na Despesa Total" = pct_desp_recp_saude_mun,
               "Médicos por 1k habitantes" = tx_med_ch,
               "Cobertura Est. Saúde da Família" = cob_esf,
               "Leitos SUS por 100k habitantes" = tx_leito_sus,
               "Ideologia" = ideology_2018)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Baseline Characteristis (5% bandwidth)")


covsZ = cbind(df$tenure, df$pop_maior_200k)

r1 = rdrobust(df$Y_cases, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r2 = rdrobust(df$Y_hosp, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r3 = rdrobust(df$Y_deaths_sivep, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r4 = rdrobust(df$per_vacinados, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)

models <- list("Cases" = r1,
               "Hospitalizations" = r2,
               "Deaths" = r3,
               "Vaccine_rate" = r4)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Impact of STEM Candidate Elected in 2016 on COVID-19 Epidemiological Outcomes per 100k inhabitants in 2021 — RD estimates without controls")



covsZ = cbind(df$tenure, df$pop_maior_200k) 

r1 = rdrobust(df$total_nfi, h = janela, df$X, p = poli,  subset = amostra, covs = covsZ)
r2 = rdrobust(df$mascaras, df$X, h = janela,  p = poli,  subset = amostra, covs = covsZ)
r3 = rdrobust(df$restricao_atv_nao_essenciais, df$X, h = janela,  p = poli,  subset = amostra, covs = covsZ)
r4 = rdrobust(df$restricao_circulacao, df$X, h = janela,  p = poli,  subset = amostra, covs = covsZ)
r5 = rdrobust(df$restricao_transporte_publico, df$X, h = janela,  p = poli,  subset = amostra, covs = covsZ)
r6 = rdrobust(df$barreiras_sanitarias, df$X, h = janela,  p = poli,  subset = amostra, covs = covsZ)


models <- list("Total NFI" = r1,
               "Masks" = r2,
               "Restrictions atv." = r3,
               "Restrictions circu." = r4,
               "Restrictions transp." = r5,
               "Sani barriers" = r6)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Impact of STEM Candidate Elected in 2016 on COVID-19 Epidemiological Outcomes per 100k inhabitants in 2021 — RD estimates without controls")




#### 5% mágica ------------------------------------------------------------------

janela = 0.05
covsZ = cbind()

taxa_analfabetismo_18_mais <- rdrobust(df$taxa_analfabetismo_18_mais, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
indice_gini <- rdrobust(df$indice_gini, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
renda_pc <- rdrobust(df$renda_pc, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
populacao_2010 <- rdrobust(df$populacao_2010, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
idhm <- rdrobust(df$idhm, df$X,h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_urbana <- rdrobust(df$per_populacao_urbana, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_homens <- rdrobust(df$per_populacao_homens, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
pct_desp_recp_saude_mun <- rdrobust(df$pct_desp_recp_saude_mun, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
tx_med_ch <- rdrobust(df$tx_med_ch, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
cob_esf <- rdrobust(df$cob_esf, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
tx_leito_sus <- rdrobust(df$tx_leito_sus, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
ideology_2018 <- rdrobust(df$ideology_2018, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)



models <- list("Analfabetismo" = taxa_analfabetismo_18_mais,
               "Gini" = indice_gini,
               "Renda PC" = renda_pc,
               "População 2010" = populacao_2010,
               "Idhm" = idhm,
               "% Pop. Urb." = per_populacao_urbana,
               "% Pop. Hom." = per_populacao_homens,
               "% de Saúde na Despesa Total" = pct_desp_recp_saude_mun,
               "Médicos por 1k habitantes" = tx_med_ch,
               "Cobertura Est. Saúde da Família" = cob_esf,
               "Leitos SUS por 100k habitantes" = tx_leito_sus,
               "Ideologia" = ideology_2018)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Baseline Characteristis (mserd optimal bandwidth)")

covsZ = cbind(df$tenure, df$indice_gini, df$pop_maior_200k)

r1 = rdrobust(df$Y_cases, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r2 = rdrobust(df$Y_hosp, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r3 = rdrobust(df$Y_deaths_sivep, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r4 = rdrobust(df$per_vacinados, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)

models <- list("Cases" = r1,
               "Hospitalizations" = r2,
               "Deaths" = r3,
               "Vaccine_rate" = r4)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Impact of STEM Candidate Elected in 2016 on COVID-19 Epidemiological Outcomes per 100k inhabitants in 2021 — RD estimates without controls")



covsZ = cbind(df$tenure, df$indice_gini, df$pop_maior_200k) 

r1 = rdrobust(df$total_nfi, h = janela, df$X, p = poli,  subset = amostra, covs = covsZ)
r2 = rdrobust(df$mascaras, df$X, h = janela,  p = poli,  subset = amostra, covs = covsZ)
r3 = rdrobust(df$restricao_atv_nao_essenciais, df$X, h = janela,  p = poli,  subset = amostra, covs = covsZ)
r4 = rdrobust(df$restricao_circulacao, df$X, h = janela,  p = poli,  subset = amostra, covs = covsZ)
r5 = rdrobust(df$restricao_transporte_publico, df$X, h = janela,  p = poli,  subset = amostra, covs = covsZ)
r6 = rdrobust(df$barreiras_sanitarias, df$X, h = janela,  p = poli,  subset = amostra, covs = covsZ)


models <- list("Total NFI" = r1,
               "Masks" = r2,
               "Restrictions atv." = r3,
               "Restrictions circu." = r4,
               "Restrictions transp." = r5,
               "Sani barriers" = r6)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Impact of STEM Candidate Elected in 2016 on COVID-19 Epidemiological Outcomes per 100k inhabitants in 2021 — RD estimates without controls")


#### 6% mágica ------------------------------------------------------------------

janela = 0.06
covsZ = cbind()

taxa_analfabetismo_18_mais <- rdrobust(df$taxa_analfabetismo_18_mais, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
indice_gini <- rdrobust(df$indice_gini, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
renda_pc <- rdrobust(df$renda_pc, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
populacao_2010 <- rdrobust(df$populacao_2010, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
idhm <- rdrobust(df$idhm, df$X,h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_urbana <- rdrobust(df$per_populacao_urbana, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_homens <- rdrobust(df$per_populacao_homens, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
pct_desp_recp_saude_mun <- rdrobust(df$pct_desp_recp_saude_mun, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
tx_med_ch <- rdrobust(df$tx_med_ch, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
cob_esf <- rdrobust(df$cob_esf, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
tx_leito_sus <- rdrobust(df$tx_leito_sus, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
ideology_2018 <- rdrobust(df$ideology_2018, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)



models <- list("Analfabetismo" = taxa_analfabetismo_18_mais,
               "Gini" = indice_gini,
               "Renda PC" = renda_pc,
               "População 2010" = populacao_2010,
               "Idhm" = idhm,
               "% Pop. Urb." = per_populacao_urbana,
               "% Pop. Hom." = per_populacao_homens,
               "% de Saúde na Despesa Total" = pct_desp_recp_saude_mun,
               "Médicos por 1k habitantes" = tx_med_ch,
               "Cobertura Est. Saúde da Família" = cob_esf,
               "Leitos SUS por 100k habitantes" = tx_leito_sus,
               "Ideologia" = ideology_2018)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Baseline Characteristis (mserd optimal bandwidth)")


covsZ = cbind(df$tenure, df$ideology_2018, df$pop_maior_200k)

r1 = rdrobust(df$Y_cases, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r2 = rdrobust(df$Y_hosp, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r3 = rdrobust(df$Y_deaths_sivep, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r4 = rdrobust(df$per_vacinados, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)

models <- list("Cases" = r1,
               "Hospitalizations" = r2,
               "Deaths" = r3,
               "Vaccine_rate" = r4)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Impact of STEM Candidate Elected in 2016 on COVID-19 Epidemiological Outcomes per 100k inhabitants in 2021 — RD estimates without controls")



covsZ = cbind(df$tenure, df$pop_maior_200k, df$ideology_2018) 

r1 = rdrobust(df$total_nfi, h = janela, df$X, p = poli,  subset = amostra, covs = covsZ)
r2 = rdrobust(df$mascaras, df$X, h = janela,  p = poli,  subset = amostra, covs = covsZ)
r3 = rdrobust(df$restricao_atv_nao_essenciais, df$X, h = janela,  p = poli,  subset = amostra, covs = covsZ)
r4 = rdrobust(df$restricao_circulacao, df$X, h = janela,  p = poli,  subset = amostra, covs = covsZ)
r5 = rdrobust(df$restricao_transporte_publico, df$X, h = janela,  p = poli,  subset = amostra, covs = covsZ)
r6 = rdrobust(df$barreiras_sanitarias, df$X, h = janela,  p = poli,  subset = amostra, covs = covsZ)


models <- list("Total NFI" = r1,
               "Masks" = r2,
               "Restrictions atv." = r3,
               "Restrictions circu." = r4,
               "Restrictions transp." = r5,
               "Sani barriers" = r6)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Impact of STEM Candidate Elected in 2016 on COVID-19 Epidemiological Outcomes per 100k inhabitants in 2021 — RD estimates without controls")



#### 7% mágica ------------------------------------------------------------------

janela = 0.07
covsZ = cbind()

taxa_analfabetismo_18_mais <- rdrobust(df$taxa_analfabetismo_18_mais, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
indice_gini <- rdrobust(df$indice_gini, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
renda_pc <- rdrobust(df$renda_pc, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
populacao_2010 <- rdrobust(df$populacao_2010, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
idhm <- rdrobust(df$idhm, df$X,h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_urbana <- rdrobust(df$per_populacao_urbana, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_homens <- rdrobust(df$per_populacao_homens, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
pct_desp_recp_saude_mun <- rdrobust(df$pct_desp_recp_saude_mun, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
tx_med_ch <- rdrobust(df$tx_med_ch, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
cob_esf <- rdrobust(df$cob_esf, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
tx_leito_sus <- rdrobust(df$tx_leito_sus, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
ideology_2018 <- rdrobust(df$ideology_2018, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)



models <- list("Analfabetismo" = taxa_analfabetismo_18_mais,
               "Gini" = indice_gini,
               "Renda PC" = renda_pc,
               "População 2010" = populacao_2010,
               "Idhm" = idhm,
               "% Pop. Urb." = per_populacao_urbana,
               "% Pop. Hom." = per_populacao_homens,
               "% de Saúde na Despesa Total" = pct_desp_recp_saude_mun,
               "Médicos por 1k habitantes" = tx_med_ch,
               "Cobertura Est. Saúde da Família" = cob_esf,
               "Leitos SUS por 100k habitantes" = tx_leito_sus,
               "Ideologia" = ideology_2018)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Baseline Characteristis (mserd optimal bandwidth)")

covsZ = cbind(df$tenure, df$ideology_2018, df$pop_maior_200k)

r1 = rdrobust(df$Y_cases, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r2 = rdrobust(df$Y_hosp, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r3 = rdrobust(df$Y_deaths_sivep, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r4 = rdrobust(df$per_vacinados, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)

models <- list("Cases" = r1,
               "Hospitalizations" = r2,
               "Deaths" = r3,
               "Vaccine_rate" = r4)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Impact of STEM Candidate Elected in 2016 on COVID-19 Epidemiological Outcomes per 100k inhabitants in 2021 — RD estimates without controls")



covsZ = cbind(df$tenure, df$reeleito, df$ideology_2018, df$pop_maior_200k) 

r1 = rdrobust(df$total_nfi, h = janela, df$X, p = poli,  subset = amostra, covs = covsZ)
r2 = rdrobust(df$mascaras, df$X, h = janela,  p = poli,  subset = amostra, covs = covsZ)
r3 = rdrobust(df$restricao_atv_nao_essenciais, df$X, h = janela,  p = poli,  subset = amostra, covs = covsZ)
r4 = rdrobust(df$restricao_circulacao, df$X, h = janela,  p = poli,  subset = amostra, covs = covsZ)
r5 = rdrobust(df$restricao_transporte_publico, df$X, h = janela,  p = poli,  subset = amostra, covs = covsZ)
r6 = rdrobust(df$barreiras_sanitarias, df$X, h = janela,  p = poli,  subset = amostra, covs = covsZ)


models <- list("Total NFI" = r1,
               "Masks" = r2,
               "Restrictions atv." = r3,
               "Restrictions circu." = r4,
               "Restrictions transp." = r5,
               "Sani barriers" = r6)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Impact of STEM Candidate Elected in 2016 on COVID-19 Epidemiological Outcomes per 100k inhabitants in 2021 — RD estimates without controls")



#### 8% mágica ------------------------------------------------------------------

janela = 0.08
covsZ = cbind()

taxa_analfabetismo_18_mais <- rdrobust(df$taxa_analfabetismo_18_mais, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
indice_gini <- rdrobust(df$indice_gini, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
renda_pc <- rdrobust(df$renda_pc, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
populacao_2010 <- rdrobust(df$populacao_2010, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
idhm <- rdrobust(df$idhm, df$X,h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_urbana <- rdrobust(df$per_populacao_urbana, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_homens <- rdrobust(df$per_populacao_homens, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
pct_desp_recp_saude_mun <- rdrobust(df$pct_desp_recp_saude_mun, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
tx_med_ch <- rdrobust(df$tx_med_ch, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
cob_esf <- rdrobust(df$cob_esf, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
tx_leito_sus <- rdrobust(df$tx_leito_sus, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
ideology_2018 <- rdrobust(df$ideology_2018, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)



models <- list("Analfabetismo" = taxa_analfabetismo_18_mais,
               "Gini" = indice_gini,
               "Renda PC" = renda_pc,
               "População 2010" = populacao_2010,
               "Idhm" = idhm,
               "% Pop. Urb." = per_populacao_urbana,
               "% Pop. Hom." = per_populacao_homens,
               "% de Saúde na Despesa Total" = pct_desp_recp_saude_mun,
               "Médicos por 1k habitantes" = tx_med_ch,
               "Cobertura Est. Saúde da Família" = cob_esf,
               "Leitos SUS por 100k habitantes" = tx_leito_sus,
               "Ideologia" = ideology_2018)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Baseline Characteristis (mserd optimal bandwidth)")

covsZ = cbind(df$tenure, df$pop_maior_200k)

r1 = rdrobust(df$Y_cases, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r2 = rdrobust(df$Y_hosp, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r3 = rdrobust(df$Y_deaths_sivep, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r4 = rdrobust(df$per_vacinados, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)

models <- list("Cases" = r1,
               "Hospitalizations" = r2,
               "Deaths" = r3,
               "Vaccine_rate" = r4)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Impact of STEM Candidate Elected in 2016 on COVID-19 Epidemiological Outcomes per 100k inhabitants in 2021 — RD estimates without controls")



covsZ = cbind(df$tenure, df$pop_maior_200k) 

r1 = rdrobust(df$total_nfi, h = janela, df$X, p = poli,  subset = amostra, covs = covsZ)
r2 = rdrobust(df$mascaras, df$X, h = janela,  p = poli,  subset = amostra, covs = covsZ)
r3 = rdrobust(df$restricao_atv_nao_essenciais, df$X, h = janela,  p = poli,  subset = amostra, covs = covsZ)
r4 = rdrobust(df$restricao_circulacao, df$X, h = janela,  p = poli,  subset = amostra, covs = covsZ)
r5 = rdrobust(df$restricao_transporte_publico, df$X, h = janela,  p = poli,  subset = amostra, covs = covsZ)
r6 = rdrobust(df$barreiras_sanitarias, df$X, h = janela,  p = poli,  subset = amostra, covs = covsZ)


models <- list("Total NFI" = r1,
               "Masks" = r2,
               "Restrictions atv." = r3,
               "Restrictions circu." = r4,
               "Restrictions transp." = r5,
               "Sani barriers" = r6)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Impact of STEM Candidate Elected in 2016 on COVID-19 Epidemiological Outcomes per 100k inhabitants in 2021 — RD estimates without controls")



#### 9% mágica ------------------------------------------------------------------

janela = 0.09
covsZ = cbind()
poli = 1

taxa_analfabetismo_18_mais <- rdrobust(df$taxa_analfabetismo_18_mais, df$X, h = janela, p = poli, kernel = 'uniform', subset = amostra, covs = covsZ)
indice_gini <- rdrobust(df$indice_gini, df$X, h = janela, p = poli, kernel = 'uniform', subset = amostra, covs = covsZ)
renda_pc <- rdrobust(df$renda_pc, df$X, h = janela, p = poli, kernel = 'uniform', subset = amostra, covs = covsZ)
populacao_2010 <- rdrobust(df$populacao_2010, df$X, h = janela, p = poli, kernel = 'uniform', subset = amostra, covs = covsZ)
idhm <- rdrobust(df$idhm, df$X,h = janela, p = poli, kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_urbana <- rdrobust(df$per_populacao_urbana, df$X, h = janela, p = poli, kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_homens <- rdrobust(df$per_populacao_homens, df$X, h = janela, p = poli, kernel = 'uniform', subset = amostra, covs = covsZ)
pct_desp_recp_saude_mun <- rdrobust(df$pct_desp_recp_saude_mun, df$X, h = janela, p = poli, kernel = 'uniform', subset = amostra, covs = covsZ)
tx_med_ch <- rdrobust(df$tx_med_ch, df$X, h = janela, p = poli, kernel = 'uniform', subset = amostra, covs = covsZ)
cob_esf <- rdrobust(df$cob_esf, df$X, h = janela, p = poli, kernel = 'uniform', subset = amostra, covs = covsZ)
tx_leito_sus <- rdrobust(df$tx_leito_sus, df$X, h = janela, p = poli, kernel = 'uniform', subset = amostra, covs = covsZ)
ideology_2018 <- rdrobust(df$ideology_2018, df$X, h = janela, p = poli, kernel = 'uniform', subset = amostra, covs = covsZ)



models <- list("Analfabetismo" = taxa_analfabetismo_18_mais,
               "Gini" = indice_gini,
               "Renda PC" = renda_pc,
               "População 2010" = populacao_2010,
               "Idhm" = idhm,
               "% Pop. Urb." = per_populacao_urbana,
               "% Pop. Hom." = per_populacao_homens,
               "% de Saúde na Despesa Total" = pct_desp_recp_saude_mun,
               "Médicos por 1k habitantes" = tx_med_ch,
               "Cobertura Est. Saúde da Família" = cob_esf,
               "Leitos SUS por 100k habitantes" = tx_leito_sus,
               "Ideologia" = ideology_2018)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Baseline Characteristis (mserd optimal bandwidth)")



covsZ = cbind(df$tenure)
poli = 1

r1 = rdrobust(df$Y_cases, df$X, h = janela, p = poli, kernel = 'uniform', subset = amostra, covs = covsZ)
r2 = rdrobust(df$Y_hosp, df$X, h = janela, p = poli, kernel = 'uniform', subset = amostra, covs = covsZ)
r3 = rdrobust(df$Y_deaths_sivep, df$X, h = janela, p = poli, kernel = 'uniform', subset = amostra, covs = covsZ)
r4 = rdrobust(df$per_vacinados, df$X, h = janela, p = poli, kernel = 'uniform', subset = amostra, covs = covsZ)

models <- list("Cases" = r1,
               "Hospitalizations" = r2,
               "Deaths" = r3,
               "Vaccine_rate" = r4)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Impact of STEM Candidate Elected in 2016 on COVID-19 Epidemiological Outcomes per 100k inhabitants in 2021 — RD estimates without controls")

summary(r2)

## mecanismo

covsZ = cbind(df$tenure)
poli = 2

r1 = rdrobust(df$total_nfi, h = janela, df$X, p = poli,  subset = amostra, covs = covsZ)
r2 = rdrobust(df$mascaras, df$X, h = janela,  p = poli,  subset = amostra, covs = covsZ)
r3 = rdrobust(df$restricao_atv_nao_essenciais, df$X, h = janela,  p = poli,  subset = amostra, covs = covsZ)
r4 = rdrobust(df$restricao_circulacao, df$X, h = janela,  p = poli,  subset = amostra, covs = covsZ)
r5 = rdrobust(df$restricao_transporte_publico, df$X, h = janela,  p = poli,  subset = amostra, covs = covsZ)
r6 = rdrobust(df$barreiras_sanitarias, df$X, h = janela,  p = poli,  subset = amostra, covs = covsZ)


models <- list("Total NFI" = r1,
               "Masks" = r2,
               "Restrictions atv." = r3,
               "Restrictions circu." = r4,
               "Restrictions transp." = r5,
               "Sani barriers" = r6)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Impact of STEM Candidate Elected in 2016 on COVID-19 Epidemiological Outcomes per 100k inhabitants in 2021 — RD estimates without controls")

## controlando mecanismo


covsZ = cbind(df$tenure, df$mascaras, df$barreiras_sanitarias)
poli = 2

r1 = rdrobust(df$Y_cases, df$X, h = janela, p = poli, kernel = 'uniform', subset = amostra, covs = covsZ)
r2 = rdrobust(df$Y_hosp, df$X, h = janela, p = poli, kernel = 'uniform', subset = amostra, covs = covsZ)
r3 = rdrobust(df$Y_deaths_sivep, df$X, h = janela, p = poli, kernel = 'uniform', subset = amostra, covs = covsZ)
r4 = rdrobust(df$per_vacinados, df$X, h = janela, p = poli, kernel = 'uniform', subset = amostra, covs = covsZ)

models <- list("Cases" = r1,
               "Hospitalizations" = r2,
               "Deaths" = r3,
               "Vaccine_rate" = r4)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Impact of STEM Candidate Elected in 2016 on COVID-19 Epidemiological Outcomes per 100k inhabitants in 2021 — RD estimates without controls")


# Seletor de janela #Big magic -------------------------------------------------------


library("rdlocrand")
Z = cbind(df$taxa_analfabetismo_18_mais[df$ens_sup == 1 & df$coorte == 2016 & df$sch_non_stem_cdt == 1],
          df$indice_gini[df$ens_sup == 1 & df$coorte == 2016 & df$sch_non_stem_cdt == 1],
          df$renda_pc[df$ens_sup == 1 & df$coorte == 2016 & df$sch_non_stem_cdt == 1],
          df$estimated_population[df$ens_sup == 1 & df$coorte == 2016 & df$sch_non_stem_cdt == 1],
          df$per_populacao_homens[df$ens_sup == 1 & df$coorte == 2016 & df$sch_non_stem_cdt == 1],
          df$per_populacao_urbana[df$ens_sup == 1 & df$coorte == 2016 & df$sch_non_stem_cdt == 1],
          df$pct_desp_recp_saude_mun[df$ens_sup == 1 & df$coorte == 2016 & df$sch_non_stem_cdt == 1],
          df$tx_med_ch[df$ens_sup == 1 & df$coorte == 2016 & df$sch_non_stem_cdt == 1],
          df$cob_esf[df$ens_sup == 1 & df$coorte == 2016 & df$sch_non_stem_cdt == 1],
          df$tx_leito_sus[df$ens_sup == 1 & df$coorte == 2016 & df$sch_non_stem_cdt == 1],
          df$ideology_2018[df$ens_sup == 1 & df$coorte == 2016 & df$sch_non_stem_cdt == 1])


out = rdwinselect(df$X[df$ens_sup == 1 & df$coorte == 2016 & df$sch_non_stem_cdt == 1], Z, seed = 50, reps = 1000, wobs = 2, nwindows= 100, plot = TRUE)




covsZ = cbind()
janela = out$w_right
poli = 1

taxa_analfabetismo_18_mais <- rdrobust(df$taxa_analfabetismo_18_mais, df$X, p = poli, h = out$w_right, kernel = 'uniform', subset = c(df$ens_sup == 1 & df$coorte == 2016 & df$sch_non_stem_cdt == 1), covs = covsZ)
indice_gini <- rdrobust(df$indice_gini, df$X, p = poli, h = out$w_right, kernel = 'uniform', subset = c(df$ens_sup == 1 & df$coorte == 2016 & df$sch_non_stem_cdt == 1), covs = covsZ)
renda_pc <- rdrobust(df$renda_pc, df$X, p = poli, h = out$w_right, kernel = 'uniform', subset = c(df$ens_sup == 1 & df$coorte == 2016 & df$sch_non_stem_cdt == 1), covs = covsZ)
populacao_2010 <- rdrobust(df$populacao_2010, df$X, p = poli, h = out$w_right, kernel = 'uniform', subset = c(df$ens_sup == 1 & df$coorte == 2016 & df$sch_non_stem_cdt == 1), covs = covsZ)
idhm <- rdrobust(df$idhm, df$X, p = poli, h = out$w_right, kernel = 'uniform', subset = c(df$ens_sup == 1 & df$coorte == 2016 & df$sch_non_stem_cdt == 1), covs = covsZ)
per_populacao_urbana <- rdrobust(df$per_populacao_urbana, df$X, p = poli, h = out$w_right, kernel = 'uniform', subset = c(df$ens_sup == 1 & df$coorte == 2016 & df$sch_non_stem_cdt == 1), covs = covsZ)
per_populacao_homens <- rdrobust(df$per_populacao_homens, df$X, p = poli, h = out$w_right, kernel = 'uniform', subset = c(df$ens_sup == 1 & df$coorte == 2016 & df$sch_non_stem_cdt == 1), covs = covsZ)
pct_desp_recp_saude_mun <- rdrobust(df$pct_desp_recp_saude_mun, df$X, p = poli, h = out$w_right, kernel = 'uniform', subset = c(df$ens_sup == 1 & df$coorte == 2016 & df$sch_non_stem_cdt == 1), covs = covsZ)
tx_med_ch <- rdrobust(df$tx_med_ch, df$X, p = poli, h = out$w_right, kernel = 'uniform', subset = c(df$ens_sup == 1 & df$coorte == 2016 & df$sch_non_stem_cdt == 1), covs = covsZ)
cob_esf <- rdrobust(df$cob_esf, df$X, p = poli, h = out$w_right, kernel = 'uniform', subset = c(df$ens_sup == 1 & df$coorte == 2016 & df$sch_non_stem_cdt == 1), covs = covsZ)
tx_leito_sus <- rdrobust(df$tx_leito_sus, df$X, p = poli, h = out$w_right, kernel = 'uniform', subset = c(df$ens_sup == 1 & df$coorte == 2016 & df$sch_non_stem_cdt == 1), covs = covsZ)
ideologia <- rdrobust(df$ideology_2018, df$X, p = poli, h = out$w_right, kernel = 'uniform', subset = c(df$ens_sup == 1 & df$coorte == 2016 & df$sch_non_stem_cdt == 1), covs = covsZ)



models <- list("Analfabetismo" = taxa_analfabetismo_18_mais,
               "Gini" = indice_gini,
               "Renda PC" = renda_pc,
               "População 2010" = populacao_2010,
               "Idhm" = idhm,
               "% Pop. Urb." = per_populacao_urbana,
               "% Pop. Hom." = per_populacao_homens,
               "% de Saúde na Despesa Total" = pct_desp_recp_saude_mun,
               "Médicos por 1k habitantes" = tx_med_ch,
               "Cobertura Est. Saúde da Família" = cob_esf,
               "Leitos SUS por 100k habitantes" = tx_leito_sus,
               "Ideologia" = ideology_2018)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Baseline Characteristis (mserd optimal bandwidth)")

reeleito <- rdrobust(df$reeleito, df$X, p = poli, h = janela,  subset = amostra, covs = covsZ)
summary(reeleito)

mulher <- rdrobust(df$mulher, df$X, p = poli, h = janela,  subset = amostra, covs = covsZ)
summary(mulher)


covsZ = cbind()
janela = out$w_right
poli = 2

r1 = rdrobust(df$Y_cases, df$X, h = janela, p = poli, kernel = 'uniform', subset = amostra, covs = covsZ)
r2 = rdrobust(df$Y_hosp, df$X, h = janela, p = poli, kernel = 'uniform', subset = amostra, covs = covsZ)
r3 = rdrobust(df$Y_deaths_sivep, df$X, h = janela, p = poli, kernel = 'uniform', subset = amostra, covs = covsZ)
r4 = rdrobust(df$per_vacinados, df$X, h = janela, p = poli, kernel = 'uniform', subset = amostra, covs = covsZ)

models <- list("Cases" = r1,
               "Hospitalizations" = r2,
               "Deaths" = r3,
               "Vaccine_rate" = r4)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Impact of STEM Candidate Elected in 2016 on COVID-19 Epidemiological Outcomes per 100k inhabitants in 2021 — RD estimates without controls")

summary(r2)

#mecanismo

poli = 1
janela = out$w_right
covsZ = cbind() 

r1 = rdrobust(df$total_nfi, h = janela, df$X, p = poli, kernel = "uniform",  subset = amostra, covs = covsZ)
r2 = rdrobust(df$mascaras, df$X, h = janela,  p = poli, kernel = "uniform",  subset = amostra, covs = covsZ)
r3 = rdrobust(df$restricao_atv_nao_essenciais, df$X, h = janela,  p = poli, kernel = "uniform",  subset = amostra, covs = covsZ)
r4 = rdrobust(df$restricao_circulacao, df$X, h = janela,  p = poli, kernel = "uniform",  subset = amostra, covs = covsZ)
r5 = rdrobust(df$restricao_transporte_publico, df$X, h = janela,  p = poli, kernel = "uniform",  subset = amostra, covs = covsZ)
r6 = rdrobust(df$barreiras_sanitarias, df$X, h = janela,  p = poli, kernel = "uniform",  subset = amostra, covs = covsZ)


models <- list("Total NFI" = r1,
               "Masks" = r2,
               "Restrictions atv." = r3,
               "Restrictions circu." = r4,
               "Restrictions transp." = r5,
               "Sani barriers" = r6)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Impact of STEM Candidate Elected in 2016 on COVID-19 Epidemiological Outcomes per 100k inhabitants in 2021 — RD estimates without controls")


## controlando mecanismo


covsZ = cbind(df$restricao_transporte_publico)
poli = 2

r2 = rdrobust(df$Y_hosp, df$X, h = janela, p = poli, kernel = 'uniform', subset = amostra, covs = covsZ)
r3 = rdrobust(df$Y_deaths_sivep, df$X, h = janela, p = poli, kernel = 'uniform', subset = amostra, covs = covsZ)

models <- list("Cases" = r1,
               "Hospitalizations" = r2,
               "Deaths" = r3,
               "Vaccine_rate" = r4)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Impact of STEM Candidate Elected in 2016 on COVID-19 Epidemiological Outcomes per 100k inhabitants in 2021 — RD estimates without controls")


## Com efeitos fixos Mágica suprema ---------------------------------------------




#### Optimal bandwidth ---------------------------------------------------

covsZ = cbind(state.d)
poli = 1

taxa_analfabetismo_18_mais <- rdrobust(df$taxa_analfabetismo_18_mais, df$X, p = poli, bwselect = "mserd", kernel = 'uniform', subset = amostra, covs = covsZ)
indice_gini <- rdrobust(df$indice_gini, df$X, p = poli, bwselect = "mserd", kernel = 'uniform', subset = amostra, covs = covsZ)
renda_pc <- rdrobust(df$renda_pc, df$X, p = poli, bwselect = "mserd", kernel = 'uniform', subset = amostra, covs = covsZ)
populacao_2010 <- rdrobust(df$populacao_2010, df$X,  p = poli, bwselect = "mserd", kernel = 'uniform', subset = amostra, covs = covsZ)
idhm <- rdrobust(df$idhm, df$X,  p = poli, bwselect = "mserd", kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_urbana <- rdrobust(df$per_populacao_urbana, df$X,  p = poli, bwselect = "mserd", kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_homens <- rdrobust(df$per_populacao_homens, df$X,  p = poli, bwselect = "mserd", kernel = 'uniform', subset = amostra, covs = covsZ)
pct_desp_recp_saude_mun <- rdrobust(df$pct_desp_recp_saude_mun, df$X,  p = poli, bwselect = "mserd", kernel = 'uniform', subset = amostra, covs = covsZ)
tx_med_ch <- rdrobust(df$tx_med_ch, df$X,  p = poli, bwselect = "mserd", kernel = 'uniform', subset = amostra, covs = covsZ)
cob_esf <- rdrobust(df$cob_esf, df$X,  p = poli, bwselect = "mserd", kernel = 'uniform', subset = amostra, covs = covsZ)
tx_leito_sus <- rdrobust(df$tx_leito_sus, df$X,  p = poli, bwselect = "mserd", kernel = 'uniform', subset = amostra, covs = covsZ)
ideology_2018 <- rdrobust(df$ideology_2018, df$X,  p = poli, bwselect = "mserd", kernel = 'uniform', subset = amostra, covs = covsZ)



models <- list("Analfabetismo" = taxa_analfabetismo_18_mais,
               "Gini" = indice_gini,
               "Renda PC" = renda_pc,
               "População 2010" = populacao_2010,
               "Idhm" = idhm,
               "% Pop. Urb." = per_populacao_urbana,
               "% Pop. Hom." = per_populacao_homens,
               "% de Saúde na Despesa Total" = pct_desp_recp_saude_mun,
               "Médicos por 1k habitantes" = tx_med_ch,
               "Cobertura Est. Saúde da Família" = cob_esf,
               "Leitos SUS por 100k habitantes" = tx_leito_sus,
               "Ideologia" = ideology_2018)

teste0 <- modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             output = "gt",
             title = "Baseline Characteristis (mserd optimal bandwidth)",
             coef_omit = "Bias-Corrected")



teste0 %>%
  tab_style(style = cell_fill(color = 'lightblue'),
            locations = cells_body(rows = 3))



covsZ = cbind(state.d) 
poli = 1

r2 = rdrobust(df$Y_hosp, df$X, p = poli, kernel = "uniform",   bwselect = "mserd", subset = amostra, covs = covsZ)
r3 = rdrobust(df$Y_deaths_sivep, df$X, kernel = "uniform",   bwselect = "mserd", p = poli,  subset = amostra, covs = covsZ)


poli = 2

r4 = rdrobust(df$Y_hosp, df$X, p = poli, kernel = "uniform",   bwselect = "mserd", subset = amostra, covs = covsZ)
r5 = rdrobust(df$Y_deaths_sivep, df$X, kernel = "uniform",   bwselect = "mserd", p = poli,  subset = amostra, covs = covsZ)



models <- list(
  "Hospitalizations" = r2,
  "Deaths" = r3,
  "Hospitalizations" = r4,
  "Deaths" = r5)

teste <- modelsummary(models,
                      statistic = "std.error",
                      stars = c('*'=.1, '**'=.05, '***'=.01),
                      fmt = 2, # decimal places
                      output = "gt",
                      title = "Impact of STEM Candidate on Epidemiological Outcomes — RD estimates with fixed effects (optimal bandwidth)",
                      coef_omit = "Bias-Corrected")


teste %>%
  tab_spanner(label = "Linear", columns = 2:3) %>% 
  tab_spanner(label = "Quadratic", columns = 4:5) %>% 
  tab_style(style = cell_fill(color = 'lightblue'),
            locations = cells_body(rows = 3))



## mecanismo

covsZ = cbind(state.d)
poli = 1

r1 = rdrobust(df$total_nfi, df$X, p = poli, bwselect = "mserd", kernel = "uniform",  subset = amostra, covs = covsZ)
r2 = rdrobust(df$mascaras, df$X, p = poli, bwselect = "mserd", kernel = "uniform",  subset = amostra, covs = covsZ)
r3 = rdrobust(df$restricao_atv_nao_essenciais, df$X, p = poli, kernel = "uniform", bwselect = "mserd",  subset = amostra, covs = covsZ)
r4 = rdrobust(df$restricao_circulacao, df$X, p = poli, bwselect = "mserd", kernel = "uniform",  subset = amostra, covs = covsZ)
r5 = rdrobust(df$restricao_transporte_publico, df$X, p = poli, kernel = "uniform", bwselect = "mserd",  subset = amostra, covs = covsZ)
r6 = rdrobust(df$barreiras_sanitarias, df$X, p = poli, kernel = "uniform", bwselect = "mserd",  subset = amostra, covs = covsZ)

poli = 2

r7 = rdrobust(df$total_nfi, df$X, p = poli, bwselect = "mserd", kernel = "uniform",  subset = amostra, covs = covsZ)
r8 = rdrobust(df$mascaras, df$X, p = poli, bwselect = "mserd", kernel = "uniform",  subset = amostra, covs = covsZ)
r9 = rdrobust(df$restricao_atv_nao_essenciais, df$X, p = poli, kernel = "uniform", bwselect = "mserd",  subset = amostra, covs = covsZ)
r10 = rdrobust(df$restricao_circulacao, df$X, p = poli, bwselect = "mserd", kernel = "uniform",  subset = amostra, covs = covsZ)
r11 = rdrobust(df$restricao_transporte_publico, df$X, p = poli, kernel = "uniform", bwselect = "mserd",  subset = amostra, covs = covsZ)
r12 = rdrobust(df$barreiras_sanitarias, df$X, p = poli, kernel = "uniform", bwselect = "mserd",  subset = amostra, covs = covsZ)


models <- list("Total NFI" = r1,
               "Masks" = r2,
               "Restrictions atv." = r3,
               "Restrictions circu." = r4,
               "Restrictions transp." = r5,
               "Sani barriers" = r6,
               
               "Total NFI" = r7,
               "Masks" = r8,
               "Restrictions atv." = r9,
               "Restrictions circu." = r10,
               "Restrictions transp." = r11,
               "Sani barriers" = r12)

teste2 <- modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             output = "gt",
             title = "Impact of STEM Candidate on Non-Farmaceutical Intervations (NFIs) — RD estimates with fixed effects (optimal bandwidth)",
             coef_omit = "Bias-Corrected")

teste2 %>%
  tab_spanner(label = "Linear", columns = 2:7) %>% 
  tab_spanner(label = "Quadratic", columns = 8:13) %>% 
  tab_style(style = cell_fill(color = 'lightblue'),
            locations = cells_body(rows = 3))
  


## controlando mecanismo

covsZ = cbind(state.d, df$barreiras_sanitarias, df$restricao_atv_nao_essenciais, df$mascaras, df$restricao_circulacao,  df$restricao_transporte_publico) 

poli = 1

r1 = rdrobust(df$Y_hosp, df$X, p = poli, kernel = "uniform",  bwselect = "mserd",subset = amostra, covs = covsZ)
r2 = rdrobust(df$Y_deaths_sivep, df$X, kernel = "uniform",  bwselect = "mserd", p = poli,  subset = amostra, covs = covsZ)

poli = 2

r3 = rdrobust(df$Y_hosp, df$X, p = poli, kernel = "uniform",  bwselect = "mserd",subset = amostra, covs = covsZ)
r4 = rdrobust(df$Y_deaths_sivep, df$X, kernel = "uniform",  bwselect = "mserd", p = poli,  subset = amostra, covs = covsZ)



models <- list(
               "Hospitalizations" = r1,
               "Deaths" = r2,
               "Hospitalizations" = r3,
               "Deaths" = r4)

teste3 <- modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             output = "gt",
             title = "Impact of STEM Candidate controlling for Non-Farmaceutical Intervations (NFIs) — RD estimates with fixed effects (optimal bandwidth)")


teste3 %>%
  tab_spanner(label = "Linear", columns = 2:3) %>% 
  tab_spanner(label = "Quadratic", columns = 4:5) %>% 
  tab_style(style = cell_fill(color = 'lightblue'),
            locations = cells_body(rows = 5))







#### 3% ------------------------------------------------------------------

covsZ = cbind(state.d)

janela = 0.09

taxa_analfabetismo_18_mais <- rdrobust(df$taxa_analfabetismo_18_mais, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
indice_gini <- rdrobust(df$indice_gini, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
renda_pc <- rdrobust(df$renda_pc, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
populacao_2010 <- rdrobust(df$populacao_2010, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
idhm <- rdrobust(df$idhm, df$X,h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_urbana <- rdrobust(df$per_populacao_urbana, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_homens <- rdrobust(df$per_populacao_homens, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
pct_desp_recp_saude_mun <- rdrobust(df$pct_desp_recp_saude_mun, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
tx_med_ch <- rdrobust(df$tx_med_ch, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
cob_esf <- rdrobust(df$cob_esf, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
tx_leito_sus <- rdrobust(df$tx_leito_sus, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
ideology_2018 <- rdrobust(df$ideology_2018, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)



models <- list("Analfabetismo" = taxa_analfabetismo_18_mais,
               "Gini" = indice_gini,
               "Renda PC" = renda_pc,
               "População 2010" = populacao_2010,
               "Idhm" = idhm,
               "% Pop. Urb." = per_populacao_urbana,
               "% Pop. Hom." = per_populacao_homens,
               "% de Saúde na Despesa Total" = pct_desp_recp_saude_mun,
               "Médicos por 1k habitantes" = tx_med_ch,
               "Cobertura Est. Saúde da Família" = cob_esf,
               "Leitos SUS por 100k habitantes" = tx_leito_sus,
               "Ideologia" = ideology_2018)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Baseline Characteristis (3% bandwidth)")

covsZ = cbind(fixed, df$mulher, df$tenure)

r1 = rdrobust(df$Y_cases, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r2 = rdrobust(df$Y_hosp, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r3 = rdrobust(df$Y_deaths_sivep, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r4 = rdrobust(df$per_vacinados, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)

models <- list("Cases" = r1,
               "Hospitalizations" = r2,
               "Deaths" = r3,
               "Vaccine_rate" = r4)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Impact of STEM Candidate Elected in 2016 on COVID-19 Epidemiological Outcomes per 100k inhabitants in 2021 — RD estimates without controls")



#### 4% ------------------------------------------------------------------

covsZ = fixed
janela = 0.04

taxa_analfabetismo_18_mais <- rdrobust(df$taxa_analfabetismo_18_mais, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
indice_gini <- rdrobust(df$indice_gini, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
renda_pc <- rdrobust(df$renda_pc, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
populacao_2010 <- rdrobust(df$populacao_2010, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
idhm <- rdrobust(df$idhm, df$X,h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_urbana <- rdrobust(df$per_populacao_urbana, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_homens <- rdrobust(df$per_populacao_homens, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
pct_desp_recp_saude_mun <- rdrobust(df$pct_desp_recp_saude_mun, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
tx_med_ch <- rdrobust(df$tx_med_ch, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
cob_esf <- rdrobust(df$cob_esf, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
tx_leito_sus <- rdrobust(df$tx_leito_sus, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
ideology_2018 <- rdrobust(df$ideology_2018, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)



models <- list("Analfabetismo" = taxa_analfabetismo_18_mais,
               "Gini" = indice_gini,
               "Renda PC" = renda_pc,
               "População 2010" = populacao_2010,
               "Idhm" = idhm,
               "% Pop. Urb." = per_populacao_urbana,
               "% Pop. Hom." = per_populacao_homens,
               "% de Saúde na Despesa Total" = pct_desp_recp_saude_mun,
               "Médicos por 1k habitantes" = tx_med_ch,
               "Cobertura Est. Saúde da Família" = cob_esf,
               "Leitos SUS por 100k habitantes" = tx_leito_sus,
               "Ideologia" = ideology_2018)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Baseline Characteristis (mserd optimal bandwidth)")

covsZ = cbind(state.d, df$mulher)

r1 = rdrobust(df$Y_cases, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r2 = rdrobust(df$Y_hosp, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r3 = rdrobust(df$Y_deaths_sivep, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r4 = rdrobust(df$per_vacinados, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)

models <- list("Cases" = r1,
               "Hospitalizations" = r2,
               "Deaths" = r3,
               "Vaccine_rate" = r4)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Impact of STEM Candidate Elected in 2016 on COVID-19 Epidemiological Outcomes per 100k inhabitants in 2021 — RD estimates without controls")


#### 5% mágica ------------------------------------------------------------------
covsZ = fixed
janela = 0.05

taxa_analfabetismo_18_mais <- rdrobust(df$taxa_analfabetismo_18_mais, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
indice_gini <- rdrobust(df$indice_gini, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
renda_pc <- rdrobust(df$renda_pc, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
populacao_2010 <- rdrobust(df$populacao_2010, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
idhm <- rdrobust(df$idhm, df$X,h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_urbana <- rdrobust(df$per_populacao_urbana, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_homens <- rdrobust(df$per_populacao_homens, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
pct_desp_recp_saude_mun <- rdrobust(df$pct_desp_recp_saude_mun, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
tx_med_ch <- rdrobust(df$tx_med_ch, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
cob_esf <- rdrobust(df$cob_esf, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
tx_leito_sus <- rdrobust(df$tx_leito_sus, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
ideology_2018 <- rdrobust(df$ideology_2018, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)



models <- list("Analfabetismo" = taxa_analfabetismo_18_mais,
               "Gini" = indice_gini,
               "Renda PC" = renda_pc,
               "População 2010" = populacao_2010,
               "Idhm" = idhm,
               "% Pop. Urb." = per_populacao_urbana,
               "% Pop. Hom." = per_populacao_homens,
               "% de Saúde na Despesa Total" = pct_desp_recp_saude_mun,
               "Médicos por 1k habitantes" = tx_med_ch,
               "Cobertura Est. Saúde da Família" = cob_esf,
               "Leitos SUS por 100k habitantes" = tx_leito_sus,
               "Ideologia" = ideology_2018)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Baseline Characteristis (mserd optimal bandwidth)")

covsZ = cbind(fixed, df$renda_pc, df$tenure, df$ideology_2018)

r1 = rdrobust(df$Y_cases, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r2 = rdrobust(df$Y_hosp, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r3 = rdrobust(df$Y_deaths_sivep, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r4 = rdrobust(df$per_vacinados, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)

models <- list("Cases" = r1,
               "Hospitalizations" = r2,
               "Deaths" = r3,
               "Vaccine_rate" = r4)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Impact of STEM Candidate Elected in 2016 on COVID-19 Epidemiological Outcomes per 100k inhabitants in 2021 — RD estimates without controls")


#### 6% ------------------------------------------------------------------
covsZ = fixed
janela = 0.07

taxa_analfabetismo_18_mais <- rdrobust(df$taxa_analfabetismo_18_mais, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
indice_gini <- rdrobust(df$indice_gini, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
renda_pc <- rdrobust(df$renda_pc, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
populacao_2010 <- rdrobust(df$populacao_2010, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
idhm <- rdrobust(df$idhm, df$X,h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_urbana <- rdrobust(df$per_populacao_urbana, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
per_populacao_homens <- rdrobust(df$per_populacao_homens, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
pct_desp_recp_saude_mun <- rdrobust(df$pct_desp_recp_saude_mun, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
tx_med_ch <- rdrobust(df$tx_med_ch, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
cob_esf <- rdrobust(df$cob_esf, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
tx_leito_sus <- rdrobust(df$tx_leito_sus, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
ideology_2018 <- rdrobust(df$ideology_2018, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)



models <- list("Analfabetismo" = taxa_analfabetismo_18_mais,
               "Gini" = indice_gini,
               "Renda PC" = renda_pc,
               "População 2010" = populacao_2010,
               "Idhm" = idhm,
               "% Pop. Urb." = per_populacao_urbana,
               "% Pop. Hom." = per_populacao_homens,
               "% de Saúde na Despesa Total" = pct_desp_recp_saude_mun,
               "Médicos por 1k habitantes" = tx_med_ch,
               "Cobertura Est. Saúde da Família" = cob_esf,
               "Leitos SUS por 100k habitantes" = tx_leito_sus,
               "Ideologia" = ideology_2018)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Baseline Characteristis (mserd optimal bandwidth)")



r1 = rdrobust(df$Y_cases, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r2 = rdrobust(df$Y_hosp, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r3 = rdrobust(df$Y_deaths_sivep, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)
r4 = rdrobust(df$per_vacinados, df$X, h = janela, kernel = 'uniform', subset = amostra, covs = covsZ)

models <- list("Cases" = r1,
               "Hospitalizations" = r2,
               "Deaths" = r3,
               "Vaccine_rate" = r4)

modelsummary(models,
             statistic = "std.error",
             stars = c('*'=.1, '**'=.05, '***'=.01),
             fmt = 2, # decimal places
             #output = "latex",
             title = "Impact of STEM Candidate Elected in 2016 on COVID-19 Epidemiological Outcomes per 100k inhabitants in 2021 — RD estimates without controls")





library("rddensity")

### hosp

hosp_rdd <- rdd_data(y = Y_hosp, x = X, cutpoint = 0, data = subset(df, ens_sup == 1 & coorte == 2016 & sch_non_stem_cdt == 1  & !is.na(Y_hosp)))
plot(hosp_rdd)

bw_ik <- rdd_bw_ik(hosp_rdd)
reg_nonpara <- rdd_reg_np(rdd_object = hosp_rdd, bw = 0.08)
print(reg_nonpara)

plotSensi(reg_nonpara, from = 0.01, to = 0.10, by = 0.01, level = 0.90)

plotPlacebo(reg_nonpara, level = 0.90)

dens_test(reg_nonpara)




# testando
#### deaths

deaths_rdd <- rdd_data(y = Y_deaths_sivep, x = X, cutpoint = 0, data = subset(df, ens_sup == 1 & coorte == 2016 & sch_non_stem_cdt == 1  & !is.na(Y_deaths_sivep)))
plot(deaths_rdd)

bw_ik <- rdd_bw_ik(deaths_rdd)
reg_nonpara <- rdd_reg_np(rdd_object = deaths_rdd, bw = 0.04)
print(reg_nonpara)

plotSensi(reg_nonpara, from = 0.01, to = 0.1, by = 0.01, level = 0.90)

plotPlacebo(reg_nonpara)

dens_test(reg_nonpara)

