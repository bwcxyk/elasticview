FROM alpine:latest

ENV EV_VERSION 0.0.11

RUN set -eux \
  && links=https://github.com/bwcxyk/elasticview/releases/download/V${EV_VERSION}/ev_${EV_VERSION}_linux_amd64.tar.gz \
  && wget ${links} \
  && tar -zxvf ev_${EV_VERSION}_linux_amd64.tar.gz \
  && mkdir /app \
  && cp /ev_${EV_VERSION}_linux_amd64/ev_linux_amd64 /app/ev_linux_amd64 \
  && chmod +x /app/ev_linux_amd64 \
  && cp -r /ev_${EV_VERSION}_linux_amd64/config /app/ \
  && rm -rf ev_${EV_VERSION}_linux_amd64* \
  && cp -r /app/config/i18n /app/config/ev-i18n

WORKDIR /app
EXPOSE 8090

CMD ["./ev_linux_amd64", "-configFile=config/config.yml"]