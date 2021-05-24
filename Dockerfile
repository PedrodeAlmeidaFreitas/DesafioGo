FROM golang:1.16.2-buster as DesafioGo
ENV GO111MODULE=off
WORKDIR /app
COPY main .
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags '-w' -o hello

FROM scratch
WORKDIR /app
COPY --from=DesafioGo /app/hello .
CMD ["/app/hello"]