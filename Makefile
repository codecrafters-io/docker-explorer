build_binaries:
	go build -o compiled/say say.go
	go build -o compiled/explore explore.go
	go build -o compiled/mypid mypid.go

build_docker: build_binaries
	docker build -t docker-challenge-1 .

execute: build_binaries
	./compiled/say hey
	./compiled/explore .
	./compiled/mypid

github_release: build_binaries
	hub release create \
		-a "compiled/say#say" \
		-a "compiled/explore#explore" \
		-a "compiled/mypid#mypid" \
		-m "Includes binaries for say, explore and mypid" \
		v3

download_release:
	sudo curl -L https://github.com/codecrafters-io/docker-challenge-1/releases/download/v3/say -o /usr/bin/say
	sudo chmod +x /usr/bin/say
	sudo curl -L https://github.com/codecrafters-io/docker-challenge-1/releases/download/v3/explore -o /usr/bin/explore
	sudo chmod +x /usr/bin/explore
	sudo curl -L https://github.com/codecrafters-io/docker-challenge-1/releases/download/v3/mypid -o /usr/bin/mypid
	sudo chmod +x /usr/bin/mypid
