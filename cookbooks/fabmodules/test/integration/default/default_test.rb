# # encoding: utf-8

# Inspec test for recipe fabmodules::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe user('fabmodules') do
  it { should exist }
  its('groups') { should include 'fabmodules' }
  its('groups') { should include 'dialout' }
end

describe user('fab-admin') do
  it { should exist }
  its('groups') { should include 'fabmodules' }
  its('groups') { should include 'fab-admin' }
  its('groups') { should include 'dialout' }
end

describe group('fabmodules') do
  it { should exist }
end
describe group('dialout') do
  it { should exist }
end

describe apt('https://deb.nodesource.com/node_8.x') do
  it { should exist }
  it { should be_enabled }
end

describe package('nodejs') do
  it { should be_installed }
end

describe package('moreutils') do
  it { should be_installed }
end

describe package('python-serial') do
  it { should be_installed }
end

describe package('python-tk') do
  it { should be_installed }
end

describe package('python-pip') do
  it { should be_installed }
end

describe package('wget') do
  it { should be_installed }
end


describe npm('node-static') do
  it { should be_installed }
end

describe npm('serve-static') do
  it { should be_installed }
end

describe npm('ws') do
  it { should be_installed }
end

describe file('/opt/fabmodules') do
 it { should exist }
 its('group') { should eq 'fabmodules' }
 it { should be_directory }
 its('mode') { should cmp '0775' }
end

describe file('/opt/fabmodules/mod_server') do
 it { should exist }
 its('group') { should eq 'fabmodules' }
 it { should be_directory }
 its('mode') { should cmp '0775' }
end

describe file('/var/log/fabmodules/mod_server.log') do
 it { should exist }
 its('group') { should eq 'fabmodules' }
 its('mode') { should cmp '0775' }
end

describe file('/usr/local/bin/fabmodules-node.sh') do
 it { should exist }
 its('group') { should eq 'root' }
 its('mode') { should cmp '0744' }
end

describe file('/etc/systemd/system/fabnode.service') do
 it { should exist }
 its('group') { should eq 'root' }
 its('mode') { should cmp '0664' }
end
