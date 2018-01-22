#!/opt/puppetlabs/puppet/bin/ruby
require 'facter'
require 'json'

def update(excludes)
  case Facter.value(:osfamily)
  when 'Debian'
    excludes.each do |exclude|
      system("apt-mark hold #{exclude}")
    end
    system('apt-get upgrade -y')
    excludes.each do |exclude|
      system("apt-mark unhold #{exclude}")
    end
  when 'RedHat'
    exclude = excludes.join(',')
    command = "yum update --exclude=#{exclude} -y"
  end
  system(command)
  stdout, stderr, status = Open3.capture3(command)
  raise Puppet::Error, stderr if status != 0
  { status: stdout.strip }
end

params = JSON.parse(STDIN.read)
excludes = params['excludes']

begin
  result = update(excludes)
  puts result.to_json
  exit 0
rescue Puppet::Error => e
  puts({ status: 'failure', error: e.message }.to_json)
  exit 1
end
