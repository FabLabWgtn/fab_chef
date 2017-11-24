#
# Cookbook:: fab_apps
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
apt_update 'Update the apt cache daily' do
  frequency 86_400
  action :periodic
end

apt_package 'nano' do
    action :install
end

apt_package 'vim' do
    action :install
end

apt_package 'g++' do
    action :install
end

apt_package 'gcc' do
    action :install
end

apt_package 'make' do
    action :install
end

apt_package 'cmake' do
    action :install
end

apt_package 'meshlab' do
    action :install
end

apt_package 'slic3r' do
    action :install
end

apt_package 'git' do
    action :install
end

apt_repository 'cura' do
  uri          'ppa:thopiekar/cura'
  components ['main']
end

apt_repository 'brackets' do
  uri          'ppa:webupd8team/brackets'
  components ['main']
end

apt_repository 'atom' do
  uri          'ppa:webupd8team/atom'
  components ['main']
end

apt_repository 'simplescreenrecorder' do
  uri          'ppa:maarten-baert/simplescreenrecorder'
  components ['main']
end

apt_package 'vlc' do
    action :install
end

apt_package 'pandoc' do
    action :install
end

apt_package 'gcc-avr' do
    action :install
end

apt_package 'avr-libc' do
    action :install
end

apt_package 'avrdude' do
    action :install
end

apt_package 'openscad' do
    action :install
end

apt_package 'inkscape' do
    action :install
end

apt_package 'gimp' do
    action :install
end

apt_package 'cura' do
    action :install
end

apt_package 'cura-plugins-all' do
    action :install
end

apt_package 'atom' do
    action :install
end

apt_package 'brackets' do
    action :install
end

apt_package 'simplescreenrecorder' do
    action :install
end

#Xenial Xerus
#vlc pandoc gcc-avr avr-libc avrdude openscad inkscape gimp blender

#sudo add-apt-repository -y ppa:thopiekar/cura
#sudo apt-get -y install cura cura-plugins-all
#sudo add-apt-repository -y ppa:webupd8team/atom
#sudo apt-get -y install atom
#sudo add-apt-repository -y ppa:webupd8team/brackets
#sudo apt-get install -y brackets
#sudo add-apt-repository -y ppa:maarten-baert/simplescreenrecorder
#sudo apt-get -y install simplescreenrecorder
#sudo add-apt-repository -y ppa:js-reynaud/kicad-4
#sudo apt-get -y install kicad
