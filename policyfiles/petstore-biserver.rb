
# Where to find external cookbooks:
default_source :supermarket
default_source :chef_repo, '../..'

# Specify a custom source for a single cookbook

# run_list: chef-client will run these recipes in the order specified.
run_list(
    "recipe[chef-client]",
)

