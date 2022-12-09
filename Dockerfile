FROM golang

ARG USER_NAME
ENV USER_NAME=${USER_NAME:-john}

ARG SCHEME
ENV SCHEME=${SCHEME:-https}
ARG HOST
ENV HOST=${HOST:-www.ryeonho.com:443}

EXPOSE 3999
RUN adduser --uid 7281--system --disabled-password ${USER_NAME}
USER ${USER_NAME}
RUN mkdir /home/${USER_NAME}/go
ENV GOPATH=/home/${USER_NAME}/go

# we need tour if website (which prefixed with '/tour')
# stand alone tour is prefixed with '/'
RUN go install golang.org/x/website/tour@latest
RUN chmod +w /home/${USER_NAME}/go/pkg/mod/golang.org/x/website@*/internal/tour
RUN sed -i 's@origin.*}@origin := \&url.URL{Scheme: "'$SCHEME'", Host: "'$HOST'"}@' /home/${USER_NAME}/go/pkg/mod/golang.org/x/website@*/internal/tour/local.go;

ENTRYPOINT cd /home/${USER_NAME}/go/pkg/mod/golang.org/x/website@*;cd tour;go run . -http 0.0.0.0:3999
