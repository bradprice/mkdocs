FROM centos:7.7.1908

RUN yum install -y --setopt=tsflags=nodocs python36 python36-pip && \
    pip3 install --no-cache-dir --upgrade pip && \
    python3 -m pip install --no-cache-dir MkDocs pymdown-extensions && \
    yum clean all && \
    rm -rf /var/cache/yum/*

EXPOSE 8000

ENTRYPOINT [ "/usr/local/bin/mkdocs" ]

CMD [ "serve" ]