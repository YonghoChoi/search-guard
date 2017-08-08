FROM docker.elastic.co/logstash/logstash:5.5.0

ENV ES_HOST localhost:9200
ENV ES_INDEX_NAME hive_server

# sudo 권한 부여
USER root
RUN yum install -y sudo wget
RUN echo 'logstash:qusduddnjs' | chpasswd
RUN echo 'logstash ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# 설정 파일 복사. (truststore는 es에 https로 접근하기 위한 인증서 파일)
COPY conf/logstash.yml /usr/share/logstash/config/
COPY conf/truststore.jks /usr/share/logstash/config/
COPY conf/logstash.conf /usr/share/logstash/pipeline/default.conf
