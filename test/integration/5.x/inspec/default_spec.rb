[1, 2].each do |d|
  describe file("/mnt/elasticsearch#{d}") do
    it { should be_directory }
    it { should be_owned_by('elasticsearch') }
    it { should be_grouped_into('elasticsearch') }
    its('mode') { should cmp '02750' }
  end
end

# curator and friends should be installed
describe command('/usr/local/bin/curator --version') do
  its('exit_status') { should eql 0 }
end
describe command('/usr/local/bin/curator_cli --version') do
  its('exit_status') { should eql 0 }
end
describe command('/usr/local/bin/es_repo_mgr --help') do
  its('exit_status') { should eql 0 }
end

describe command('/usr/share/elasticsearch/bin/elasticsearch-plugin list') do
  its('exit_status') { should eql 0 }
  its('stdout') { should_not match(/^discovery-ec2$/) }
end
