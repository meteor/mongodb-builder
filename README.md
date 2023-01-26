# MongoDB Builder for Linux

This Docker image builds MongoDB for Linux from source without OpenSSL and cURL, similar to the generic Linux packages
that
are [not provided anymore since MongoDB 4.2](https://www.mongodb.com/blog/post/a-proposal-to-endoflife-our-generic-linux-tar-packages).

## Building the Image

```sh
docker build -t mongodb-builder .
```

## Usage

The `run-builder.sh` script downloads the MongoDB source, builds `mongod` and `mongo`, and creates an
archive (`mongodb-linux-x86_64-*.tgz`):

```sh
./run-builder.sh
```

### Side notes!

Use an AWS big machine with some cores(need to update the j flag in ./run-builder.sh) and a lot of memory. I used a
r3.4xlarge with 16 cores and 123GB of memory. It took about 1 hours to build.

Remember to setup git and ssh keys on the machine you are building on. The build script will clone the mongodb repo and
you will need to be able to do that.

at the end of the script it will open the /build/install/bin directory and you will see a mongod and mongo or mongos
binary, that is the one that you strip and ship. the two last lines of run-builder.sh will do that for you.

Having your tarball you should create a git tag:

    ```sh
    git tag -a v4.2.0 -m "MongoDB 4.2.0"
    git push origin <tag_name>
    ```

Normally you will not commit your tarball to git. You have two options:

create a branch and commit your tarball to that branch, create a PR and download the tarball from the PR and update the release tag.

or you can send to an S3 and download it from there and update the tag with the tarball.

If you have a big enough machine you can do it in your local machine.
