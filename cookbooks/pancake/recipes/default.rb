#
# Cookbook Name:: pancake
# Recipe:: default
#
# Copyright 2017, swiggy foods
#
# All rights reserved - Do Not Redistribute
#
# resource name 'item' do
# custom defination
# attributes of the resources
#end


file '/tmp/dummy.txt' do
	content 'This files is created by chef..'
	mode 0644
	owner 'root'	
	group 'root'
end

directory '/opt/tomcat' do
mode 0755
owner 'root'
group 'root'
end
