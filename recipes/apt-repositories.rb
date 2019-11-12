apt_repositories = node['apt_repositories']

# loop through apt_repositories
apt_repositories.each_key do |apt_repository|
  # create apt_repository
  apt_repository apt_repository do
    apt_repositories[apt_repository].each { |property, value| send(property, value) }
  end
end # end of loop through apt_repositories