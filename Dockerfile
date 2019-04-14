FROM jenkins/jenkins:2.164.1-slim
ENV ADMIN_USER=admin
ENV ADMIN_PASSWORD=admin

COPY config.xml /usr/share/jenkins/ref/config.xml
COPY scriptApproval.xml /usr/share/jenkins/ref/scriptApproval.xml
COPY init.groovy /usr/share/jenkins/ref/init.groovy.d/init.groovy
COPY setup.sh /usr/local/bin/setup.sh
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

USER root
RUN rm /usr/share/jenkins/ref/init.groovy.d/tcp-slave-agent-port.groovy && \
    chown -R jenkins /usr/share/jenkins/ref
USER jenkins

ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/setup.sh"]
