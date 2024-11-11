FROM ubuntu:22.04

RUN apt-get update && apt-get install -y curl
RUN curl https://chsrc.run/posix | bash
ENV PATH="/usr/local/bin:${PATH}"
RUN chsrc set ubuntu
RUN apt-get update && apt-get install -y unzip tar

COPY install_flyshadow.sh /usr/local/bin/install_flyshadow.sh
RUN chmod +x /usr/local/bin/install_flyshadow.sh
RUN /usr/local/bin/install_flyshadow.sh
COPY config.json /etc/flyshadow/

EXPOSE 6780

CMD ["/usr/local/bin/flyshadow_router"]
