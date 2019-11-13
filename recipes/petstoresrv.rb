  ## modify system limits
  bash "insert_line_to_limits" do
    code <<-EOH
        echo "* - nofile 65535" >> /etc/security/limits.conf
      EOH
  end
  
  ## enable and start services
  %w(memcached php7.0-fpm nginx).each do |service|
    service service do
      action [:enable, :start]
    end
  end