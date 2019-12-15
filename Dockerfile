FROM scratch

COPY ./compiled/say /usr/bin/say
COPY ./compiled/explore /usr/bin/explore

// Replace this with a 'hello' introduction.
CMD ["/usr/bin/say"]
