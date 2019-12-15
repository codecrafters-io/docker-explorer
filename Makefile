build_binary:
	go build -o compiled/echo echo.go

build_docker: build_binary
	docker build -t docker-challenge-1 .

execute: build_binary
	./compiled/echo hey
