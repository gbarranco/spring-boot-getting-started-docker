.PHONY: build
build: ## Build the app. You can pass the tag with the variable t. Example: make build t="tag:version"
	docker build -t $(t) .

.PHONY: run
run: ## Run the app. You can pass the tag with the variable t. Example: make run t="tag:version"
	docker run --rm -p 8080:8080 $(t)
