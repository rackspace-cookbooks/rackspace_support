name             'rackspace_support'
maintainer       'Rackspace'
maintainer_email 'rackspace-cookbooks@rackspace.com'
license          'Apache 2.0'
description      'Installs/Configures rackspace_support'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.4.0'

depends 'firewall'
depends 'ohai'
depends 'chef-sugar-rackspace'
depends 'sudo'
depends 'apt'
