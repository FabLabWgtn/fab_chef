#
# Cookbook:: avr_programming
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

apt_package 'gcc-avr' do
    action :install
end

apt_package 'avr-libc' do
    action :install
end

apt_package 'avrdude' do
    action :install
end

group 'fab-admin' do
    action :create
end

user 'fab-admin' do
    username 'fab-admin'
    group 'fab-admin'
    action :create
end

group 'dialout' do
  action :manage
  append true
  members ['fab-admin']
end
