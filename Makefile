.DEFAULT_GOAL := help

.PHONY: xcodegen 
xcodegen: ## Generate Xcode project file with xcodegen
	@rm -rf **/*.xcodeproj || true # o "|| true" é para ignorar o erro do `rm` caso não encontre nenhum proj pra ser removido.
	@xcodegen -s ./project.yml
