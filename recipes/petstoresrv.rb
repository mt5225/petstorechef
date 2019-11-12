  ## enable and start services
  %w(memcached php7.0-fpm nginx).each do |service|
    service service do
      action [:enable, :start]
    end
  end