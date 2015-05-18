FROM nfnty/arch-mini:latest

ENV LANG en_US.UTF-8

RUN pacman -Syu --noconfirm \ 
    beets \ 
    bash-completion \ 
    python2-flask python2-gobject python2-pyacoustid python2-pylast python2-requests \
  && (yes | pacman -Scc)

CMD ["/bin/bash"]
