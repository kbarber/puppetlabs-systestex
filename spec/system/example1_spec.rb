describe 'do something' do
  it 'foo' do
  agents.each do |host|
    #it "test stuff on host #{host}" do
      on host, 'echo foo' do |out,err|
        stdout.should =~ /foo/
      end
    #end
  end
  end

  its(:stdout) { should contain(/foo/) }
end
