FROM docker:24.0.7-dind

WORKDIR /app

RUN echo "http://dl-cdn.alpinelinux.org/alpine/v3.20/main" >> /etc/apk/repositories && \
    apk update && apk add --no-cache expect bash curl git nodejs=20.15.1-r0 npm python3 build-base

# Install expect
RUN apk update && \
    apk add --no-cache expect bash curl git npm python3 build-base

# Install musl
RUN apk add --no-cache musl-dev libc-dev

RUN npm install -g yarn@1.22.21

COPY ./init.exp /init.exp
RUN chmod +x /init.exp

ENTRYPOINT [ "/init.exp" ]