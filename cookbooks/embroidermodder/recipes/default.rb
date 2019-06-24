#
# Cookbook:: embroidermodder
# Recipe:: default
#
# GNU GPLv3 Fab Lab Wgtn


#Update repositorys and install dependencies
apt_update 'Update all repositorys' do
  frequency 86_400
  action :periodic
end

apt_package 'python-wxgtk3.0' do
    action :install
end

apt_package 'inkscape' do
    action :install
end

apt_package 'libgtk-3-dev' do
    action :install
end

apt_package 'build-essential' do
    action :install
end

apt_package 'python-pip' do
    action :install
end

apt_package 'unzip' do
    action :install
end

apt_package 'qt4-dev-tools' do
    action :install
end

apt_package 'libqt4-opengl-dev' do
    action :install
end

apt_package 'kdelibs5-dev' do
    action :install
end

apt_package 'valgrind' do
    action :install
end

#check admin users exist
group 'fab-admin' do
    action :create
end

group 'fabshare' do
    action :create
end

user 'fab-admin' do
    username 'fab-admin'
    group 'fab-admin'
    action :create
end

#Create install folders
directory '/opt/Embroidermodder' do
    owner 'root'
    group 'fab-admin'
    mode '0755'
    action :create
end

directory '/opt/inkstitch' do
    owner 'root'
    group 'fab-admin'
    mode '0755'
    action :create
end

#download embroidermodder source
git '/opt/Embroidermodder' do
  repository 'https://github.com/Embroidermodder/Embroidermodder.git'
  revision 'master'
  depth 1
  action :sync
  notifies :run, "bash[install_embroider]", :immediately
end
#make and install embroidermodder
bash "install_embroider" do
  user "root"
  cwd "/opt/Embroidermodder"
  code <<-EOH
    cd project-files/qmake/ && qmake && make && make install
  EOH
  action :nothing
end

#download inkstitch source
remote_file "/opt/inkstitch/inkstitch-v1.24.0-linux-x86_64-en_US.tar.gz" do
   source "https://github.com/inkstitch/inkstitch/releases/download/v1.24.0/inkstitch-v1.24.0-linux-x86_64-en_US.tar.gz"
end

execute 'install inkstitch to extensions directory' do
  command 'tar -zxvf /opt/inkstitch/inkstitch-v1.24.0-linux-x86_64-en_US.tar.gz -C /usr/share/inkscape/extensions/'
end

#make folders to install inkscape folders for guest users
%w[ /etc/guest-session /etc/guest-session/skel /etc/guest-session/skel/.config /etc/guest-session/skel/.config/inkscape /etc/guest-session/skel/.config/inkscape/extensions ].each do |path|
  directory path do
    owner 'root'
    group 'root'
    mode '0755'
  end
end
