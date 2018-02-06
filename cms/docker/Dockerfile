#
#		 Licensed to the Apache Software Foundation (ASF) under one or more contributor license
#        agreements. See the NOTICE file distributed with this work for additional information
#        regarding copyright ownership. The ASF licenses this file to you under the Apache License,
#        Version 2.0 (the "License"); you may not use this file except in compliance with the
#        License. You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
#        Unless required by applicable law or agreed to in writing, software distributed under the
#        License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
#        either express or implied. See the License for the specific language governing permissions
#        and limitations under the License.
#
# Apache Sling CMS Dockerfile
#
# https://github.com/whiteboard/cms/docker
#

# Pull base image.
FROM openjdk:8-jre
MAINTAINER dev@sling.apache.org

# Configure directories
WORKDIR /opt/sling
VOLUME /opt/sling/sling

# Setup Sling CMS
RUN mkdir -p /opt/sling
RUN wget https://repository.apache.org/content/repositories/snapshots/org/apache/sling/org.apache.sling.cms.builder/1.0.0-SNAPSHOT/org.apache.sling.cms.builder-1.0.0-20180205.233031-3.jar -O /opt/sling/org.apache.sling.cms.jar
ENV JAVA_OPTS -Xmx512m
ENV SLING_OPTS ''

# Configure Apache
RUN apt-get update 
RUN apt-get install apache2 -y
RUN mkdir -p /var/www/vhosts/sling-cms
RUN mkdir -p /var/www/vhosts/sling
RUN a2enmod proxy
RUN a2enmod proxy_http
COPY cms.conf /etc/apache2/sites-enabled
COPY site.conf /etc/apache2/sites-enabled

# Expose endpoints
EXPOSE 80 443

# Background Apache httpd and start Sling CMS
CMD exec service apache2 start & java $JAVA_OPTS -jar org.apache.sling.cms.jar $SLING_OPTS