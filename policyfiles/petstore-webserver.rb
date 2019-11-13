name 'petstore-webserver'

# Where to find external cookbooks:
default_source :supermarket
default_source :chef_repo, '../..'

# Specify a custom source for a single cookbook

# run_list: chef-client will run these recipes in the order specified.
run_list(
    "recipe[chef-client]",
    "recipe[petstorechef::apt-repositories]",
    "recipe[petstorechef::packages]",
    "recipe[petstorechef::petstoresrv]",
  )

  ## Repositories
default["apt_repositories"] = {
    "php7.0-fpm" => {
      "uri" => "ppa:ondrej/php",
    },
    "nginx" => {
      "uri" => "ppa:nginx/stable",
    },
  }

  default["packages"]["debian"] = {
    "memcached" => nil,
    "nginx" => nil,
    "wget" => nil,
    "php7.0-fpm" => nil,
    "php7.0-dev" => nil,
    "php7.0-xml" => nil,
    "php7.0-intl" => nil,
    "php7.0-memcached" => nil,
    "php7.0-mbstring" => nil,
    "php7.0-mysqli" => nil,
    "php7.0-mysqlnd" => nil,
    "php7.0-gd" => nil,
    "php7.0-pspell" => nil,
    "php7.0-zip" => nil,
    "php-igbinary" => nil,
  }

