#
# Cookbook Name:: rackspace_support
# Recipe:: default
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

node.default['authorization']['sudo']['include_sudoers_d'] = true

%w(
  rackspace_support::_ohai
  rackspace_support::_common_pkgs
  sudo
  rackspace_support::_rack
  chef-sugar-rackspace
).each do |recipe|
  include_recipe recipe
end

if rackconnected?
  sudo 'rackconnect' do
    user 'rackconnect'
    nopasswd true
  end
end

unless rackconnected? || node['rackspace_support']['ignore_firewall']
  include_recipe 'rackspace_support::_firewall'
end

remoteip = node.deep_fetch('public_info', 'remote_ip')
if remoteip =~ /[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/
  # Assign the external_ip tag to the node if node['public_info']['remote_ip'] looks like an IP.
  tag("RemoteIP:#{remoteip}")
end
