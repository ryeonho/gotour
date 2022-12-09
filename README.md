## dev
docker run --rm --name=gotour -p 3999:3999 rhheo/gotour -http 0.0.0.0:3999

## build
docker build -t rhheo/gotour .

## run as service
docker stop gotour && docker rm gotour
docker run --restart=unless-stopped --name=ryeonho.com -d -p 3999:3999 ryeonho.com
