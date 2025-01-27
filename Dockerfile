FROM node:20-alpine

WORKDIR /app

# Install expect
RUN apk update && \
    apk add --no-cache expect bash curl git

ENTRYPOINT [ "yarn", "dev" ]
