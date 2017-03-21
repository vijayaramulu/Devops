#
# Cookbook Name:: cbk-tomoat
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# This recipe  will install tomcat web server..
#
# All rights reserved - Do Not Redistribute



#package 'epel-release'

#execute 'sudo yum update -y && sudo reboot'

package 'java-1.8.0-openjdk.x86_64'

group 'tomcat'

user 'tomcat' do
        shell '/bin/nologin'
        group 'tomcat'
        home '/opt/tomcat'
end


directory 'opt/tomcat' do
	mode 0775
	owner 'tomcat'
	group 'tomcat'
end


directory 'opt/tomcat/bin' do
        mode 0775
        owner 'tomcat'
        group 'tomcat'
end

bash 'install_tomcat' do
  user 'tomcat'
  cwd '/opt/tomcat'
  code <<-EOH
  wget http://mirror.fibergrid.in/apache/tomcat/tomcat-8/v8.5.12/bin/apache-tomcat-8.5.12.tar.gz
  tar -zxf apache-tomcat-8.5.12.tar.gz -C /opt/tomcat --strip-components=1
  EOH
end

file '/etc/systemd/system/tomcat.service' do
	content='[Unit]
Description=Apache Tomcat Web Application Container
After=syslog.target network.target

[Service]
Type=forking

Environment=JAVA_HOME=/usr/lib/jvm/jre
Environment=CATALINA_PID=/opt/tomcat/temp/tomcat.pid
Environment=CATALINA_HOME=/opt/tomcat
Environment=CATALINA_BASE=/opt/tomcat
Environment=\'CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC\'
Environment=\'JAVA_OPTS=-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom\'

ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/bin/kill -15 $MAINPID

User=tomcat
Group=tomcat

[Install]
WantedBy=multi-user.target
'
end

bash 'Run_tomcat_StartUp' do 
      cwd '/opt/tomcat/bin'
      code <<-EOH
      ./startup.sh
	EOH
end

service 'tomcat' do
      action [:enable, :start]
end
