.DEFAULT_GOAL := help
IMAGE := ministryofjustice/tech-docs-github-pages-publisher:1.4

.PHONY: preview report

preview: ## Run a local instance of the documentation site, while editing
	docker run --rm \
		-v $$(pwd)/config:/app/config \
		-v $$(pwd)/source:/app/source \
		-p 4567:4567 \
		-it $(IMAGE) /publishing-scripts/preview.sh


report: ## Review which pages have expired
	 ./report-for-daniel-the-manual-spaniel.sh

help:
	@grep -h -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
