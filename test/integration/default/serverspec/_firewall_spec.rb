# Encoding: utf-8

require 'spec_helper'

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
  describe iptables do
    it { should have_rule("-A INPUT -s #{bast_range} -p tcp -m tcp -m comment --comment \"Bastion Access\" -j ACCEPT") }
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
  describe iptables do
    it { should have_rule("-A INPUT -s #{cmon_range} -p tcp -m tcp -m comment --comment \"Cloud Monitoring Access\" -j ACCEPT") }
  end
end

# Rackspace Support Access
%w(
  50.56.230.0/24
  50.56.228.0/24
).each do |sup_range|
  describe iptables do
    it { should have_rule("-A INPUT -s #{sup_range} -p tcp -m tcp -m comment --comment \"Rackspace Support Access\" -j ACCEPT") }
  end
end
