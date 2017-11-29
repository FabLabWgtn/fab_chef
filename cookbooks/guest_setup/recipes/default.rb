#
# Cookbook:: guest_setup
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

group 'fabshare' do
    action :create
end

directory '/var/guest-data' do
  owner 'root'
  group 'fabshare'
  mode '0777'
  action :create
end

%w[ /etc/guest-session /etc/guest-session/skel /etc/guest-session/skel/Desktop /etc/guest-session/skel/.config /etc/guest-session/skel/.config/upstart /etc/guest-session/skel/.config/gtk-3.0 ].each do |path|
  directory path do
    owner 'root'
    group 'root'
    mode '0755'
  end
end

template '/etc/guest-session/prefs.sh' do
  source 'guest_prefs.txt.erb'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
  variables({
      :wireless => node['networking']['wireless'],
      :wired => node['networking']['wired']
  })
end


template '/etc/guest-session/auto.sh' do
  source 'welcome_message.txt.erb'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

template '/etc/guest-session/skel/.config/upstart/firefox-with-url.conf' do
  source 'captive_portal.conf.erb'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

file '/etc/guest-session/skel/.skip-guest-warning-dialog' do
  content ''
  mode '0655'
  owner 'root'
  group 'root'
  action :create
end

file '/etc/guest-session/skel/.config/gtk-3.0/bookmarks' do
  content 'file:///var/guest-data'
  mode '0655'
  owner 'root'
  group 'fabshare'
  action :create
end

mount '/var/guest-data' do
  device node['filesystem']['guest-data']
  fstype 'ntfs-3g'
  action :enable
end

link '/etc/guest-session/skel/Desktop/guest-data' do
  to '/var/guest-data'
end

link '/etc/guest-session/skel/guest-data' do
  to '/var/guest-data'
end

template '/etc/guest-session/skel/Desktop/cura.desktop' do
  source 'shortcut_cura.desktop.erb'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

template '/etc/guest-session/skel/Desktop/atom.desktop' do
  source 'shortcut_atom.desktop.erb'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

template '/etc/guest-session/skel/Desktop/brackets.desktop' do
  source 'shortcut_brackets.desktop.erb'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

template '/etc/guest-session/skel/Desktop/eagle.desktop' do
  source 'shortcut_eagle.desktop.erb'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

template '/etc/guest-session/skel/Desktop/kicad.desktop' do
  source 'shortcut_kicad.desktop.erb'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
