FROM anapsix/alpine-java:jdk8

RUN apk update && \
    apk add docker openssh git rsync && \
    mkdir -p ~root/.ssh && chmod 700 ~root/.ssh/ && \
    echo -e "Port 22\n" >> /etc/ssh/sshd_config && \
    cp -a /etc/ssh /etc/ssh.cache && \
    rm -rf /var/cache/apk && \
    ssh-keygen -A && \
    ln -s /opt/jdk/bin/java /usr/local/bin/java

RUN adduser -D -h /home/jenkins -s /bin/sh jenkins && \
    echo "jenkins:jenkins" | chpasswd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D", "-f", "/etc/ssh/sshd_config"]
