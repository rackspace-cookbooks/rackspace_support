#
# Cookbook Name:: rackspace_support
# Recipe:: _firewall
#
# Copyright 2015, Rackspace
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Rackspace Bastion Access
%w(
  72.3.128.84/32
  69.20.0.1/32
  50.57.22.125/32
  120.136.34.22/32
  212.100.225.49/32
  212.100.225.42/32
  119.9.4.2/32
).each do |bast_range|
  firewall_rule "bastion_#{bast_range}" do
    provider Chef::Provider::FirewallRuleIptables
    source bast_range
    action :allow
    description 'Bastion Access'
  end
end

# Rackspace Cloud Monitoring Access
%w(
  50.56.142.128/26
  50.57.61.0/26
  78.136.44.0/26
  180.150.149.64/26
  69.20.52.192/26
  92.52.126.0/24
).each do |cmon_range|
  firewall_rule "cloud_monitoring_#{cmon_range}" do
    provider Chef::Provider::FirewallRuleIptables
    source cmon_range
    action :allow
    description 'Cloud Monitoring Access'
  end
end

%w(
  50.56.230.0/24
  50.56.228.0/24
).each do |sup_range|
  firewall_rule "support_#{sup_range}" do
    provider Chef::Provider::FirewallRuleIptables
    source sup_range
    action :allow
    description 'Rackspace Support Access'
  end
end
