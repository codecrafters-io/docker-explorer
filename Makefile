build_binaries:
	go build -o compiled/docker-explorer docker-explorer.go

build_docker: build_binaries
	docker build -t docker-challenge-1 .

execute: build_binaries
	./compiled/docker-explorer echo hey
	./compiled/docker-explorer ls .
	./compiled/docker-explorer mypid

github_release: build_binaries
	hub release create \
		-a "compiled/docker-explorer#docker-explorer" \
		-m "Includes a 'docker-explorer' binary" \
		v4

download_release:
	sudo curl -L https://github.com/codecrafters-io/docker-challenge-1/releases/download/v4/docker-explorer -o /usr/bin/docker-explorer
	sudo chmod +x /usr/bin/docker-explorer
