# Ubuntu dead snakes

Dockerfile based on ubuntu with added python builds from the dead snakes PPA repository
(https://launchpad.net/~fkrull/+archive/ubuntu/deadsnakes).

To generate all the Dockerfiles from templates:

```bash
./build.sh gen
```

If you want to build it yourself (specific version):

```bash
docker build -t mrupgrade/deadsnakes:2.6 2.6/
```

You can also build all versions available (2.6 2.7 3.3 3.4 3.5):

```bash
./build.sh
```

To run python 2.6 inside image execute command:

```bash
docker run --rm -it mrupgrade/deadsnakes:2.6
```