#
# Cookbook Name:: web-server
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# Recipe for installing apache server



package 'httpd'

service 'httpd' do
	action [:enable, :start]
end

file '/var/www/html/index.html' do
	content 'welcome to the chef Automation'
	mode 0644
	owner 'root'
	group 'root'
end

