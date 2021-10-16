FROM golang:alpine AS builder

WORKDIR /go/src/app
COPY . .

RUN go build code-education.go

FROM scratch

COPY --from=builder /go/src/app/code-education /go/bin/code-education

ENTRYPOINT ["/go/bin/code-education"]