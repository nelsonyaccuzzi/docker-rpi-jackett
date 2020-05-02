ARG JACKET_PATH=/var/lib/jackett

FROM arm32v7/alpine:edge as tar

ARG JACKET_PATH
ARG VERSION

RUN apk add curl \
 && curl -L -O https://github.com/Jackett/Jackett/releases/download/v$VERSION/Jackett.Binaries.LinuxARM32.tar.gz \
 && tar xvzf Jackett.Binaries.LinuxARM32.tar.gz && rm Jackett.Binaries.LinuxARM32.tar.gz \
 && mkdir -p $JACKET_PATH && mv Jackett/* $JACKET_PATH

FROM arm32v7/mono

ARG JACKET_PATH

COPY --from=tar $JACKET_PATH $JACKET_PATH

WORKDIR $JACKET_PATH

CMD ["./jackett", "-d", "/config"]
