# InSpec test for recipe webserver_test::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

describe package('php7.0') do
  it { should be_installed }
  its('version') { should cmp >= '7.0.33-11+ubuntu16.04.1+deb.sury.org+1' }
end

