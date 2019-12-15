build_binary:
	go build -o compiled/say say.go

build_docker: build_binary
	docker build -t docker-challenge-1 .

execute: build_binary
	./compiled/say hey

github_release: build_binary
	hub release create -a "compiled/say#say" -m "Includes a downloadable 'say' binary" v1
