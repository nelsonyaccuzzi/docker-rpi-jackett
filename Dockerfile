FROM arm32v7/alpine:edge as tar

ARG JACKETT_CP=/var/lib/jackett

ARG JACKETT_VERSION=0.16.185

RUN apk add curl \
 && curl -L -O https://github.com/Jackett/Jackett/releases/download/v$JACKETT_VERSION/Jackett.Binaries.LinuxARM32.tar.gz \
 && tar xvzf Jackett.Binaries.LinuxARM32.tar.gz && rm Jackett.Binaries.LinuxARM32.tar.gz \
 && mkdir -p $JACKETT_CP && mv Jackett/* $JACKETT_CP

FROM arm32v7/mono

ARG JACKETT_CP=/var/lib/jackett

COPY --from=tar $JACKETT_CP $JACKETT_CP

VOLUME ["/config", "/data"]

WORKDIR $JACKETT_CP

CMD ["./jackett", "-d", "/config"]
