FROM alpine:latest AS builder

RUN apk add --no-cache \
    cmake \
    g++ \
    make \
    git \
    libstdc++ \
    bash \
    linux-headers  # Ajoutez les en-têtes du noyau Linux

RUN git clone https://github.com/hailo-ai/hailort.git /hailort && \
    cd /hailort && \
    git checkout v4.20.0

WORKDIR /hailort

RUN cmake -S . -B build -DCMAKE_BUILD_TYPE=Release && \
    cmake --build build --config Release -- -j$(nproc)

FROM alpine:latest

RUN apk add --no-cache \
    libstdc++ \
    bash

COPY --from=builder /hailort/build/hailort/hailortcli/hailortcli /hailortcli
COPY --from=builder /hailort/build/hailort/libhailort/src/libhailort.so.* /lib/

ENTRYPOINT ["/hailortcli"]
