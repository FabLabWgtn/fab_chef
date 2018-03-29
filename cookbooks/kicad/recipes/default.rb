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

%w[ /usr/share/kicad/ /usr/share/kicad/library/ /usr/share/kicad/modules/ ].each do |path|
  directory path do
    owner 'root'
    group 'root'
    mode '0755'
  end
end

template '/usr/share/kicad/library/fab.lib' do
  source 'fab.lib.erb'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

template '/usr/share/kicad/modules/fab.mod' do
  source 'fab.mod.erb'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

directory '/opt/kicad-libraries/' do
    owner 'root'
    group 'fab-admin'
    mode '0755'
    action :create
end

git '/opt/kicad-libraries/SparkFun-KiCad-Libraries' do
  repository 'https://github.com/sparkfun/SparkFun-KiCad-Libraries.git'
  revision 'master'
  depth 1
  action :sync
end

git '/opt/kicad-libraries/digikey-kicad-library' do
  repository 'https://github.com/digikey/digikey-kicad-library.git'
  revision 'master'
  depth 1
  action :sync
end

%w[ /etc/guest-session /etc/guest-session/skel /etc/guest-session/skel/.config /etc/guest-session/skel/.config/kicad/ ].each do |path|
  directory path do
    owner 'root'
    group 'root'
    mode '0775'
  end
end

link '/usr/share/kicad/modules/SparkFun-KiCad-Modules' do
  to '/opt/kicad-libraries/SparkFun-KiCad-Libraries/Footprints'
end

link '/usr/share/kicad/library/SparkFun-KiCad-Libraries' do
  to '/opt/kicad-libraries/SparkFun-KiCad-Libraries/Libraries'
end

link '/usr/share/kicad/modules/digikey-footprints.pretty' do
  to '/opt/kicad-libraries/digikey-kicad-library/digikey-footprints.pretty'
end

link '/usr/share/kicad/library/digikey-symbol' do
  to '/opt/kicad-libraries/digikey-kicad-library/digikey-symbols'
end

template '/etc/guest-session/skel/.config/kicad/fp_lib_table' do
  source 'fp_lib_table.erb'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end
