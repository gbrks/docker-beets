FROM nfnty/arch-mini:latest

ENV LANG en_US.UTF-8
ENV BEETSDIR /config
ENV USERID 1000

RUN pacman -Syu --noconfirm --needed \ 
    beets \ 
    bash-completion \ 
    python2-pylast python2-requests wget \
  && (yes | pacman -Scc)

RUN mkdir -p /config
ADD firstrun.sh /root/firstrun.sh
RUN chmod +x /root/firstrun.sh && /root/firstrun.sh

RUN useradd -g 100 -u $USERID -M -s /bin/bash beetuser

USER beetuser

CMD ["/bin/bash"]
