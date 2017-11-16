#
# Cookbook:: remove_default_apps
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

file '/usr/share/applications/ubuntu-amazon-default.desktop' do
    action :delete
end

apt_package 'gnome-mines' do
    action :purge
end

apt_package 'gnome-mahjongg' do
    action :purge
end

apt_package 'aisleriot' do
    action :purge
end

apt_package 'gnome-sudoku' do
    action :purge
end

apt_package 'thunderbird' do
    action :purge
end

apt_package 'transmission-gtk' do
    action :purge
end
