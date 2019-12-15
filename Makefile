build_binaries:
	go build -o compiled/say say.go
	go build -o compiled/explore explore.go

build_docker: build_binaries
	docker build -t docker-challenge-1 .

execute: build_binaries
	./compiled/say hey
	./compiled/explore .

github_release: build_binaries
	hub release create \
		-a "compiled/say#say" \
		-a "compiled/explore#explore" \
		-m "Includes a downloadable 'say' binary" \
		v1

download_release:
	curl -L https://github.com/codecrafters-io/docker-challenge-1/releases/download/v1/say -o /usr/bin/say
	chmod +x /usr/bin/say
	curl -L https://github.com/codecrafters-io/docker-challenge-1/releases/download/v1/say -o /usr/bin/explore
	chmod +x /usr/bin/explore
