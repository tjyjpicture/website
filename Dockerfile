FROM 192.168.205.11/tools/golang:alpine AS development
WORKDIR $GOPATH/src
COPY . .
RUN go build -o app

FROM 192.168.205.11/tools/alpine:3.9.5 AS production
WORKDIR /root/
COPY --from=development /go/src/app .
EXPOSE 8090
ENTRYPOINT ["./app"]