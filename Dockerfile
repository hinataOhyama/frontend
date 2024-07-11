FROM node:22.3.0

WORKDIR /usr/src

COPY . .

ARG UID=1000
ARG USERNAME=docker

RUN apt-get update && \
    apt-get install -y git && \
    useradd -u $UID -G sudo -m $USERNAME && \
    echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers \
    npm install && npx husky init && \
    echo "npx lint-staged" > .husky/pre-commit

USER $USERNAME