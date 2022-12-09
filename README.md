reverse proxy에서 url을 `/gotour` 라고 prefix할 방법이 없어서 포기함

## dev
docker run --rm --name=gotour -p 3999:3999 rhheo/gotour -http 0.0.0.0:3999

## build
docker build -t rhheo/gotour .

## run as service
docker compose up -d

