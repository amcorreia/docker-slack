#amcorreia/docker-slack
==================

[![Docker Stars](https://img.shields.io/docker/stars/amcorreia/docker-slack.svg)](https://hub.docker.com/r/amcorreia/docker-slack/)
[![Docker Pulls](https://img.shields.io/docker/pulls/amcorreia/docker-slack.svg)](https://hub.docker.com/r/amcorreia/docker-slack/)
[![Docker Build](https://img.shields.io/docker/automated/amcorreia/docker-slack.svg)](https://hub.docker.com/r/amcorreia/docker-slack/)
[![Layers](https://images.microbadger.com/badges/image/amcorreia/docker-slack.svg)](https://microbadger.com/images/amcorreia/docker-slack)
[![Version](https://images.microbadger.com/badges/version/amcorreia/docker-slack.svg)](https://microbadger.com/images/amcorreia/docker-slack)


Docker container image with [Slack](https://www.slack.com/).

### How to run


```sh
$ docker run -d -it --rm -v /tmp/.X11-unix:/tmp/.X11-unix --name slack amcorreia/docker-slack
```

### How to build


```sh
$ docker build -t amcorreia/docker-slack .
```
