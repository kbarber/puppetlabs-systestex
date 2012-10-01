require 'mocha_standalone'
require 'puppet_acceptance'
require 'systest_dsl'
require 'net/ssh'
require 'net/scp'
require 'net/http'

RSpec.configure do |config|
  # System specific config
  config.add_setting :systest_config

  config.systest_config = 'sample.cfg'

  config.mock_with :mocha
  config.extend RSpec::Puppet::SystemHelpers

  config.before :suite do
  end

  config.after :suite do
  end
end
