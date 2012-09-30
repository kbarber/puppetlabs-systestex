require 'ostruct'

module RSpec; end
module RSpec::Puppet; end

module RSpec::Puppet::SystemHelpers
  def agents
    ['foo', 'bar', 'baz']
  end

  def on(dest, cmd)
    subject do
      OpenStruct.new({
        :stdout => 'foo',
        :stderr => '',
        :code => 0,
      })
    end
  end
end
