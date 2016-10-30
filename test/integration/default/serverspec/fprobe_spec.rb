require 'serverspec'

# Required by serverspec
set :backend, :exec

## Use Junit formatter output, supported by jenkins
#require 'yarjuf'
#RSpec.configure do |c|
#    c.formatter = 'JUnit'
#end

describe package('fprobe-ulog'), :if => os[:family] == 'redhat' do
  it { should be_installed }
end

describe package('fprobe'), :if => os[:family] == 'ubuntu' || os[:family] == 'debian' do
  it { should be_installed }
end

#describe service('fprobe-ulog'), :if => os[:family] == 'redhat' do
#  it { should be_enabled }
#  it { should be_running }
#end

describe service('fprobe'), :if => os[:family] == 'ubuntu' || os[:family] == 'debian' do
  it { should be_enabled }
  it { should be_running }
end

describe file('/usr/bin/fprobe-ulog'), :if => os[:family] == 'redhat' do
  it { should be_executable }
end
describe process("fprobe-ulog"), :if => os[:family] == 'redhat' do
  its(:user) { should eq "root" }
#  its(:args) { should match /-c 32000\b/ }
end
