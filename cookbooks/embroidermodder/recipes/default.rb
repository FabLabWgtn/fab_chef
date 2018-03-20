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
git '/opt/inkstitch' do
  repository 'https://github.com/lexelby/inkstitch'
  action :checkout
  revision 'master'
  notifies :run, "bash[install_inkstitch]", :immediately
 end

#install dependencies and switch to tested working version
bash "install_inkstitch" do
  user "root"
  cwd "/opt/inkstitch"
  code <<-EOH
  git checkout 30cbe18
  chown -R fab-admin:fab-admin *
  pip2 install --no-cache-dir -r requirements.txt
  EOH
  action :nothing
end

#TODO: Build from precompiled source once it becomes more stable
#remote_file "/opt/inkstitch/inkstitch-v1.1.0-Linux-x86_64.tar.gz" do
#  source "https://github.com/lexelby/inkstitch/releases/download/v1.1.0/inkstitch-v1.1.0-Linux-x86_64.tar.gz"
#  checksum 'fd87b314bdb6843dba74742402c7cc9b6a71a8114954a17dd4f908b796a7554a'
#  notifies :run, "bash[install_inkstitch]", :immediately
#end
# tar -zxf /opt/inkstitch/inkstitch-v1.1.0-Linux-x86_64.tar.gz

#make folders to install inkscape folders for guest users
%w[ /etc/guest-session /etc/guest-session/skel /etc/guest-session/skel/.config /etc/guest-session/skel/.config/inkscape /etc/guest-session/skel/.config/inkscape/extensions ].each do |path|
  directory path do
    owner 'root'
    group 'root'
    mode '0755'
  end
end

#symlink inkscape extension to inkstitch files
link '/etc/guest-session/skel/.config/inkscape/extensions/inkstitch' do
  to '/opt/inkstitch'
end

link '/etc/guest-session/skel/.config/inkscape/extensions/embroider.inx' do
  to '/opt/inkstitch/embroider.inx'
end

link '/etc/guest-session/skel/.config/inkscape/extensions/embroider.inx' do
  to '/opt/inkstitch/embroider.inx'
end

link '/etc/guest-session/skel/.config/inkscape/extensions/embroider.py' do
  to '/opt/inkstitch/embroider.py'
end

link '/etc/guest-session/skel/.config/inkscape/extensions/embroider_update.inx' do
  to '/opt/inkstitch/embroider_update.inx'
end

link '/etc/guest-session/skel/.config/inkscape/extensions/embroider_params.inx' do
  to '/opt/inkstitch/embroider_params.inx'
end

link '/etc/guest-session/skel/.config/inkscape/extensions/embroider_simulate.inx' do
  to '/opt/inkstitch/embroider_simulate.inx'
end

link '/etc/guest-session/skel/.config/inkscape/extensions/embroider_update.py' do
  to '/opt/inkstitch/embroider_update.py'
end

link '/etc/guest-session/skel/.config/inkscape/extensions/embroider_params.py' do
  to '/opt/inkstitch/embroider_params.py'
end

link '/etc/guest-session/skel/.config/inkscape/extensions/embroider_simulate.py' do
  to '/opt/inkstitch/embroider_simulate.py'
end
