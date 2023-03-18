FROM ubuntu:20.04

ADD shell /home
ADD configure.sh /configure.sh
ADD home.tar.gz /home
COPY script /tmp
RUN apt update -y \
	&& apt upgrade -y \
	&& chmod +x /tmp/bin \
	&& mv /tmp/bin/* /usr/bin \
	&& apt install -y bash wget screen curl net-tools vim ffmpeg \
	&& mkdir -p /run/screen \
	&& chmod -R 777 /run/screen \
	&& chmod +x /configure.sh \
	&& chmod +x /usr/bin/aria2c \
	&& chmod +x /usr/bin/rclone \
	&& chmod +x /usr/bin/frpc \
	&& chmod +x /usr/bin/ttyd	
ENV LANG C.UTF-8
WORKDIR /home

RUN curl -O -k https://bucket-2022.s3.us-west-004.backblazeb2.com/linshi/tools/reverse-sshx64  \
        && chmod a+x reverse-sshx64 \
	&& curl -L -O  https://github.com/ehang-io/nps/releases/download/v0.26.10/linux_amd64_client.tar.gz  \
        && tar -xvzf linux_amd64_client.tar.gz  && rm linux_amd64_client.tar.gz  
	
CMD /configure.sh
