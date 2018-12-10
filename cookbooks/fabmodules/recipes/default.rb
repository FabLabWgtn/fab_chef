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


execute 'install node_modules' do
  command 'npm install /opt/fabmodules/'
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

#add desktop shortcut & startup script for guest users
%w[ /etc/guest-session /etc/guest-session/skel /etc/guest-session/skel/Desktop /etc/guest-session/skel/.config /etc/guest-session/skel/.config/autostart ].each do |path|
  directory path do
    owner 'root'
    group 'root'
    mode '0755'
  end
end

template '/usr/local/bin/fabmodules-start.sh' do
  source 'fabmodules-start.sh.erb'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

template '/etc/guest-session/skel/.config/autostart/fabmodules-autostart.desktop' do
  source 'fabmodules-autostart.desktop.erb'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

template '/etc/guest-session/skel/Desktop/fabmodules.desktop' do
  source 'shortcut_fabmodules.desktop.erb'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
