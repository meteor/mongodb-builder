# MongoDB Builder for Linux

This Docker image builds MongoDB for Linux from source without OpenSSL and cURL, similar to the generic Linux packages that are [not provided anymore since MongoDB 4.2](https://www.mongodb.com/blog/post/a-proposal-to-endoflife-our-generic-linux-tar-packages).

## Building the Image

```sh
docker build -t mongodb-builder .
```

## Usage

The `run-builder.sh` script downloads the MongoDB source, builds `mongod` and `mongo`, and creates an archive (`mongodb-linux-x86_64-*.tgz`):

```sh
./run-builder.sh
```
