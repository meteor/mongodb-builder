FROM debian:buster-slim

RUN \
  apt-get update && \
  apt-get install -y build-essential scons python3 python3-pip

ADD build.sh .
ENTRYPOINT ["/build.sh"]
