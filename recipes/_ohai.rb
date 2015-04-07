#
# Cookbook Name:: rackspace_support
# Recipe:: _ohai
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

# Run all of this during compile time
include_recipe 'ohai'

directory node['ohai']['plugin_path'] do
  owner 'root'
  group 'root'
  mode 0755
  recursive true
end.run_action :create

remote_file ::File.join(node['ohai']['plugin_path'], 'rackconnect.rb') do
  source 'https://raw.githubusercontent.com/rackerlabs/ohai-plugins/master/plugins/rackconnect.rb'
  owner 'root'
  group 'root'
  mode 0755
  action :nothing
end.run_action :create

remote_file ::File.join(node['ohai']['plugin_path'], 'public_info.rb') do
  source 'https://raw.githubusercontent.com/rackspace-cookbooks/platformstack/master/files/default/public_info.rb'
  owner 'root'
  group 'root'
  mode 0755
  action :nothing
end.run_action :create

ohai('reload_ohai_for_rs').run_action :reload
