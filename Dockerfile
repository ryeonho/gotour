FROM golang:alpine

ARG USER_NAME
ENV USER_NAME=${USER_NAME:-john}

EXPOSE 3999
RUN adduser -S -D ${USER_NAME}
USER ${USER_NAME}
RUN mkdir /home/${USER_NAME}/go
ENV GOPATH=/home/${USER_NAME}/go
RUN go install golang.org/x/website/tour@latest

ENV PATH="${PATH}:/home/${USER_NAME}/go/bin"
ENTRYPOINT [ "tour" ]
