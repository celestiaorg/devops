FROM alpine

# Because Alpine
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
RUN apk update && \
    apk --no-cache add bash

ENV GENESIS_HASH A9272DAD1BEBEF104EBDBF071E39789E21C0650AF5B76A7062213B772B6B925E
ENV APP /celestia-full
WORKDIR $APP

# Copy in the binary
COPY celestia ${APP}/celestia

RUN [ "/bin/bash", "-c", "exec ./celestia \
    full --repo.path ${APP} init" ]

COPY nodekey0 ${APP}/keys/OAZHALLLMV4Q
RUN chmod 0600 ${APP}/keys/OAZHALLLMV4Q

# Replace config
COPY boot-config0.toml ${APP}/config.toml

# This allows us to always set the --home directory using an env 
# var while still capturing all argumenmts passed at runtime
ENTRYPOINT [ "/bin/bash", "-c", "sleep 5 && \ 
            exec ./celestia full --repo.path ${APP} \
            \"${@}\"", "--" ]
CMD ["--help"]