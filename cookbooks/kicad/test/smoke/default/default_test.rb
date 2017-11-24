# # encoding: utf-8

# Inspec test for recipe kicad::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe apt('ppa:js-reynaud/kicad-4') do
    it { should exist }
    it { should be_enabled }
end

describe package('kicad') do
  it { should be_installed }
end

describe package('default-jdk') do
  it { should be_installed }
end

describe group('fab-admin') do
    it { should exist }
end

describe directory('/opt/FreeRouting') do
    it { should exist }
end

describe file('/opt/FreeRouting/deploy/run.sh') do
 it { should exist }
 it { should be_executable }
end

#sudo mkdir /opt/FreeRouting
#sudo chown fab-admin:fab-admin FreeRouting
#cd /opt/FreeRouting
#git clone --depth=1 https://github.com/Engidea/FreeRoutingNew.git .
