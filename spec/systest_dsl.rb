require 'ostruct'

module RSpec; end
module RSpec::Puppet; end

module RSpec::Puppet::SystemHelpers
  def logger
    @logger ||= PuppetAcceptance::Logger.new(options)
  end

  def options
    @options ||= {
      :debug => true,
      :config => 'sample.cfg',
      :keyfile => "#{ENV['HOME']}/.ssh/id_rsa",
    }
  end

  def config
    @config ||= PuppetAcceptance::TestConfig.new('sample.cfg', options)
  end

  def hosts(desired_role = nil)
    opts = options
    opts[:logger] = logger
    @hosts = []
    config['HOSTS'].each_key do |name|
      @hosts << PuppetAcceptance::Host.create(name, opts, config)
    end

    @hosts.select do |host|
      desired_role.nil? or host['roles'].include?(desired_role)
    end
  end

  def agents
    hosts 'agent'
  end

  def on(host, cmd)
    command = PuppetAcceptance::Command.new(cmd)
    result = host.exec(command, {})
    subject do
      OpenStruct.new({
        :stdout => result.stdout,
        :stderr => result.stderr,
        :code => 0,
      })
    end
  end

  def apply_manifest_on(dest, ppt)
    subject do
      OpenStruct.new({
        :stdout => 'foo',
        :stderr => '',
        :code => 0,
      })
    end
  end
end
