FROM node:22-bookworm AS frontend-builder
WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci

COPY index.html vite.config.ts tsconfig.json tsconfig.app.json tsconfig.node.json ./
COPY public ./public
COPY ecosystem.manifest.json ./
COPY src ./src
RUN npm run build

FROM rust:1.88-bookworm AS gateway-builder
WORKDIR /app

COPY server/Cargo.toml server/Cargo.lock ./server/
COPY server/src ./server/src
RUN cargo build --manifest-path server/Cargo.toml --release

FROM debian:bookworm-slim
WORKDIR /app

RUN apt-get update \
  && apt-get install -y --no-install-recommends ca-certificates \
  && rm -rf /var/lib/apt/lists/*

COPY --from=gateway-builder /app/server/target/release/exactlyone-gateway /app/exactlyone-gateway
COPY --from=frontend-builder /app/dist /app/dist

ENV HOST=0.0.0.0
ENV PORT=8080
ENV STATIC_DIR=/app/dist

EXPOSE 8080

CMD ["/app/exactlyone-gateway"]
