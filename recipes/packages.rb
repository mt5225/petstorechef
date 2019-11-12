packages = node['packages'][node['platform_family']]

if node['platform_family'] != 'windows'
  # loop through packages
  packages.each_key do |package|
    package package do
      version packages[package]
    end
  end
end # end of os case