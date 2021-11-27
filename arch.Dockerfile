FROM archlinux:base

# WORKDIR /home

ENV PATH="/root/.local/bin:/root/.cargo/bin:/root/.npm-global/bin${PATH}"

RUN pacman -Sy --noconfirm curl git tmux sudo curl fzf python3 cargo nodejs go

RUN curl -LSs https://raw.githubusercontent.com/lunarvim/lunarvim/rolling/utils/installer/install-neovim-from-release | bash

RUN curl -LSs https://raw.githubusercontent.com/lunarvim/lunarvim/rolling/utils/installer/install.sh | bash -s -- --no-install-dependencies

# RUN mkdir ~/development/


CMD ["/usr/bin/tail", "-f", "/dev/null"]
