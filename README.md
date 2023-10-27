# Data Model (Guarulhos Cultural)

This repo contains the initial data model to store information on Guarulhos's cultural workers' records.

## Dependencies

 - [csvq](https://github.com/mithrandie/csvq)

## Queries

Generate table [csv/ficha_tecnica_joins.csv](https://github.com/rodmoioliveira/guarulhos-cultural-data-model/blob/main/csv/ficha_tecnica_joins.csv):

```sh
rm csv/ficha_tecnica_joins.csv
csvq -s sql/ficha_tecnica_joins.sql -f CSV -o csv/ficha_tecnica_joins.csv
```

Select all records:

```txt
csvq -f BOX '
  SELECT
    evento_nome,
    artista,
    funcao_nome
  FROM `csv/ficha_tecnica_joins.csv`;
'

┌─────────────────────────────────────┬─────────────────────────────┬─────────────────────┐
│             evento_nome             │           artista           │     funcao_nome     │
├─────────────────────────────────────┼─────────────────────────────┼─────────────────────┤
│ Entrevista com Stela do Patrocínio  │ Stela do Patrocínio         │ autoria             │
│ Entrevista com Stela do Patrocínio  │ Georgette Fadel             │ direção             │
│ Entrevista com Stela do Patrocínio  │ Lincoln Antonio             │ direção             │
│ Entrevista com Stela do Patrocínio  │ Georgette Fadel             │ elenco              │
│ Entrevista com Stela do Patrocínio  │ Juliana Amaral              │ elenco              │
│ Entrevista com Stela do Patrocínio  │ Tomaz Fujita Klotzel        │ fotografia          │
│ Entrevista com Stela do Patrocínio  │ Julia Zakia Orlandi         │ iluminação          │
│ Entrevista com Stela do Patrocínio  │ Lincoln Antonio             │ música              │
│ Entrevista com Stela do Patrocínio  │ Georgette Fadel             │ produção            │
│ Entrevista com Stela do Patrocínio  │ Lincoln Antonio             │ produção            │
│ Entrevista com Stela do Patrocínio  │ Vitor Souza                 │ produção executiva  │
│ Entrevista com Stela do Patrocínio  │ Lincoln Antonio             │ trilha sonora       │
│ Amor de Servidão                    │ Marilia Toledo              │ autoria             │
│ Amor de Servidão                    │ Marçal Aquino               │ autoria             │
│ Amor de Servidão                    │ Kleber Montanheiro          │ cenografia          │
│ Amor de Servidão                    │ Fabiano Gabriel             │ contrarregra        │
│ Amor de Servidão                    │ Aurora Rodrigues de Morais  │ costureira          │
│ Amor de Servidão                    │ Eunice Moreira Cruz         │ costureira          │
│ Amor de Servidão                    │ Marco Antonio Braz          │ direção             │
│ Amor de Servidão                    │ Marilia Toledo              │ direção de produção │
│ Amor de Servidão                    │ Manoel Candeias             │ elenco              │
│ Amor de Servidão                    │ Marcelo Galdino             │ elenco              │
│ Amor de Servidão                    │ Martha Nowill               │ elenco              │
│ Amor de Servidão                    │ Veridiana Toledo            │ elenco              │
│ Amor de Servidão                    │ Kleber Montanheiro          │ figurino            │
│ Amor de Servidão                    │ Isabel Delia                │ fotografia          │
│ Amor de Servidão                    │ Guilherme Bonfanti          │ iluminação          │
│ Amor de Servidão                    │ Aurora Rodrigues de Morais  │ operação de luz     │
│ Amor de Servidão                    │ Grissel Piguillem           │ operação de luz     │
│ Amor de Servidão                    │ Daniela Montanheiro         │ operação de som     │
│ Amor de Servidão                    │ Vitor Souza                 │ produção executiva  │
│ Amor de Servidão                    │ Gabriel Levy                │ trilha sonora       │
│ Amor de Servidão                    │ João Zílio                  │ trilha sonora       │
└─────────────────────────────────────┴─────────────────────────────┴─────────────────────┘
```


Select by `artista_id`:

```txt
csvq -f BOX '
  SELECT
    evento_nome,
    artista,
    funcao_nome
  FROM `csv/ficha_tecnica_joins.csv`
  WHERE artista_id = 7;
'

┌─────────────────────────────────────┬─────────────┬─────────────────────┐
│             evento_nome             │   artista   │     funcao_nome     │
├─────────────────────────────────────┼─────────────┼─────────────────────┤
│ Entrevista com Stela do Patrocínio  │ Vitor Souza │ produção executiva  │
│ Amor de Servidão                    │ Vitor Souza │ produção executiva  │
└─────────────────────────────────────┴─────────────┴─────────────────────┘
```

