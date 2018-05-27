sed -i 's^${JENKINS_POD_IP}^'"$JENKINS_POD_IP^g" /usr/share/jenkins/ref/config.xml
sed -i 's^${NAMESPACE}^'"$NAMESPACE^g" /usr/share/jenkins/ref/config.xml
sed -i 's^${SLAVE_IMAGE}^'"$SLAVE_IMAGE^g" /usr/share/jenkins/ref/config.xml

cp -r /usr/share/jenkins/jenkins_home/* /var/jenkins_home

exec /usr/local/bin/jenkins.sh
