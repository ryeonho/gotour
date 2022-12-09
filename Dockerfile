FROM golang

EXPOSE 3999
RUN adduser --uid 8877 --system --disabled-password john
USER john
RUN mkdir /home/john/go
ENV GOPATH=/home/john/go
RUN go install golang.org/x/website/tour@latest

ENTRYPOINT [ "/home/john/go/bin/tour" ]
