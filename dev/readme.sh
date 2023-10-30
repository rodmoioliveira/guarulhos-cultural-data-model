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

 - [docker](https://docs.docker.com/engine/install/)
 - [clickhouse-client](https://clickhouse.com/docs/en/install#install-clickhouse-server-and-client)

## Running

\`\`\`txt
make clickhouse-stop
make clickhouse-create
clickhouse-client \\
  --host localhost \\
  --max_insert_threads 16 \\
  --max_final_threads 16 \\
  --format CSVWithNames \\
  --multiquery \\
  --query "use cultura; SELECT * FROM cultura.ficha_tecnica_joined;" |
  mlr --icsv --opprint cat

$(cat views/ficha_tecnica_joined.csv | mlr --icsv --opprint cat)
\`\`\`

## Make Recipes

\`\`\`txt
make help

$(make help)
\`\`\`
EOF

  sd '(make\[1\]:.+\n)' '' README.md
}

trap readme EXIT
