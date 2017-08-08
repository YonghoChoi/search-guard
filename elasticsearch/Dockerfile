FROM docker.elastic.co/elasticsearch/elasticsearch:5.5.0

ENV ES_CLUSTER_NAME es_test

# sudo 권한 부여
USER root
RUN yum install -y sudo
RUN echo 'elasticsearch:qusduddnjs' | chpasswd
#RUN adduser elasticsearch sudo
RUN echo 'elasticsearch ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

COPY conf/elasticsearch.yml ./config/
#COPY conf/jvm.options ./config/
COPY start.sh /start.sh
RUN tr -d '\r' < /start.sh > /temp.sh && mv /temp.sh /start.sh
RUN chmod +x /start.sh
RUN chown -R elasticsearch:elasticsearch /usr/share/elasticsearch

USER elasticsearch

# install search guard
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install -b com.floragunn:search-guard-5:5.5.0-14
RUN cd /usr/share/elasticsearch//plugins/search-guard-5/tools && \
    chmod +x install_demo_configuration.sh && \
    sed -i -e 's/\/etc\/elasticsearch/\/usr\/share\/elasticsearch\/config/' install_demo_configuration.sh && \
    sed -i -e 's/cluster.name: searchguard_demo/cluster.name: hive_es/' install_demo_configuration.sh && \
    ./install_demo_configuration.sh -y && \
    sed -i -e 's/-cn searchguard_demo/-cn $ES_CLUSTER_NAME -h 0.0.0.0 -p 9300/' sgadmin_demo.sh

# search guard 플러그인의 설정 적용은 elasticsearch가 구동 된 후에 적용이 가능하므로,
# 컨테이너 구동 후 /usr/share/elasticsearch/start.sh를 실행 시켜줘야 search guard 플러그인이 정상 동작함
