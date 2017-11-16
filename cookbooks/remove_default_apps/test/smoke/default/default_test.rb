# # encoding: utf-8

# Inspec test for recipe remove_default_apps::default

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

describe package('gnome-mines') do
  it { should_not be_installed }
end

describe package('gnome-mahjongg') do
  it { should_not be_installed }
end

describe package('aisleriot') do
  it { should_not be_installed }
end

describe package('gnome-sudoku') do
  it { should_not be_installed }
end

describe package('thunderbird') do
  it { should_not be_installed }
end

describe package('transmission-gtk') do
  it { should_not be_installed }
end

describe file('/usr/share/applications/ubuntu-amazon-default.desktop') do
  it { should_not exist }
end
