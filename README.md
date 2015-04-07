rackspace_support Cookbook
===========================
Enables a node to be supported by Rackspace.

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
