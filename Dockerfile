FROM ubuntu:22.04


RUN apt update
RUN apt install -y python3 python3-pip
RUN apt install python-dev-is-python3 libssl-dev liblzma-dev -y
RUN apt-get install build-essential -y

ADD build.sh .
ENTRYPOINT ["/build.sh"]
