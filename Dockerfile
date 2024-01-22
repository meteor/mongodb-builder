FROM centos:7

RUN yum install -y epel-release centos-release-scl wget which
RUN yum install -y gcc make openssl-devel bzip2-devel libffi-devel zlib-devel xz-devel 
RUN yum install -y python3-devel python3-scons devtoolset-8-gcc devtoolset-8-gcc-c++ xz-compat-libs libcurl-devel
RUN yum install -y xz-lzma-compat xz-devel
RUN yum install -y zlib-devel

RUN wget https://www.python.org/ftp/python/3.7.11/Python-3.7.11.tgz
RUN tar xzf Python-3.7.11.tgz
RUN cd Python-3.7.11 && ./configure --enable-optimizations && make altinstall
RUN python3.7 -V
RUN ls /usr/local/lib
RUN rm -f /usr/bin/python3
RUN mv /usr/local/bin/python3.7 /usr/bin/python3

ADD build.sh .
ENTRYPOINT ["/build.sh"]
