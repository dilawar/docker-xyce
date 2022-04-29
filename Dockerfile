# Temp for building Xyce
FROM archlinux:latest as base0

RUN pacman -Syyu --noconfirm
RUN pacman -S --noconfirm --needed cmake pkgconfig git python-pip python sudo base-devel go \
    && pacman -Scc --noconfirm
# yay needs a normal user.
RUN useradd -m bmo
RUN echo "bmo ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN echo "root ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER bmo

# Install xyce
WORKDIR /tmp
RUN git clone https://aur.archlinux.org/yay.git && cd yay \
    && yes | makepkg -si
RUN yes | yay -aS --noconfirm xyce-serial
RUN Xyce -h
RUN ls -R /home/bmo/.cache/yay

# Main image.
FROM archlinux:latest
WORKDIR /root
COPY --from=base0 /home/bmo/.cache/yay/**/*.zst /root/
RUN pacman -Syyu --noconfirm
RUN pacman -U --noconfirm *.tar.zst && rm -f *.zst
RUN Xyce -h
