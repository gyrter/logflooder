FROM alpine:3.13
ADD flooder.sh /usr/local/bin
ADD flooder.py /usr/local/bin
RUN apk --update --no-cache add bash python3 && chmod +x /usr/local/bin/flooder.sh /usr/local/bin/flooder.py
ENTRYPOINT [ "/usr/local/bin/flooder.sh" ]
