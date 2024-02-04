## Adding Dockerfile for just reference

FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y \
    bash \
    curl \
    jq

COPY Open_pull_req.sh /usr/local/bin/Open_pull_req.sh

RUN chmod +x /usr/local/bin/Open_pull_req.sh

ENTRYPOINT ["/usr/local/bin/Open_pull_req.sh"]
