FROM ubuntu:20.04

RUN apt-get update -y
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y libcurl4-gnutls-dev liblzma-dev build-essential
RUN DEBIAN_FRONTEND="noninteractive" apt-get install software-properties-common python3-pip python3 -y
RUN DEBIAN_FRONTEND="noninteractive" apt-get update -y
RUN apt-get install libssl-dev -y


ADD build.sh .
ENTRYPOINT ["/build.sh"]
