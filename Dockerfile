FROM arm32v7/debian
ARG VERSION=3.9.0

RUN apt-get update && \
    apt-get --assume-yes upgrade && \
    apt-get --assume-yes install wget libio-socket-ip-perl libio-socket-ssl-perl libjson-any-perl && \
    wget "http://downloads.sourceforge.net/project/ddclient/ddclient/ddclient-${VERSION}/ddclient-${VERSION}.tar.gz" -O- | tar xzf - && \
    cp ddclient-${VERSION}/ddclient /usr/sbin/ && \
    mkdir -p /etc/ddclient && \
    mkdir /var/cache/ddclient && \
    apt-get --assume-yes clean && \
    rm --force --recursive /var/lib/apt/lists/* /tmp/* /var/tmp/*
    
CMD [ "/usr/sbin/ddclient", "-daemon=300", "-foreground", "-debug", "-verbose", "-noquiet" ]
