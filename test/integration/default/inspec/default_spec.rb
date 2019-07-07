describe file('/var/lib/elasticsearch') do
  it { should be_directory }
  it { should be_owned_by('elasticsearch') }
  it { should be_grouped_into('elasticsearch') }
  its('mode') { should cmp '02750' }
end

# plugins should be installed
describe command('/usr/share/elasticsearch/bin/elasticsearch-plugin list') do
  its('exit_status') { should eql 0 }
  its('stdout') { should match(/^discovery-ec2$/) }
end

# curator and friends should NOT be installed
describe command('/usr/local/bin/curator --version') do
  its('exit_status') { should eql 1 }
end

describe command('/usr/local/bin/curator_cli --version') do
  its('exit_status') { should eql 1 }
end

describe command('/usr/local/bin/es_repo_mgr --help') do
  its('exit_status') { should eql 1 }
end
