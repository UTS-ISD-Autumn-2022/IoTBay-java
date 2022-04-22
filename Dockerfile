FROM gradle:jdk11 AS builder

COPY . /out
WORKDIR /out
RUN gradle war

FROM quay.io/wildfly/wildfly:latest

COPY --from=builder /out/build/libs/IoTBay-1.0-SNAPSHOT.war /opt/jboss/wildfly/standalone/deployments/
RUN /opt/jboss/wildfly/bin/add-user.sh adminuser Password#123 --silent

CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
