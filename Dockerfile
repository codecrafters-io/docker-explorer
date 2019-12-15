FROM scratch

COPY ./compiled/say /usr/bin/say

CMD ["/usr/bin/say"]
