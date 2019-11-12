name 'petstore-webserver'

# Where to find external cookbooks:
default_source :supermarket
default_source :chef_repo, '../..'



# Specify a custom source for a single cookbook:
cookbook 'chef-client', '~>15.4.45'


# run_list: chef-client will run these recipes in the order specified.
run_list (
    'recipe[petstorechef::petstore-webserver]',
)