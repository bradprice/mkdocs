FROM centos:7.7.1908

RUN useradd --no-create-home --no-user-group -s /sbin/nologin --system --uid 8000 mkdocs && \
    yum install -y --setopt=tsflags=nodocs python36 python36-pip && \
    pip3 install --no-cache-dir --upgrade pip && \
    python3 -m pip install --no-cache-dir mkdocs==1.1 pymdown-extensions==7.1 && \
    yum clean all && \
    rm -rf /var/cache/yum/*

# Set locale
# https://click.palletsprojects.com/en/7.x/python3/
ENV LC_ALL=en_US.utf8 \
    LANG=en_US.utf8

USER mkdocs

EXPOSE 8000

WORKDIR /app

ENTRYPOINT [ "/usr/local/bin/mkdocs" ]

CMD [ "serve" ]

HEALTHCHECK CMD curl --fail http://localhost:8000/ || exit 1