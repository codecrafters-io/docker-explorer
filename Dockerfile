FROM alpine

COPY ./compiled/docker-explorer /usr/local/bin/docker-explorer

CMD ["/usr/local/bin/docker-explorer"]
