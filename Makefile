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
.PHONY: install-hooks
.PHONY: readme
.PHONY: sql-tidy
