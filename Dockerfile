FROM docker:dind

RUN apk update && apk add --no-cache python py-pip
RUN pip install docker
