# -*- coding: utf-8 -*-

# debian (wheezy)
# ruby1.9.1 ruby1.9.1-dev build-essential libsqlite3-dev
execute 'apt-get update'
%w{
  build-essential
  libsqlite3-dev
  ruby1.9.1-dev
}.each do |pkg|
  package pkg
end

# install
gem_package 'mailcatcher'

user 'mailcatcher' do
  system true
  shell '/bin/false'
end

template '/etc/init.d/mailcatcher' do
  source 'service.erb'
  owner 'root'
  group 'root'
  mode '0755'
end

service 'mailcatcher' do
  action [:enable, :start]
end
