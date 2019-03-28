docker run -it \
  -v /home/wout/xinteractive/prestashop/src/modules/dpdbenelux/:/workspace \
  -v ~/.ssh:/home/me/.ssh:ro \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix \
  ide-php:latest
