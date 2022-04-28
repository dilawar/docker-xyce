FROM archlinux:latest

RUN pacman -Syyu --noconfirm
RUN pacman -S --noconfirm --needed cmake pkgconfig git python-pip python sudo base-devel go \
    && pacman -Scc --noconfirm
RUN pacman -S --noconfirm --needed python-setuptools python-wheel \
    python-pandas \
    python-matplotlib python-pint \
    python-pyqtgraph \
    && pacman -Scc --noconfirm

# yay needs a normal user.
RUN useradd -m bmo
RUN echo "bmo ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN echo "root ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER bmo

# Install xyce
WORKDIR /tmp
ENV MAKEFLAGS=-j4
RUN git clone https://aur.archlinux.org/yay.git && cd yay \
    && yes | BUIDDIR=/tmp/makepkg makepkg -si \
    && rm -rf /tmp/*
RUN yes | yay -aS --cleanafter --noconfirm xyce-serial
RUN Xyce -h
