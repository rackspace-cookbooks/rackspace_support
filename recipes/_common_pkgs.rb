#
# Cookbook Name:: rackspace_support
# Recipe:: _common_pkgs
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

common_pkgs = %w(
  sysstat
  dstat
  screen
  curl
  telnet
  traceroute
  mtr
  zip
  lsof
  strace
  git
)

case node['platform_family']
when 'debian'
  common_pkgs.concat(%w(vim htop tmux))
  include_recipe 'apt'
when 'rhel'
  common_pkgs.push('vim-minimal')
end

common_pkgs.each do |pkg|
  package pkg do
    action :install
  end
end

# enable systat on Debian based platforms
file '/etc/default/sysstat' do
  only_if { node['platform_family'] == 'debian' }
  action :create
  content 'ENABLED="true"'
  mode 0644
  owner 'root'
  group 'root'
end
