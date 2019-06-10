FROM centos
ENV PREFIX "/squid"
COPY installsquid.sh /installsquid.sh
RUN /installsquid.sh
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
EXPOSE 3128
ENTRYPOINT /usr/local/bin/entrypoint.sh
