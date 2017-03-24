#
# Cookbook:: awesome_customers_rhel
# Recipe:: firewall
#
# Copyright:: 2017, The Authors, All Rights Reserved
#
#
#
include_recipe 'firewall::default'

#ports = [22, 80]
ports = node['awesome_customers_rhel']['open_ports']
firewall_rule "open ports #{ports}" do
	port ports
end

firewall 'default' do
	action :save
end
