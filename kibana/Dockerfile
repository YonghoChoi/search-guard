FROM docker.elastic.co/kibana/kibana:5.5.0

# sudo 권한 부여
USER root
RUN yum install -y sudo wget
RUN echo 'kibana:qusduddnjs' | chpasswd
#RUN adduser elasticsearch sudo
RUN echo 'kibana ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# install logtrail
RUN kibana-plugin install https://github.com/sivasamyk/logtrail/releases/download/v0.1.17/logtrail-5.5.0-0.1.17.zip

# install search guard
RUN wget -O /opt/searchguard-kibana.zip https://github.com/floragunncom/search-guard-kibana-plugin/releases/download/v5.5.0-3/searchguard-kibana-5.5.0-3.zip
RUN kibana-plugin install file:///opt/searchguard-kibana.zip

COPY conf/kibana.yml /usr/share/kibana/config/kibana.yml
