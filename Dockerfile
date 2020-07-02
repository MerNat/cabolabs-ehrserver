FROM java
ENV DEBIAN_FRONTEND noninteractive
# RUN apt-get update
# RUN apt-get install -y mysql-server

RUN curl -L https://github.com/grails/grails-core/releases/download/v3.3.10/grails-3.3.10.zip -o /grails.zip
RUN unzip /grails.zip -d /opt
ENV GRAILS_HOME /opt/grails-3.3.10
ENV PATH $GRAILS_HOME/bin:$PATH
ADD . /app

WORKDIR /app

# ENV GRAILS_HOME /opt/grails-2.5.6
# ENV PATH $GRAILS_HOME/bin:$PATH

EXPOSE 8090
RUN grails dependency-report
# RUN chmod +x /app/docker-entrypoint.sh
# Define default command.
# ENTRYPOINT ["/app/docker-entrypoint.sh"]
CMD ["grails", "prod", "-Dserver.port=8090", "run-app"]

