FROM amd64/ubuntu:20.04
 
# install filemaker server dependencies
RUN DEBIAN_FRONTEND=noninteractive      \
    apt-get update                          \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
        acl                             \
        apache2-bin                     \
        apache2-utils                   \
        avahi-daemon                    \
        curl                            \
        dbus                            \
        firewalld                       \
        fonts-baekmuk                   \
        fonts-liberation2               \
        fonts-noto                      \
        fonts-takao                     \
        fonts-wqy-zenhei                \
        libaio1                         \
        libantlr3c-3.4-0                \
        libavahi-client3                \
        libboost-chrono1.71.0           \
        libboost-system1.71.0           \
        libboost-thread1.71.0           \
        libbz2-1.0                      \
        libc++1-12                      \
        libcurl3-gnutls                 \
        libcurl4-gnutls-dev             \
        libcurl4                        \
        libdjvulibre21                  \
        libetpan20                      \
        libevent-2.1-7                  \
        libexpat1                       \
        libfontconfig1                  \
        libfreetype6                    \
        libgomp1                        \
        libheif1                        \
        libicu66                        \
        libilmbase24                    \
        libjpeg-turbo8                  \
        liblqr-1-0                      \
        liblzma5                        \
        libodbc1                        \
        libomniorb4-2                   \
        libomp5-12                      \
        libopenexr24                    \
        libpam0g                        \
        libpng16-16                     \
        libsasl2-2                      \
        libtiff5                        \
        libuuid1                        \
        libvpx6                         \
        libwebpdemux2                   \
        libwebpmux3                     \
        libxml2                         \
        libxpm4                         \
        libxslt1.1                      \
        lsb-release                     \
        logrotate                       \
        nginx                           \
        odbcinst1debian2                \
        openjdk-11-jre                  \
        openssl                         \
        policycoreutils                 \
        sysstat                         \
        unzip                           \
        zip                             \
        zlib1g                          \
        init                            \
        && DEBIAN_FRONTEND=noninteractive apt-get --fix-broken install -y \
        && DEBIAN_FRONTEND=noninteractive apt-get autoremove -y \  
        && DEBIAN_FRONTEND=noninteractive apt-get clean -y
 

COPY installation /install

# expose the necessary ports
EXPOSE 80
EXPOSE 443
EXPOSE 2399
EXPOSE 50003
 
# when containers run, start this
# command as root to initialize
# user management
USER root

CMD ["/sbin/init"]

LABEL org.opencontainers.image.source=https://github.com/icoseuk/filemaker-server
LABEL org.opencontainers.image.description="FileMaker Server"