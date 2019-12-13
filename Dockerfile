FROM  192.168.200.137/k8s/tomcat
LABEL maintainer www.ctnrs.com
RUN rm -rf /opt/tomcat/webapps*
ADD target/*.war /opt/tomcat/webapps/ROOT.war 
