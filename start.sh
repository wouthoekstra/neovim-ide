docker run -it \
  -v /Users/wouthoekstra/xinteractive/dpd-connect-api/:/workspace \
  -v ~/.ssh:/root/.ssh:ro \
  -v /var/run/docker.sock:/var/run/docker.sock \
  ide-base:latest
