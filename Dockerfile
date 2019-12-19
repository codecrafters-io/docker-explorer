FROM alpine

COPY ./compiled/say /usr/bin/say
COPY ./compiled/explore /usr/bin/explore
COPY ./compiled/mypid /usr/bin/mypid

# Replace this with a 'hello' introduction.
CMD ["/usr/bin/say"]
