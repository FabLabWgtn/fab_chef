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

describe file('/usr/share/kicad/modules/SparkFun-KiCad-Modules') do
    its('link_path') { should eq '/opt/kicad-libraries/SparkFun-KiCad-Libraries/Footprints' }
end

describe file('/usr/share/kicad/library/SparkFun-KiCad-Libraries') do
    its('link_path') { should eq '/opt/kicad-libraries/SparkFun-KiCad-Libraries/Libraries' }
end

describe file('/usr/share/kicad/modules/digikey-footprints.pretty') do
    its('link_path') { should eq '/opt/kicad-libraries/digikey-kicad-library/digikey-footprints.pretty' }
end

describe file('/usr/share/kicad/library/digikey-symbol') do
    its('link_path') { should eq '/opt/kicad-libraries/digikey-kicad-library/digikey-symbols' }
end

describe file('/usr/share/kicad/library/fab.lib') do
 it { should exist }
 it { should be_file }
 its('mode') { should cmp '0644' }
end

describe file('/usr/share/kicad/modules/fab.mod') do
 it { should exist }
 it { should be_file }
 its('mode') { should cmp '0644' }
end

describe file('/etc/guest-session/skel/.config/kicad/fp-lib-table') do
 it { should exist }
 it { should be_file }
 its('mode') { should cmp '0644' }
end

describe file('/opt/kicad-libraries/SparkFun-KiCad-Libraries') do
 it { should exist }
 its('size') { should > 64 }
 it { should be_directory }
end

describe file('/opt/kicad-libraries/digikey-kicad-library') do
 it { should exist }
 its('size') { should > 64 }
 it { should be_directory }
end
