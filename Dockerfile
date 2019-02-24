FROM alpine:3.8

RUN set -x \
 && apk add --no-cache \
        # General IDE requirements
        neovim \
        openssh \
        git \
        curl \
        zsh \
        docker \
    # Default directory
 && mkdir -p /workspace 

# Install docker compose
RUN curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

RUN addgroup -S me && adduser -S -G me me 
USER me

# Install Neovim plugin manager and install plugins
RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
COPY init.vim /home/me/.config/nvim/init.vim
RUN nvim +PlugInstall +qall >> /dev/null

# Configure zsh and oh-my-zsh
RUN curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | zsh || true
COPY zshrc .zshrc
ENV SHELL /bin/zsh

WORKDIR /workspace
VOLUME /workspace

ENTRYPOINT ["zsh"]
