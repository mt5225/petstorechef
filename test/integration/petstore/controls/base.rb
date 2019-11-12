# InSpec test for recipe webserver_test::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

control "php-fpm package installed" do
  impact 1.0
  describe package('php7.0-fpm') do
    it { should be_installed }
    its('version') { should cmp >= '7.0.33-11+ubuntu16.04.1+deb.sury.org+1' }
  end
end

control "all services are up" do
  impact 1.0
  %w(memcached nginx php7.0-fpm).each do |item|
    describe service(item) do
      it { should be_enabled }
      it { should be_running }
    end
  end
end