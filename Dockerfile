FROM golang:alpine as build

WORKDIR /app
ADD main.go /app/
RUN go build -o simple-go-server

FROM alpine

COPY --from=build /app/simple-go-server /app/simple-go-server

ENV PORT 8080
EXPOSE 8080

ENTRYPOINT /app/simple-go-server
