# # encoding: utf-8

# Inspec test for recipe guest_login_setup::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

# This is an example test, replace it with your own test.
describe port(80), :skip do
  it { should_not be_listening }
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

describe directory('/var/guest-data') do
    it { should exist }
end
