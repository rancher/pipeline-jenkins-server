FROM jenkins/jenkins:2.107-slim
ENV ADMIN_USER=admin
ENV ADMIN_PASSWORD=admin
COPY config.xml /usr/share/jenkins/ref/config.xml
COPY scriptApproval.xml /usr/share/jenkins/ref/scriptApproval.xml
COPY init.groovy /usr/share/jenkins/ref/init.groovy.d/init.groovy
COPY setup.sh /usr/local/bin/setup.sh
COPY jenkins.war /usr/share/jenkins/jenkins.war
COPY jenkins_home/ /usr/share/jenkins/jenkins_home
USER root
ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/setup.sh"]
RUN rm /usr/share/jenkins/ref/init.groovy.d/tcp-slave-agent-port.groovy && \
    chown -R jenkins /usr/share/jenkins/ref && \
    chown -R jenkins /usr/share/jenkins/jenkins_home && \
    ls -l /usr/share/jenkins/jenkins_home
USER jenkins
