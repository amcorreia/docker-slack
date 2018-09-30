# Run slack desktop app in a container
#
# docker run --rm -it \
#	-v /etc/localtime:/etc/localtime:ro \
#	-v /tmp/.X11-unix:/tmp/.X11-unix \
#	-e DISPLAY=unix$DISPLAY \
#	--device /dev/snd \
#	--device /dev/dri \
#	--device /dev/video0 \
#	--group-add audio \
#	--group-add video \
#	-v "${HOME}/.slack:/root/.config/Slack" \
#	--ipc="host" \
#	--name slack \
#	amcorreia/docker-slack "$@"

FROM debian:stretch
LABEL maintainer "Alessandro Madruga Correia <mutley.sandro@gmail.com>"

ENV LC_ALL en_US.UTF-8 LANG en_US.UTF-8

RUN apt-get update && apt-get install -y --no-install-recommends \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg libgtk-3-0 libasound2 libx11-xcb1 \
        locales && \
    rm -rf /var/lib/apt/lists/* && \
    echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
    locale-gen en_US.utf8 && \
    /usr/sbin/update-locale LANG=en_US.UTF-8

# Add the slack debian repo
RUN curl -sSL https://packagecloud.io/slacktechnologies/slack/gpgkey | apt-key add -
RUN echo "deb https://packagecloud.io/slacktechnologies/slack/debian/ jessie main" > /etc/apt/sources.list.d/slacktechnologies_slack.list

RUN apt-get update && apt-get install -y --no-install-recommends \
	slack-desktop \
	&& rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/usr/lib/slack/slack"]
