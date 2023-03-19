FROM golang:alpine AS build

WORKDIR /usr/src/app

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -v -o /usr/src/app ./main.go

FROM scratch
WORKDIR /usr/src
COPY --from=build /usr/src/app/main .
CMD [ "./main" ]