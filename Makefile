#!make

help: ## Display this help screen
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; \
		{printf "%-30s %s\n", $$1, $$2}' | \
		sort

bash-all: bash-fmt bash-check bash-lint ## Run all bash tests

bash-check: ## Check format bash code
	@fd . -t f -e sh . --absolute-path | xargs shfmt -i 2 -d

bash-fmt: ## Format bash code
	@fd . -t f -e sh . --absolute-path | xargs shfmt -i 2 -w

bash-lint: ## Check lint bash code
	@fd . -t f -e sh . --absolute-path | xargs shellcheck -o all

clickhouse-stop: ## Stop Clickhouse local instance
	@docker ps | grep clickhouse-server | cut -c1-12 - | xargs docker stop

clickhouse-run: ## Create a new Clickhouse local instance
	@docker run \
		-d \
		-it \
		--rm \
		--network=host \
		-v $(realpath ./ch_data):/var/lib/clickhouse/ \
		-v $(realpath ./ch_logs):/var/log/clickhouse-server/ \
		--name guarulhos-clickhouse-server --ulimit nofile=262144:262144 clickhouse/clickhouse-server

clickhouse-create: ## Create Clickhouse database and tables
	@clickhouse-client \
		--host localhost \
		--max_insert_threads 16 \
		--max_final_threads 16 \
		--format CSVWithNames \
		--multiquery \
		--queries-file sql/clickhouse.create-cultura.sql

clickhouse-backup: ## Backup Clickhouse data
	@find tables -type f -name "*.csv" | xargs -n1 rm
	@find views -type f -name "*.csv" | xargs -n1 rm
	@clickhouse-client \
		--host localhost \
		--max_insert_threads 16 \
		--max_final_threads 16 \
		--format CSVWithNames \
		--multiquery \
		--queries-file sql/clickhouse.backup-cultura.sql

install-hooks: ## Install git hooks
	@ln -s "${PWD}/dev/pre-commit-hook.sh" ./.git/hooks/pre-commit

readme: ## Write README.md
	@./dev/readme.sh

sql-tidy: ## Tidy SQL files
	@./dev/sql-tidy.sh

.PHONY: help
.PHONY: bash-all
.PHONY: bash-check
.PHONY: bash-fmt
.PHONY: bash-lint
.PHONY: clickhouse-stop
.PHONY: clickhouse-run
.PHONY: clickhouse-create
.PHONY: clickhouse-backup
.PHONY: install-hooks
.PHONY: readme
.PHONY: sql-tidy
