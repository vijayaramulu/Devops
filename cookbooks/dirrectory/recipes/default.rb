#
# Cookbook Name:: dirrectory
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#
#
#
%w[ /tmp/foo /tmp/foo/bar /tmp/foo/bar/baz ].each do |path|
  directory path do
	owner 'root'
	group 'root'
	mode '0755'
	action :create
	recursive true
  end
end
