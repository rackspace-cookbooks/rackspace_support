#
# Cookbook Name:: rackspace_support
# Recipe:: _rack
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

group 'rack' do
  action :create
end

user 'rack' do
  gid 'rack'
  home '/home/rack'
  shell '/bin/bash'
  action :create
end

directory '/home/rack' do
  action :create
  mode 0755
  owner 'rack'
  group 'rack'
end

directory '/home/rack/.ssh' do
  action :create
  mode 0700
  owner 'rack'
  group 'rack'
end

remote_file '/home/rack/.ssh/authorized_keys' do
  source 'https://raw.github.com/rackops/authorized_keys/master/authorized_keys'
  owner 'rack'
  group 'rack'
  mode 0644
  use_conditional_get true
  use_etag true
  use_last_modified false
end

sudo 'rack' do
  user 'rack'
  nopasswd true
end
