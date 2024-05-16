FROM ubuntu

RUN sudo apt-get update && sudo apt-get install -y golang-go

COPY ..

RUN CGO_ENABLED=0 go build -o /app .

#####################################################

FROM scratch

COPY --from= build /app /app

ENTRYPOINT ["/app"]
