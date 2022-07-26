FROM scratch

ADD tmp/alpine/alpine-minirootfs-latest.tar.gz /

COPY tmp/usr/bin/cloudflared /bin
COPY cloudflared.sh /bin

ENV CF_LOCAL_ADDR "0.0.0.0"
ENV CF_LOCAL_PORT "5053"
ENV CF_IP_PRIMARY "1.1.1.1"
ENV CF_IP_SECONDARY "1.0.0.1"

EXPOSE 5053:5053

ENTRYPOINT ["/bin/cloudflared.sh"]
