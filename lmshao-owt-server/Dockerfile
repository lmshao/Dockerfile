################################
# lmshao/owt-server
# Base image Ubuntu 18.04

FROM ubuntu:18.04

MAINTAINER LimingSHAO <lmshao@163.com>

ENV LOG_LEVEL=INFO

# Update the system
RUN apt-get update && apt install -y curl rabbitmq-server mongodb-server libboost-system-dev libboost-thread-dev liblog4cxx-dev libglib2.0-0 libfreetype6-dev intel-gpu-tools gstreamer-1.0

WORKDIR /root/
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash && . ~/.nvm/nvm.sh && nvm install 10.21.0

COPY ./dist /root/dist

WORKDIR /root/dist/
RUN cp video_agent/lib/* audio_agent/lib/ && \
    cp video_agent/lib/* recording_agent/lib/ && \
    cp video_agent/lib/* streaming_agent/lib/

RUN mv /bin/versions/ /root/.nvm/ && echo 'nvm use 10.21.0' >> /root/.bashrc

COPY ./entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/entrypoint.sh && rm -rf /var/cache/apt/* /tmp/*

EXPOSE 3000 3004 8080 3300

CMD ["entrypoint.sh"]
