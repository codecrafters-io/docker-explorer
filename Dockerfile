FROM scratch

COPY ./compiled/echo /usr/bin/echo

CMD ["/usr/bin/echo"]
