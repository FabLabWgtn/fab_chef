# # encoding: utf-8

# Inspec test for recipe embroidermodder::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe package('python-wxgtk3.0') do
  it { should be_installed }
end

describe package('inkscape') do
  it { should be_installed }
end

describe package('libgtk-3-dev') do
  it { should be_installed }
end

describe package('build-essential') do
  it { should be_installed }
end

describe package('python-pip') do
  it { should be_installed }
end

describe package('unzip') do
  it { should be_installed }
end

describe package('qt4-dev-tools') do
  it { should be_installed }
end

describe package('libqt4-opengl-dev') do
  it { should be_installed }
end

describe package('kdelibs5-dev') do
  it { should be_installed }
end

describe package('valgrind') do
  it { should be_installed }
end

describe file('/opt/Embroidermodder') do
 it { should exist }
 its('type') { should eq :directory }
 it { should be_directory }
end

describe file('/opt/inkstitch') do
 it { should exist }
 its('type') { should eq :directory }
 it { should be_directory }
end


describe file('/opt/inkstitch/embroider.py') do
  its('owner') { should eq 'fab-admin' }
  it { should be_file }
end

describe file('/opt/Embroidermodder/embroidermodder2/embroidermodder2') do
 it { should exist }
 it { should be_file }
 it { should be_executable }
end

describe file('/etc/guest-session/skel/.config/inkscape/extensions/inkstitch') do
    its('link_path') { should eq '/opt/inkstitch' }
end

describe file('/etc/guest-session/skel/.config/inkscape/extensions/embroider.inx') do
    its('link_path') { should eq '/opt/inkstitch/embroider.inx' }
end

describe file('/etc/guest-session/skel/.config/inkscape/extensions/embroider.py') do
    its('link_path') { should eq '/opt/inkstitch/embroider.py' }
end

describe file('/etc/guest-session/skel/.config/inkscape/extensions/embroider_update.inx') do
    its('link_path') { should eq '/opt/inkstitch/embroider_update.inx' }
end

describe file('/etc/guest-session/skel/.config/inkscape/extensions/embroider_params.inx') do
    its('link_path') { should eq '/opt/inkstitch/embroider_params.inx' }
end

describe file('/etc/guest-session/skel/.config/inkscape/extensions/embroider_simulate.inx') do
    its('link_path') { should eq '/opt/inkstitch/embroider_simulate.inx' }
end

describe file('/etc/guest-session/skel/.config/inkscape/extensions/embroider_update.py') do
    its('link_path') { should eq '/opt/inkstitch/embroider_update.py' }
end

describe file('/etc/guest-session/skel/.config/inkscape/extensions/embroider_params.py') do
    its('link_path') { should eq '/opt/inkstitch/embroider_params.py' }
end

describe file('/etc/guest-session/skel/.config/inkscape/extensions/embroider_simulate.py') do
    its('link_path') { should eq '/opt/inkstitch/embroider_simulate.py' }
end
