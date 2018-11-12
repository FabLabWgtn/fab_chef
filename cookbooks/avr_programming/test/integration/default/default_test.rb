# # encoding: utf-8

# Inspec test for recipe avr_programming::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe package('gcc-avr') do
  it { should be_installed }
end

describe package('avr-libc') do
  it { should be_installed }
end

describe package('avrdude') do
  it { should be_installed }
end

describe user('fab-admin') do
  it 'is included in the dialout group' do
    expect(subject.groups).to include('dialout')
  end
end
