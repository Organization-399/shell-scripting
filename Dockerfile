## Adding Dockerfile for just reference

FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y \
    bash \
    curl \
    jq

COPY pull_requests.sh /usr/local/bin/pull_requests.sh

RUN chmod +x /usr/local/bin/pull_requests.sh

ENTRYPOINT ["/usr/local/bin/pull_requests.sh"]
