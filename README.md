rackspace_support Cookbook
===========================
Enables a node to be supported by Rackspace.  Installs common
tools Rackspace support finds useful when debugging system
problems.

Note: This cookbook uses the firewall cookbook and will attempt
to manage your iptables unless the node is rackconnected.

Requirements
------------
#### cookbooks
- `firewall`
- `ohai`
- `chef-sugar-rackspace`
- `sudo`
- `apt`

Usage
-----
#### rackspace_support::default
Just include `rackspace_support` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[rackspace_support]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: TODO: List authors
