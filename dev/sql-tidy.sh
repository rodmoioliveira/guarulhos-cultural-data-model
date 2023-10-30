#!/bin/bash

declare TRACE
[[ "${TRACE}" == 1 ]] && set -o xtrace
set -o errexit
set -o nounset
set -o pipefail

sql-tidy() {
  find sql \
    -type f \
    -name "*.sql" \
    -exec sqlformat --keywords upper --reindent --indent_width 2 -o {} {} \;
}

main() {
  sql-tidy
}

main
