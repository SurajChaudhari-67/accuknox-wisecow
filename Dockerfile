FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="/usr/games:/usr/bin:/bin"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    fortune-mod \
    fortunes \
    cowsay \
    netcat-openbsd \
    ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY wisecow.sh /app/wisecow.sh

RUN chmod +x /app/wisecow.sh

EXPOSE 4499

CMD ["/app/wisecow.sh"]