Simple Docker in Docker slave for Jenkins. Built for use with the various Docker as a Cloud plugins for Jenkins. 

Can build Docker images out of the box, but you will need to set the Docker Host URI for the build to your Docker/Swarm host in the Jenkins build configuration. The container does not run a copy of the Docker engine to keep it lightweight and to preserve build cache.

If you'd like to change the Jenkins users's password, create a Dockerfile based on this image and add the line:

```
RUN echo "jenkins:password" | chpasswd
```


If you want to start the Docker engine and do builds internally, add the following lines to a Dockerfile which is based on this image:

```
RUN sysctl -w kernel.grsecurity.chroot_deny_chmod=0 && \
    sysctl -w kernel.grsecurity.chroot_deny_mknod=0 && \
    rc-update add docker boot && \
    service start docker
```
