#!/bin/bash

declare TRACE
[[ "${TRACE}" == 1 ]] && set -o xtrace
set -o errexit
set -o nounset
set -o pipefail

readme() {
  cat <<EOF >README.md
# Data Model (Guarulhos Cultural)

This repo contains the initial data model to store information on Guarulhos's cultural workers' records.

## Dependencies

 - [csvq](https://github.com/mithrandie/csvq)

## Queries

Generate table [csv\ficha_tecnica_joins.csv](\csv\ficha_tecnica_joins.csv):

\`\`\`sh
rm csv/ficha_tecnica_joins.csv
csvq -s sql/ficha_tecnica_joins.sql -f CSV -o csv/ficha_tecnica_joins.csv
\`\`\`

Select all records:

\`\`\`sh
csvq -f BOX '
  SELECT
    evento_nome,
    artista,
    funcao_nome
  FROM \`csv/ficha_tecnica_joins.csv\`;
'

$(csvq -f BOX 'SELECT evento_nome, artista, funcao_nome FROM `csv/ficha_tecnica_joins.csv`;')
\`\`\`


Select by \`artista_id\`:

\`\`\`sh
csvq -f BOX '
  SELECT
    evento_nome,
    artista,
    funcao_nome
  FROM \`csv/ficha_tecnica_joins.csv\`
  WHERE artista_id = 7;
'

$(csvq -f BOX 'SELECT evento_nome, artista, funcao_nome FROM `csv/ficha_tecnica_joins.csv` WHERE artista_id = 7;')
\`\`\`

EOF

  sd '(make\[1\]:.+\n)' '' README.md
}

trap readme EXIT