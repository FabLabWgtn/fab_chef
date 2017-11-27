# # encoding: utf-8

# Inspec test for recipe guest_setup::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe directory('/var/guest-data') do
    it { should exist }
end

describe file('/etc/guest-session/auto.sh') do
 it { should exist }
 it { should be_executable }
end

describe file('/etc/guest-session/prefs.sh') do
 it { should exist }
 it { should be_executable }
end

describe file('/etc/guest-session/skel/.skip-guest-warning-dialog') do
 it { should exist }
end

describe file('/etc/guest-session/skel/.config/upstart/firefox-with-url.conf') do
 it { should exist }
end

describe group('fabshare') do
    it { should exist }
end
