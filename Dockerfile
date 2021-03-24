FROM centos:7

RUN yum install -y epel-release centos-release-scl
RUN yum install -y python3-devel python3-scons devtoolset-8-gcc devtoolset-8-gcc-c++ xz-compat-libs libcurl-devel
RUN yum install -y xz-lzma-compat xz-devel


ADD build.sh .
ENTRYPOINT ["/build.sh"]
