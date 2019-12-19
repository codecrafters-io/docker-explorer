FROM alpine

COPY ./compiled/docker-explorer /usr/bin/docker-explorer

CMD ["/usr/bin/docker-explorer"]
