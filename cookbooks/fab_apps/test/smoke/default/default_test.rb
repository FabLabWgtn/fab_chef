# # encoding: utf-8

# Inspec test for recipe fab_apps::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe package('nano') do
  it { should be_installed }
end

describe package('vim') do
  it { should be_installed }
end

describe package('g++') do
  it { should be_installed }
end

describe package('gcc') do
  it { should be_installed }
end

describe package('make') do
  it { should be_installed }
end

describe package('cmake') do
  it { should be_installed }
end

describe package('meshlab') do
  it { should be_installed }
end

describe package('slic3r') do
  it { should be_installed }
end

describe package('git') do
  it { should be_installed }
end

describe package('vlc') do
  it { should be_installed }
end

describe package('pandoc') do
  it { should be_installed }
end

describe package('gcc-avr') do
  it { should be_installed }
end

describe package('avr-libc') do
  it { should be_installed }
end

describe package('avrdude') do
  it { should be_installed }
end

describe package('openscad') do
  it { should be_installed }
end

describe package('inkscape') do
  it { should be_installed }
end

describe package('gimp') do
  it { should be_installed }
end

describe package('blender') do
  it { should be_installed }
end
describe apt('ppa:thopiekar/cura') do
    it { should exist }
    it { should be_enabled }
end

describe apt('ppa:webupd8team/brackets') do
    it { should exist }
    it { should be_enabled }
end

describe apt('ppa:webupd8team/atom') do
    it { should exist }
    it { should be_enabled }
end

describe apt('ppa:maarten-baert/simplescreenrecorder') do
    it { should exist }
    it { should be_enabled }
end

describe package('cura') do
  it { should be_installed }
end

describe package('cura-plugins-all') do
  it { should be_installed }
end

describe package('atom') do
  it { should be_installed }
end

describe package('brackets') do
  it { should be_installed }
end

describe package('simplescreenrecorder') do
  it { should be_installed }
end
