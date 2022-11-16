# syntax=docker/dockerfile:1.4

FROM bitnami/node:16-debian-11

WORKDIR /app
COPY . .
RUN <<EOT bash
    set -eux
    install_packages build-essential libpng-dev git python3-minimal python3-dev libvhdi-utils lvm2 cifs-utils gcc
    yarn
    yarn build
EOT

RUN <<EOT bash
    set -eux
    cd packages/xo-server/node_modules
    ln -sv ../../xo-server-* ./
EOT

WORKDIR /app/packages/xo-server
CMD node dist/cli.mjs
