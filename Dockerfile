FROM alpine:3.8

RUN set -x \
 && apk add --no-cache \
        # General IDE requirements
        neovim \
        openssh \
        git \
        curl \
        bash \
        zsh \
        docker \
        the_silver_searcher \
        xclip \
    # Default directory
 && mkdir -p /workspace 

# Install docker compose
RUN curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

RUN addgroup -S me && adduser -S -G me me --uid=1000
RUN addgroup me xfs
USER me

# Configure zsh and oh-my-zsh
RUN curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | zsh || true
ENV SHELL /bin/zsh

# Install Fuzzy search
RUN git clone --depth 1 --quiet https://github.com/junegunn/fzf.git ~/.fzf \
 && ~/.fzf/install --key-bindings --update-rc --completion

# Install Neovim plugin manager and install plugins
RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs --silent \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
COPY --chown=me:me init.vim /home/me/.config/nvim/init.vim
RUN nvim -i NONE -c PlugInstall -c quitall > /dev/null 2>&1

ENV FZF_DEFAULT_COMMAND 'ag -g ""'

WORKDIR /workspace
VOLUME /workspace

ENTRYPOINT ["zsh"]
