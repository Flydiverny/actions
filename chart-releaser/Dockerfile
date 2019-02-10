FROM flydiverny/chart-releaser:latest
LABEL "maintainer"="Markus Maga <markus@maga.se>"

LABEL "com.github.actions.name"="Chart Releaser"
LABEL "com.github.actions.description"="Write arguments to the standard output"
LABEL "com.github.actions.icon"="mic"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="http://github.com/flydiverny/actions"
LABEL "homepage"="http://github.com/flydiverny/actions"

RUN	apk add --no-cache \
	bash

COPY ./chart-releaser-wrapper.sh /usr/bin/chart-releaser-wrapper

ENTRYPOINT ["chart-releaser-wrapper"]
CMD ["help"]
