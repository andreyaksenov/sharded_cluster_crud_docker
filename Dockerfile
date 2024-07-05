FROM ubuntu:22.04
ENV user sampleuser
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN useradd -m -d /home/${user} ${user} && chown -R ${user} /home/${user}
RUN apt-get update && apt-get install -y git build-essential cmake make cpio binutils curl unzip
USER ${user}
WORKDIR /home/${user}
RUN mkdir test-env
COPY --chown=${user} ../.. test-env
WORKDIR /home/${user}/test-env
RUN tar xvf sdk/tarantool-enterprise-sdk-gc64-3.1.0-0-g663f509a2-r19.linux.x86_64.tar.gz
RUN tar xvf sdk/tcm-1.1.0-95-g6d786e85.linux.amd64.tar.gz
RUN chmod +x tarantool-enterprise/env.sh
RUN chmod +x tcm
