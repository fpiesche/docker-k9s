# -------- Build in one container to keep the final image small
FROM alpine:edge AS build
ARG CGO_ENABLED=1

RUN apk add --no-cache build-base git go

WORKDIR /k9s
COPY go.mod go.sum main.go Makefile ./
COPY internal internal
COPY cmd cmd

ENV CGO_ENABLED=${CGO_ENABLED}
RUN make build

# -------- Assemble final image
FROM alpine:edge

COPY --from=build /k9s/execs/k9s /bin/k9s
RUN apk add --no-cache ca-certificates curl vim
RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk add --no-cache kubectl

ENV EDITOR=vim K9S_EDITOR=vim
CMD [ "/bin/k9s" ]
