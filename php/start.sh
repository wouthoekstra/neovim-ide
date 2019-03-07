docker run -it \
  -v /home/wout/xinteractive/dpd-connect-api/:/workspace \
  -v ~/.ssh:/root/.ssh:ro \
  -v /var/run/docker.sock:/var/run/docker.sock \
  ide-php:latest
