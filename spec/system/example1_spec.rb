require 'spec_helper'

describe 'foo echo test' do
  agents.each do |host|
    context "test stuff on host #{host}" do
      on host, 'echo foo'
      its(:stdout) { should =~ /foo/ }
      its(:stderr) { should be_empty }
      its(:code) { should be 0 }
    end
  end
end
