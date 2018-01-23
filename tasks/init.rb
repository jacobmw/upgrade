#!/opt/puppetlabs/puppet/bin/ruby
require 'facter'
require 'json'
require 'puppet'

def apt_hold(excludes)
  excludes.each do |exclude|
    @hold = "apt-mark hold #{exclude}"
    stdout, stderr, status = Open3.capture3(@hold)
    raise Puppet::Error, stderr if status != 0
    { status: stdout.strip }
  end
end

def apt_update
  cmd_string = 'apt-get upgrade -y'
  stdout, stderr, status = Open3.capture3(cmd_string)
  raise Puppet::Error, stderr if status != 0
  { status: stdout.strip }
end

def apt_unhold(excludes)
  excludes.each do |exclude|
    @hold = "apt-mark unhold #{exclude}"
    stdout, stderr, status = Open3.capture3(@hold)
    raise Puppet::Error, stderr if status != 0
    { status: stdout.strip }
  end
end

def yum_update(excludes)
  exclude = excludes.join(',') unless excludes.nil?
  command = 'yum update -y'
  command << " --exclude=#{exclude}" unless exclude.nil?
  stdout, stderr, status = Open3.capture3(command)
  raise Puppet::Error, stderr if status != 0
  { status: stdout.strip }
end

params = JSON.parse(STDIN.read)
excludes = params['excludes']

begin
  case Facter.value(:osfamily)
  when 'Debian'
    if excludes
      result = apt_hold(excludes), apt_update, apt_unhold(excludes)
    else
      result = apt_update
    end
  when 'RedHat'
    result = yum_update(excludes)
  end
  puts result.to_json
  exit 0
rescue Puppet::Error => e
  puts({ status: 'failure', error: e.message }.to_json)
  exit 1
end
