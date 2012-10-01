require 'spec_helper'

describe 'foo echo test' do
  agents.each do |host|
    context "test stuff on host #{host}" do
#      apply_manifest_on host, <<-EOS
#        file { '/tmp/foo':
#          ensure => 'file',
#          content => 'bleah',
#        }
#      EOS

      on host, 'cat /etc/hosts'

      its(:stdout) { should =~ /deban/ }
      its(:stderr) { should be_empty }
      its(:code) { should be 0 }
    end
  end
end
