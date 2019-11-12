##############
# Purpose
##############
# This recipe is to install PHP 7.0 on Ubuntu 16.04 via PPA  
# referance: https://tecadmin.net/install-php-7-on-ubuntu/
#

##############
# Dependecies
##############
#

# install python-software-properties
apt_package 'software-properties-common' do
  package_name  'software-properties-common'
  action :install
end

# add ppa repository 
apt_repository 'ondrej-php' do
  uri          'ppa:ondrej/php'
  distribution node['lsb']['codename']
  action :add
end

# do update
apt_update 'update'

# install php package via ppa
apt_package 'php' do
  package_name  'php7.0'
  action :install
end