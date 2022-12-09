FROM golang

ARG USER_NAME
ENV USER_NAME=${USER_NAME:-john}

EXPOSE 3999
RUN adduser --system --disabled-password ${USER_NAME}
USER ${USER_NAME}
RUN mkdir /home/${USER_NAME}/go
ENV GOPATH=/home/${USER_NAME}/go

# we need tour if website (which prefixed with '/tour')
# stand alone tour is prefixed with '/'
RUN go install golang.org/x/website/tour@latest
RUN cd /home/${USER_NAME}/go/pkg/mod/golang.org/x/website@*;

ENTRYPOINT cd /home/${USER_NAME}/go/pkg/mod/golang.org/x/website@*;cd tour;go run . -http 0.0.0.0:3999
