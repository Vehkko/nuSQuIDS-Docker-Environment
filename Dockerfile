FROM archlinux:latest

LABEL maintainer="Your Name <your.email@example.com>"

COPY src /opt/src

RUN pacman -Sy --noconfirm && \
    pacman -S --noconfirm base-devel clang gcc vim neovim gsl git cmake && \
    pacman -S --noconfirm python boost python-numpy python-matplotlib ipython hdf5 pkgconf && \

    cd /opt/src/SQuIDS && \
    ./configure --with-gsl-incdir=/usr/include/gsl --with-gsl-libdir=/usr/lib && \
    make && \
    make install && \

    cd /opt/src/nuSQuIDS && \
    ./configure --with-gsl-incdir=/usr/include/gsl --with-gsl-libdir=/usr/lib \
    --with-hdf5-incdir=/usr/include --with-hdf5-libdir=/usr/lib \
    --with-squids-incdir=/usr/local/include --with-squids-libdir=/usr/local/lib \
    --with-boost-incdir=/usr/include --python-bin=/usr/bin && \
    make examples && \
    make install && \

    pacman -Scc --noconfirm

CMD ["/bin/bash"]
