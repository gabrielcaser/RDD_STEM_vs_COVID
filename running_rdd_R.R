

# Libraries ---------------------------------------------------------------

library("basedosdados")
library("readstata13")
library("tidyverse")
library("stargazer")
library("rdrobust")


# Setting -----------------------------------------------------------------

setwd("C:/Users/gabri/OneDrive/Gabriel/Insper/Tese/Engenheiros/Stata/Data/Input")

df <- readRDS("base_rdd_covid_stem.rds")


# Creating dataframe with multiple coortes --------------------------------------------------------

##df <- read.csv("220601_base_rdd_covid_stem.csv", sep = ";") # source: https://brasil.io/dataset/covid19/caso/

##df2 <- read.csv("220601_base_rdd_covid_stem_2016.csv", sep = ";") # source: https://brasil.io/dataset/covid19/caso/

##df <- rbind(df, df2)

##saveRDS(df, "base_rdd_covid_stem.rds")


# Cleaning the data -------------------------------------------------------

## Creating "schooling" variables


df$he_non_stem_cdt = ifelse(str_detect(df$instrucao, "ensino superior completo") & df$stem_job == 0 & df$rdd == 1, 1, 0)

df <- df %>% 
      group_by(city, ano) %>%
      mutate(stem_cdt_tenure = sum(tenure), deaths_per_100k_inhabitants = (deaths / estimated_population) * 100000, sch_non_stem_cdt = sum(he_non_stem_cdt))


## Filtering only for top 2 candidates where STEM candidate was one of them 

df <- df %>%
  filter(rdd == 1 & resultado == "eleito") %>%
  rename("coorte" = "ano")

df$dif_votos = ifelse(df$stem_job == 1, df$dif_votos, -df$dif_votos) # considering the vote margin negative if the STEM candidate lost


## Creating variables X e Y E T for the RDD

df$X = df$dif_votos

df$Y_deaths = df$deaths_per_100k_inhabitants

df$Y_cases = df$confirmed_per_100k_inhabitants

## Creating Treatment variable (STEM candidate won)

df$T = ifelse(df$X >= 0, 1, 0)

df$T_X = df$X * df$T # interaction between margin and treatment



# Plotting ----------------------------------------------------------------

## Mean comparison between groups

rdplot(df$Y_cases[df$coorte == 2016], df$X[df$coorte == 2016], p = 0)
rdplot(df$Y_cases[df$coorte == 2020], df$X[df$coorte == 2020], p = 0)


rdplot(df$Y_deaths[df$coorte == 2016], df$X[df$coorte == 2016], p = 0)
rdplot(df$Y_deaths[df$coorte == 2020], df$X[df$coorte == 2020], p = 0)

## Margem de 5% e polinômio de grau 1

rdplot(df$Y_cases[df$coorte == 2016 & df$X >= -0.05 & df$X <= 0.05], df$X[df$coorte == 2016 & df$X >= -0.05 & df$X <= 0.05], p = 1, x.label = "Vote margin", y.label = "Cases per 100k habitants", title = "Discontinuity: STEM Candidates elected in 2016 vs. Covid Cases in 2020")
rdplot(df$Y_cases[df$coorte == 2020 & df$X >= -0.05 & df$X <= 0.05], df$X[df$coorte == 2020 & df$X >= -0.05 & df$X <= 0.05], p = 1, x.label = "Vote margin", y.label = "Cases per 100k habitants", title = "Discontinuity: STEM Candidates elected in 2020 vs. Covid Cases in 2021")

rdplot(df$Y_deaths[df$coorte == 2016 & df$X >= -0.05 & df$X <= 0.05], df$X[df$coorte == 2016 & df$X >= -0.05 & df$X <= 0.05], p = 1, x.label = "Vote margin", y.label = "Cases per 100k habitants", title = "Discontinuity 2020: Deaths x STEM Candidate")
rdplot(df$Y_deaths[df$coorte == 2020 & df$X >= -0.05 & df$X <= 0.05], df$X[df$coorte == 2020 & df$X >= -0.05 & df$X <= 0.05], p = 1, x.label = "Vote margin", y.label = "Cases per 100k habitants", title = "Discontinuity: STEM Candidates elected in 2020 vs. Covid Deaths in 2021")

## Margem de 1% e polinômio de grau 2

rdplot(df$Y_cases[df$coorte == 2016 & df$X <= 0.01], df$X[df$coorte == 2016 & df$X <= 0.01], p = 2)
rdplot(df$Y_cases[df$coorte == 2020 & df$X <= 0.01], df$X[df$coorte == 2020 & df$X <= 0.01], p = 2)

rdplot(df$Y_deaths[df$coorte == 2016 & df$X <= 0.01], df$X[df$coorte == 2016 & df$X <= 0.01], p = 2)
rdplot(df$Y_deaths[df$coorte == 2020 & df$X <= 0.01], df$X[df$coorte == 2020 & df$X <= 0.01], p = 2)


# Running RDD -------------------------------------------------------------

## one regression without controls

### cases

#### 2016

r1 = lm(Y_cases ~ X + T + T_X, data = subset(df, X >= -0.03 & X <= 0.03 & coorte == 2016))
summary(r1)
r2 = lm(Y_cases ~ X + T + T_X, data = subset(df, X >= -0.05 & X <= 0.05 & coorte == 2016))
summary(r2)
r3 = lm(Y_cases ~ X + T + T_X, data = subset(df, X >= -0.07 & X <= 0.07 & coorte == 2016))
summary(r3)
r4 = lm(Y_cases ~ X + T + T_X, data = subset(df, X >= -0.10 & X <= 0.10 & coorte == 2016))
summary(r4)

stargazer(r1, r3, r4, type="latex", ci=FALSE, omit.stat=c("f", "ser"),
          title = "STEM Candidates Elected in 2016 and Cases per 100k in 2020",
          dep.var.labels=c("Cases per 100k habitants"),
          covariate.labels=c("X - Margin","T - STEM Candidate","X*T"),
          column.labels = c("3pp margin","7pp margin","10pp margin"))

#### 2020

r1 = lm(Y_cases ~ X + T + T_X, data = subset(df, X >= -0.03 & X <= 0.03 & coorte == 2020))
summary(r1)
r2 = lm(Y_cases ~ X + T + T_X, data = subset(df, X >= -0.05 & X <= 0.05 & coorte == 2020))
summary(r2)
r3 = lm(Y_cases ~ X + T + T_X, data = subset(df, X >= -0.07 & X <= 0.07 & coorte == 2020))
summary(r3)
r4 = lm(Y_cases ~ X + T + T_X, data = subset(df, X >= -0.10 & X <= 0.10 & coorte == 2020))
summary(r4)

stargazer(r1, r3, r4, type="latex", ci=FALSE, omit.stat=c("f", "ser"),
          title = "STEM Candidates Elected in 2020 and Cases per 100k in 2021",
          dep.var.labels=c("Cases per 100k habitants"),
          covariate.labels=c("X - Margin","T - STEM Candidate","X*T"),
          column.labels = c("3pp margin","7pp margin","10pp margin"))

### deaths

out = lm(Y_deaths ~ X + T + T_X, data = subset(df, X >= -0.05 & X <= 0.05 & coorte == 2016))
summary(out)

r1 = lm(Y_deaths ~ X + T + T_X, data = subset(df, X >= -0.05 & X <= 0.03 & coorte == 2020))
summary(r1)
r2 = lm(Y_deaths ~ X + T + T_X, data = subset(df, X >= -0.07 & X <= 0.07 & coorte == 2020))
summary(r2)
r3 = lm(Y_deaths ~ X + T + T_X, data = subset(df, X >= -0.10 & X <= 0.10 & coorte == 2020))
summary(r3)


stargazer(r1, r2, r3, type="latex", ci=FALSE, omit.stat=c("f", "ser"),
          title = "STEM Candidates Elected in 2020 and Deaths per 100k in 2021",
          dep.var.labels=c("Deaths per 100k habitants"),
          covariate.labels=c("X - Margin","T - STEM Candidate","X*T"),
          column.labels = c("3pp margin","7pp margin","10pp margin"))

## One regression with controls

#### Lucas falou que tenho que ver só para os municípios em que 2 candidatos tinham ensino superior. Vou testar isso aqui:

### cases

out = lm(Y_cases ~ X + T + T_X , data = subset(df, X >= -0.05 & X <= 0.05 & coorte == 2016 & sch_non_stem_cdt == 1))
summary(out)

rdplot(df$Y_cases[df$coorte == 2020 & df$X <= 0.05 & df$sch_non_stem_cdt == 1], df$X[df$coorte == 2020 & df$X <= 0.05 & df$sch_non_stem_cdt == 1], p = 1, x.label = "Vote margin", y.label = "Cases per 100k habitants", title = "Discontinuity: STEM Candidates elected in 2020 vs. Covid Cases in 2021 (only municipiliaties where top 2 candidates had a college degree)")

r1 = lm(Y_cases ~ X + T + T_X , data = subset(df, X >= -0.03 & X <= 0.03 & coorte == 2020 & sch_non_stem_cdt == 1))
summary(r1)
r2 = lm(Y_cases ~ X + T + T_X , data = subset(df, X >= -0.05 & X <= 0.05 & coorte == 2020 & sch_non_stem_cdt == 1))
summary(r2)
r3 = lm(Y_cases ~ X + T + T_X , data = subset(df, X >= -0.07 & X <= 0.07 & coorte == 2020 & sch_non_stem_cdt == 1))
summary(r3)

stargazer(r1, r2, r3, type="latex", ci=FALSE, omit.stat=c("f", "ser"),
          title = "STEM Candidates Elected in 2020 and Cases per 100k in 2021",
          dep.var.labels=c("Cases per 100k habitants"),
          covariate.labels=c("X - Margin","T - STEM Candidate","X*T"),
          column.labels = c("3pp margin","5pp margin","7pp margin"),
          notes = "Comparing only municipiliaties where top 2 voted candidates had a college degree",
          notes.label = "",
          notes.append = FALSE)


### deaths

out = lm(Y_deaths ~ X + T + T_X , data = subset(df, X >= -0.05 & X <= 0.05 & coorte == 2016 & sch_non_stem_cdt == 1))
summary(out)

out = lm(Y_deaths ~ X + T + T_X , data = subset(df, X >= -0.03 & X <= 0.03 & coorte == 2020 & sch_non_stem_cdt == 1))
summary(out)
out = lm(Y_deaths ~ X + T + T_X , data = subset(df, X >= -0.07 & X <= 0.07 & coorte == 2020 & sch_non_stem_cdt == 1))
summary(out)
out = lm(Y_deaths ~ X + T + T_X , data = subset(df, X >= -0.10 & X <= 0.10 & coorte == 2020 & sch_non_stem_cdt == 1))
summary(out)


#### Mesmo com pouquíssimas observações estou achando efeito a 10% Ou seja, parece que é o STEM mesmo e não o Ensino Superior!


#Usando rdrobust
####Referência: https://sites.google.com/site/rdpackages/rdrobust

out = rdrobust(df$Y_cases[df$coorte == 2020], df$X[df$coorte == 2020], kernel = 'uniform',  p = 1, h = 0.05)
summary(out)

###Usando MSE-optimal bandwidth selector
out = rdrobust(df$Y_cases[df$coorte == 2020], df$X[df$coorte == 2020], bwselect = 'mserd')
summary(out)
