# Getting Started - Docker

A Docker environment to get started with [indexed.xyz](https://www.indexed.xyz).

Start syncing data:

```
docker run -v $(pwd):/var/opt/indexed-xyz -it goldskycom/indexed.xyz:latest goldsky indexed sync decoded-logs
```

Processed data is available in a `./data` directory in your current working directory.

To learn more about the available commands, please run the following:

```
docker run -v $(pwd):/var/opt/indexed-xyz -it goldskycom/indexed.xyz:latest goldsky indexed --help
```

## DuckDB

Synced data (see previous chapter) can be queried with [DuckDB](https://duckdb.org/) (or any tool of your choice that processes `.parquet` files):

```
docker run -v $(pwd):/var/opt/indexed-xyz -it goldskycom/indexed.xyz:latest duckdb
```

## Development

### Build

```
docker build -t goldskycom/indexed.xyz:latest .
```

### Start a container and access it

```
docker run -it goldskycom/indexed.xyz:latest bash
```

### Deploy

When a pull request is merged into the `main` branch, a GitHub workflow automatically publishes a new `latest` Docker image tag to the Ducker Hub.
