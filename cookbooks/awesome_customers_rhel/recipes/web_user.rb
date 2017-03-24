#
# Cookbook:: awesome_customers_rhel
# Recipe:: web_user
#
# Copyright:: 2017, The Authors, All Rights Reserved
#
#

#group 'web_admin'
group node['awesome_customers_rhel']['group']

#user 'web_admin' do
#	group 'web_admin'
#	system true
#	shell '/bin/bash'
#end

user node['awesome_customers_rhel']['user'] do
	group node['awesome_customers_rhel']['group']
	system true
	shell '/bin/bash'
end
