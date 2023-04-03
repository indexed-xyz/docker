# Getting Started - Docker

A Docker environment to get started with [indexed.xyz](https://www.indexed.xyz).

Start syncing data:

```
docker run -v $(pwd):/var/opt/indexed-xyz -it goldsky/indexed.xyz:latest goldsky indexed sync decoded-logs
```

Processed data is available in a `./data` directory in your current working directory.

To learn more about the available commands, please run the following:

```
docker run -v $(pwd):/var/opt/indexed-xyz -it goldsky/indexed.xyz:latest goldsky indexed --help
```

## DuckDB

Synced data (see previous chapter) can be queried with [DuckDB](https://duckdb.org/) (or any tool of your choice that processes `.parquet` files):

```
docker run -v $(pwd):/var/opt/indexed-xyz -it goldsky/indexed.xyz:latest duckdb
```

## Development

### Build

```
docker build -t goldsky/indexed.xyz:dev .
```

### Start a container and access it

```
docker run -it goldsky/indexed.xyz:dev bash
```

### Deploy

When a pull request is merged into the `main` branch, a GitHub workflow automatically publishes a new `latest` Docker image tag to the Ducker Hub.

## Increase CLI versions without pull request

This Docker image contains various CLIs (e.g. `goldsky` and `duckdb`). If you want to publish a new `goldsky/indexed.xyz:latest` tag, re-run the most recent `ci` GitHub workflow.
