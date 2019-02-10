FROM alpine:3.9 AS builder
RUN apk --no-cache add -t build-deps build-base go git curl \
    && apk --no-cache add ca-certificates \
    && export GOPATH=/go && mkdir -p /go/bin && export PATH=$PATH:/go/bin \
    && curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh \
    && export GOPATH=/go \
    && git config --global http.https://gopkg.in.followRedirects true \
    && go get -u github.com/helm/chart-releaser/ \
    && mv /go/bin/chart-releaser /bin/chart-releaser \
    && rm -rf /go \
    && apk del --purge build-deps

FROM alpine:3.9
LABEL "name"="chart-releaser action"
LABEL "maintainer"="Markus Maga <markus@maga.se>"
LABEL "version"="1.0"

LABEL "repository"="http://github.com/flydiverny/actions"
LABEL "homepage"="http://github.com/flydiverny/actions"

LABEL "com.github.actions.name"="Helm Chart Releaser"
LABEL "com.github.actions.description"="Runs helm chart releaser, automatically setting repo, owner & token"
LABEL "com.github.actions.icon"="anchor"
LABEL "com.github.actions.color"="blue"


COPY --from=builder /bin/chart-releaser /bin/chart-releaser
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt

RUN	apk add --no-cache \
	bash

COPY ./chart-releaser-wrapper.sh /usr/bin/chart-releaser-wrapper

ENTRYPOINT ["chart-releaser-wrapper"]
CMD ["help"]
