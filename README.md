# MongoDB Builder for Linux

This Docker image builds MongoDB for Linux from source without OpenSSL and cURL, similar to the generic Linux packages that are [not provided anymore since MongoDB 4.2](https://www.mongodb.com/blog/post/a-proposal-to-endoflife-our-generic-linux-tar-packages).

## Building the Image

```sh
docker build -t mongodb-builder .
```

## Usage

```sh
docker run --rm -it -v MONGODB_SOURCE_PATH:/mongodb mongodb-builder
```

After the build is finished, `mongod` and `mongo` can be found in `MONGODB_SOURCE_PATH`.
