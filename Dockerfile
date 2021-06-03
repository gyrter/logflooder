FROM alpine:3.13
ADD flooder.sh /usr/local/bin
RUN apk --no-cache add bash && chmod +x /usr/local/bin/flooder.sh
ENTRYPOINT [ "/usr/local/bin/flooder.sh" ]
