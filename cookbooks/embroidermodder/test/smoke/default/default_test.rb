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

describe file('/opt/Embroidermodder/embroidermodder2/embroidermodder2') do
 it { should exist }
 it { should be_file }
 it { should be_executable }
end

describe file('/usr/share/inkscape/extensions/inkstitch.py') do
 it { should exist }
  it { should be_file }
end
