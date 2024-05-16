FROM ubuntu

RUN apt-get update && apt-get install -y golang-go

COPY . .

RUN CGO_ENABLED=0 go build -o /app .

#####################################################

FROM scratch

COPY --from= build /app /app

ENTRYPOINT ["/app"]
