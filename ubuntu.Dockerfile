FROM ubuntu:20.04

WORKDIR /home/clusterworker

ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="/root/.local/bin:/root/.cargo/bin:/root/.npm-global/bin${PATH}"

RUN apt-get update
RUN apt-get install curl git tmux sudo build-essential fzf python3-dev python3-pip cargo -y

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get update
RUN apt-get install nodejs -y


# RUN useradd -m clusterworker

# RUN chown -R clusterworker:clusterworker /home/clusterworker
# RUN chmod 755 /home/clusterworker

# USER clusterworker

# ENV DEBIAN_FRONTEND=noninteractive
# ENV PATH="/root/.local/bin:/root/.cargo/bin:/root/.npm-global/bin${PATH}"

RUN curl -LSs https://raw.githubusercontent.com/lunarvim/lunarvim/rolling/utils/installer/install-neovim-from-release | bash

RUN curl -LSs https://raw.githubusercontent.com/lunarvim/lunarvim/rolling/utils/installer/install.sh | bash -s -- --no-install-dependencies



RUN mkdir ~/development


CMD ["/usr/bin/tail", "-f", "/dev/null"]
