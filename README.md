# Data Model (Guarulhos Cultural)

This repo contains the initial data model to store information on Guarulhos's cultural workers' records.

## Dependencies

 - [docker](https://docs.docker.com/engine/install/)
 - [clickhouse-client](https://clickhouse.com/docs/en/install#install-clickhouse-server-and-client)

## Running

```txt
make clickhouse-stop
make clickhouse-create
clickhouse-client \
  --host localhost \
  --max_insert_threads 16 \
  --max_final_threads 16 \
  --format CSVWithNames \
  --multiquery \
  --query "use cultura; SELECT * FROM cultura.ficha_tecnica_joined;" |
  mlr --icsv --opprint cat

ficha_tecnica_id evento_id evento_nome                        evento_tipo_id evento_tipo_nome artista_id artista_nome  artista_sobrenome   funcao_id funcao_nome
2                1         Entrevista com Stela do Patrocínio 1              espetáculo       1          Georgette     Fadel               1         direção
3                1         Entrevista com Stela do Patrocínio 1              espetáculo       1          Georgette     Fadel               6         elenco
4                1         Entrevista com Stela do Patrocínio 1              espetáculo       1          Georgette     Fadel               7         produção
9                1         Entrevista com Stela do Patrocínio 1              espetáculo       2          Julia         Zakia Orlandi       3         iluminação
12               1         Entrevista com Stela do Patrocínio 1              espetáculo       3          Juliana       Amaral              6         elenco
5                1         Entrevista com Stela do Patrocínio 1              espetáculo       4          Lincoln       Antonio             1         direção
7                1         Entrevista com Stela do Patrocínio 1              espetáculo       4          Lincoln       Antonio             5         música
8                1         Entrevista com Stela do Patrocínio 1              espetáculo       4          Lincoln       Antonio             7         produção
6                1         Entrevista com Stela do Patrocínio 1              espetáculo       4          Lincoln       Antonio             4         trilha sonora
1                1         Entrevista com Stela do Patrocínio 1              espetáculo       5          Stela         do Patrocínio       2         autoria
11               1         Entrevista com Stela do Patrocínio 1              espetáculo       6          Tomaz         Fujita Klotzel      9         fotografia
10               1         Entrevista com Stela do Patrocínio 1              espetáculo       7          Vitor         Souza               8         produção executiva
19               2         Amor de Servidão                   1              espetáculo       9          Aurora        Rodrigues de Morais 13        costureira
22               2         Amor de Servidão                   1              espetáculo       9          Aurora        Rodrigues de Morais 14        operação de luz
26               2         Amor de Servidão                   1              espetáculo       10         Daniela       Montanheiro         15        operação de som
20               2         Amor de Servidão                   1              espetáculo       11         Eunice        Moreira Cruz        13        costureira
33               2         Amor de Servidão                   1              espetáculo       12         Fabiano       Gabriel             17        contrarregra
24               2         Amor de Servidão                   1              espetáculo       13         Gabriel       Levy                4         trilha sonora
23               2         Amor de Servidão                   1              espetáculo       14         Grissel       Piguillem           14        operação de luz
21               2         Amor de Servidão                   1              espetáculo       15         Guilherme     Bonfanti            3         iluminação
32               2         Amor de Servidão                   1              espetáculo       16         Isabel        Delia               9         fotografia
25               2         Amor de Servidão                   1              espetáculo       17         João          Zílio               4         trilha sonora
17               2         Amor de Servidão                   1              espetáculo       18         Kleber        Montanheiro         10        cenografia
18               2         Amor de Servidão                   1              espetáculo       18         Kleber        Montanheiro         12        figurino
27               2         Amor de Servidão                   1              espetáculo       19         Manoel        Candeias            6         elenco
28               2         Amor de Servidão                   1              espetáculo       20         Marcelo       Galdino             6         elenco
16               2         Amor de Servidão                   1              espetáculo       21         Marco Antonio Braz                1         direção
14               2         Amor de Servidão                   1              espetáculo       22         Marilia       Toledo              2         autoria
15               2         Amor de Servidão                   1              espetáculo       22         Marilia       Toledo              16        direção de produção
29               2         Amor de Servidão                   1              espetáculo       23         Martha        Nowill              6         elenco
13               2         Amor de Servidão                   1              espetáculo       24         Marçal        Aquino              2         autoria
30               2         Amor de Servidão                   1              espetáculo       26         Veridiana     Toledo              6         elenco
31               2         Amor de Servidão                   1              espetáculo       7          Vitor         Souza               8         produção executiva
```

## Make Recipes

```txt
make help

bash-all                       Run all bash tests
bash-check                     Check format bash code
bash-fmt                       Format bash code
bash-lint                      Check lint bash code
clickhouse-backup              Backup Clickhouse data
clickhouse-create              Create Clickhouse database and tables
clickhouse-run                 Create a new Clickhouse local instance
clickhouse-stop                Stop Clickhouse local instance
help                           Display this help screen
install-hooks                  Install git hooks
readme                         Write README.md
sql-tidy                       Tidy SQL files
```
