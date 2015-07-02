.PHONY: test

# runs all necessary tests
test:
	@sh -c 'if [ ! -z "$(go fmt ./...)" ]; then exit 1; else echo "go fmt OK"; fi'
	@sh -c 'if [ ! -z "$(golint ./...)" ]; then exit 1; else echo "golint OK"; fi'
	go vet ./...
	go test ./...
	go run cmd/godog/main.go -f progress

# updates dependencies
deps:
	go get -u github.com/cucumber/gherkin-go
	go get -u github.com/shiena/ansicolor