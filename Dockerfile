FROM docker:dind

RUN apk add --no-cache python3 py-pip && \
    pip install docker
