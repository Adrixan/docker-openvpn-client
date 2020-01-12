FROM alpine:latest
RUN apk add --no-cache openvpn
RUN echo "tun" >> /etc/modules
RUN echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf
COPY run.sh /bin/run.sh
VOLUME ["/etc/openvpn"]
WORKDIR /etc/openvpn
ENTRYPOINT ["openvpn", "--config", "config.ovpn"]
