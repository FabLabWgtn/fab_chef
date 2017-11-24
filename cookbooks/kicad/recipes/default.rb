#
# Cookbook:: kicad
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

apt_repository 'kicad' do
  uri          'ppa:js-reynaud/kicad-4'
  components ['main']
end

apt_package 'kicad' do
    action :install
end

apt_package 'default-jdk' do
    action :install
end

group 'fab-admin' do
    action :create
end

directory '/opt/FreeRouting' do
    owner 'root'
    group 'fab-admin'
    mode '0755'
    action :create
end

git '/opt/FreeRouting' do
  repository 'https://github.com/Engidea/FreeRoutingNew.git'
  revision 'master'
  depth 1
  action :sync
end
