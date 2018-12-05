#
# Cookbook:: fabmodules
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

#Create fabmodules group and add admin to it

user 'fabmodules' do
    username 'fabmodules'
    group 'dialout'
    action :create
end

user 'fab-admin' do
    username 'fab-admin'
    group 'dialout'
    action :create
end

group 'fab-admin' do
  append true
  group_name 'fab-admin'
  members ['fab-admin']
  action :create
end

group 'fabmodules' do
  append true
  group_name 'fabmodules'
  members ['fab-admin','fabmodules']
  action :create
end

#install dependencies
apt_repository 'nodejs' do
  uri        'https://deb.nodesource.com/node_8.x'
  components ['main']
  key 'https://deb.nodesource.com/gpgkey/nodesource.gpg.key'
  keyserver 'deb.nodesource.com'
end

apt_update

apt_package 'nodejs' do #includes npm
    action :install
end

apt_package 'build-essential' do
    action :install
end

apt_package 'moreutils' do
    action :install
end

execute 'install npm dependants' do
  command 'npm install node-static serve-static ws'
end

apt_package 'cups-bsd' do
    action :install
end

apt_package 'python-serial' do
    action :install
end

apt_package 'python-tk' do
    action :install
end

apt_package 'python-pip' do
    action :install
end

apt_package 'wget' do
    action :install
end

#Install fabmodules
git '/opt/fabmodules' do
  repository 'https://github.com/FabLabWgtn/fabmodules-html5'
  revision 'master'
  depth 1
  action :checkout
end

directory '/opt/fabmodules' do
  owner 'root'
  group 'fabmodules'
  mode '0775'
  action :create
end

directory '/opt/fabmodules/mod_server' do
  owner 'root'
  group 'fabmodules'
  mode '0775'
  action :create
end

directory '/var/log/fabmodules' do
  owner 'root'
  group 'fabmodules'
  mode '0775'
  action :create
end

file '/var/log/fabmodules/mod_server.log' do
  mode '0775'
  owner 'root'
  group 'fabmodules'
end

#Create system service to auto luanch fabmodules
template '/usr/local/bin/fabmodules-local.sh' do
  source 'fabmodules-local.sh.erb'
  owner 'root'
  group 'root'
  mode '0744'
  action :create
end

template '/etc/systemd/system/fablocal.service' do
  source 'fablocal.service.erb'
  owner 'root'
  group 'root'
  mode '0664'
  action :create
end

template '/usr/local/bin/fabmodules-node.sh' do
  source 'fabmodules-node.sh.erb'
  owner 'root'
  group 'root'
  mode '0744'
  action :create
end

template '/etc/systemd/system/fabnode.service' do
  source 'fabnode.service.erb'
  owner 'root'
  group 'root'
  mode '0664'
  action :create
end

#add desktop shortcut for guest users
%w[ /etc/guest-session /etc/guest-session/skel /etc/guest-session/skel/Desktop ].each do |path|
  directory path do
    owner 'root'
    group 'root'
    mode '0755'
  end
end

template '/etc/guest-session/skel/Desktop/fabmodules.desktop' do
  source 'shortcut_fabmodules.desktop.erb'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
