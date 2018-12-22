FROM ubuntu:xenial
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        apt-utils \
        ca-certificates \
        curl \
        php7.0-cli \
        php7.0-xml \
        libssl-dev \
        unzip \
    && curl -O https://phoronix-test-suite.com/releases/repo/pts.debian/files/phoronix-test-suite_8.4.1_all.deb \
    && dpkg -i phoronix-test-suite_8.4.1_all.deb

COPY phoronix-test-suite.xml /etc/phoronix-test-suite.xml

RUN phoronix-test-suite batch-install pts/pgbench pts/build-linux-kernel \
    && rm -rf /var/lib/apt/lists/*

COPY test-definition.xml /var/lib/phoronix-test-suite/test-profiles/pts/pgbench-1.8.6/test-definition.xml

ENV PTS_SILENT_MODE 1

ENTRYPOINT ["/usr/bin/phoronix-test-suite", "batch-run"]
