FROM centos
ENV PREFIX "/squid"
COPY installsquid.sh /installsquid.sh
RUN /installsquid.sh
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
EXPOSE 8080
ENTRYPOINT /usr/local/bin/entrypoint.sh
