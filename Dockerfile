FROM node:18-bullseye-slim

RUN apt-get update && \
  apt-get -y install --no-install-recommends \
    ca-certificates \
    unzip \
    wget && \
  rm -fr /var/lib/apt/lists/*

RUN wget -q https://github.com/duckdb/duckdb/releases/download/v0.7.1/duckdb_cli-linux-amd64.zip -O ~/duckdb-cli.zip && \
  unzip ~/duckdb-cli.zip -d /usr/local/bin/ && \
  rm ~/duckdb-cli.zip

RUN npm --silent i -g @goldskycom/cli

WORKDIR /var/opt/indexed-xyz

RUN echo "DuckDB CLI version: `duckdb --version`" && \
  echo "Goldsky CLI version: `goldsky -v`"
