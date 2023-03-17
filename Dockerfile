FROM golang:1.20-alpine AS build

WORKDIR /usr/src/app

COPY . .

RUN go build -v -o /usr/src/app ./main.go

FROM alpine:latest
WORKDIR /usr/src
COPY --from=build /usr/src/app/main .
CMD [ "./main" ]