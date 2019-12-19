tag := $(shell git describe --tags)

assert_tag:
	echo $(tag) | grep -qE ^v[0-9]+$

build_binaries:
	go build -o compiled/docker-explorer docker-explorer.go

build_docker: build_binaries
	docker build -t docker-challenge-1 .

execute: build_binaries
	./compiled/docker-explorer echo hey
	./compiled/docker-explorer ls .
	./compiled/docker-explorer mypid

github_release: build_binaries assert_tag
	hub release create \
		-a "compiled/docker-explorer#docker-explorer" \
		-m "Includes a 'docker-explorer' binary" \
		$(tag)

download_release: assert_tag
	sudo curl -L https://github.com/codecrafters-io/docker-challenge-1/releases/download/$(tag)/docker-explorer -o /usr/bin/docker-explorer
	sudo chmod +x /usr/bin/docker-explorer
