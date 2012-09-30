require 'mocha_standalone'
require 'acceptance_dsl'

RSpec.configure do |config|
  config.mock_with :mocha
  config.extend RSpec::Puppet::SystemHelpers
end
