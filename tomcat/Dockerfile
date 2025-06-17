FROM tomcat:9.0-jre8-alpine
RUN sed -i 's/8080/8050/' /usr/local/tomcat/conf/server.xml 
RUN sed -i '19d' /usr/local/tomcat/webapps/host-manager/META-INF/context.xml
RUN sed -i '19d' /usr/local/tomcat/webapps/host-manager/META-INF/context.xml
RUN sed -i '19d' /usr/local/tomcat/webapps/manager/META-INF/context.xml
RUN sed -i '19d' /usr/local/tomcat/webapps/manager/META-INF/context.xml
RUN sed -i '/<\/tomcat-users>/d' /usr/local/tomcat/conf/tomcat-users.xml
RUN echo -e "<role rolename=\"manager-gui\"/>\n<role rolename=\"manager-script\"/>\n<user username=\"admin\" password=\"1234\" roles=\"manager-gui, manager-script\"/>\n </tomcat-users>" >> /usr/local/tomcat/conf/tomcat-users.xml
