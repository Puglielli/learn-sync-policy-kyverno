FROM fluent/fluent-bit:3.1.6-debug AS builder

COPY ca_bundle.crt /usr/local/share/ca-certificates/
COPY ca_bundle.crt /etc/ssl/certs/

RUN apt-get update \
    && apt-get install -y ca-certificates \
    && update-ca-certificates

FROM fluent/fluent-bit:3.1.6

COPY --from=builder /bin/sh /bin/sh
COPY --from=builder /usr/bin/ls /usr/bin/ls
COPY --from=builder /usr/bin/cat /usr/bin/cat
COPY --from=builder /lib/aarch64-linux-gnu /lib/

COPY --from=builder /usr/local/share/ca-certificates/ /usr/local/share/ca-certificates/
COPY --from=builder /etc/ssl/certs /etc/ssl/certs

ENTRYPOINT ["/fluent-bit/bin/fluent-bit"]

CMD ["/fluent-bit/bin/fluent-bit", "-c", "/fluent-bit/etc/fluent-bit.yaml"]
