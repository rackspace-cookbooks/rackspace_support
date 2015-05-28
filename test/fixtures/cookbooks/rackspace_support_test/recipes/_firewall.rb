#
# rackspace_support::_firewall fixture test
firewall 'iptables' do
  action :enable
  provider Chef::Provider::FirewallIptables
end

include_recipe 'rackspace_support::_firewall'
