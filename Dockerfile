FROM nfnty/arch-mini:latest

ENV LANG en_US.UTF-8
ENV BEETSDIR /config
ENV USERID 1000

# RUN echo "nameserver 10.0.0.1" > /etc/resolv.conf
# dont do this - find out why resolf.conf is not being linked from host

RUN pacman -Syu --noconfirm --needed \ 
    beets \ 
    bash-completion \ 
    python2-flask python2-gobject python2-pyacoustid python2-pylast python2-requests \
  && (yes | pacman -Scc)

RUN mkdir -p /config
ADD firstrun.sh /root/firstrun.sh
RUN chmod +x /root/firstrun.sh && firstrun.sh


CMD ["/bin/bash"]
