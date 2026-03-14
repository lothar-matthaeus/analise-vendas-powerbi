# Análise de Vendas Automotivas com Power BI

Este projeto apresenta um dashboard desenvolvido em **Power BI** para analisar o desempenho de vendas de uma empresa do setor automotivo.

O objetivo foi simular um cenário real de análise de dados, utilizando **SQL para preparação dos dados**, **modelagem dimensional** e **DAX para criação de métricas analíticas**.

---

## Objetivo da análise

Responder algumas perguntas de negócio:

- Como a receita evolui ao longo do tempo?
- Quais estados concentram o faturamento?
- Quais marcas geram mais receita?
- Existe dependência de um mercado específico?

---

## Tecnologias utilizadas

- SQL
- Power BI
- DAX
- Modelagem dimensional (Star Schema)

---

## Modelagem de dados

O modelo foi estruturado utilizando um esquema estrela:

**Fato**
- `FATO_VENDAS`

**Dimensões**
- `DIM_MARCA`
- `DIM_ESTADO`
- `DIM_TEMPO`

As queries utilizadas para criação dessas views estão disponíveis na pasta:
sql/queries.sql

sql/queries.sql


---

## Dashboard

O dashboard foi projetado para apresentar indicadores principais de vendas:

**KPIs principais**
- Receita total
- Número de vendas
- Ticket médio
- Taxa de conversão
- Crescimento de receita

**Análises**
- Evolução da receita ao longo do tempo
- Receita por estado
- Receita por marca

![Dashboard](images/dashboard-preview.png)

---

## Principais insights

A análise indicou uma **alta concentração geográfica da receita**, com mais de **60% do faturamento vindo do estado de São Paulo**, sugerindo dependência significativa de um único mercado.

Isso pode representar um risco estratégico para o negócio caso haja variações econômicas ou operacionais nessa região.

---

## Estrutura do repositório


analise-vendas-powerbi
│
├── dashboard
│ └── dashboard-analise-vendas.pbix
│
├── images
│ └── dashboard-preview.png
│
├── sql
│ └── queries.sql
│
└── README.md


---

## Autor

Projeto desenvolvido por **Lothar Matthaeus** como parte de estudos em análise de dados.
