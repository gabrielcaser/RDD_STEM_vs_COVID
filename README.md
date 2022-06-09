# RDD_STEM_vs_COVID

- Durante o ápice da crise da COVID-19 uma série de políticos usaram o argumento "estou seguindo a ciência" para justificar suas decisões de políticas públicas;
- Minha premissa é que prefeitos que trabalharam ao longo de sua vida com ciência e tecnologia e correlatos, conhecidos como STEM (Science, Technology, Engenieering and Math), seriam os mais prováveis de "seguir a ciência" em sua tomada de decisão;
- Minha hipótese é que prefeitos com "STEM background" responderiam melhor aos desafios da pandemia, reduzindo indicadores negativos, como contágio e mortes;
- Para testar essa hipótese, esse documento busca criar um dataframe adequado para a realização de um RDD.
- Portanto, utilizando Python, busco os candidatos eleitos em 2016 e em 2020 (TSE - Base dos Dados), identificando se eles trabalharam ou não com STEM (RAIS) ao longo de suas vidas
- Por fim, utilizando R, rodo um modelo de Regrssão Discontínua (RDD) para estimar o impacto de um munício eleger um candidato STEM no número de casos e mortes por COVID (BRASIL-IO)


  - Fontes Primárias: RAIS, Base dos Dados, Brasil IO
  - Fontes Secundárias: TSE, Secretarias Estaduais de Saúde
