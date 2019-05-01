describe command('/usr/share/elasticsearch/bin/elasticsearch-plugin list') do
  its('exit_status') { should eql 0 }
  its('stdout') { should match(/^discovery-ec2$/) }
end
