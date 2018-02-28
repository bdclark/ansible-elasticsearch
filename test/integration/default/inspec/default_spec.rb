
describe service('elasticsearch') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe file('/var/lib/elasticsearch') do
  it { should be_directory }
  it { should be_owned_by('elasticsearch') }
  it { should be_grouped_into('elasticsearch') }
  its('mode') { should cmp '0750' }
end

describe file('/var/log/elasticsearch') do
  it { should be_directory }
  it { should be_owned_by('elasticsearch') }
  it { should be_grouped_into('elasticsearch') }
  its('mode') { should cmp '0750' }
end

describe file('/etc/elasticsearch') do
  it { should be_directory }
  it { should be_owned_by('root') }
  it { should be_grouped_into('elasticsearch') }
  its('mode') { should cmp '02750' }
end

%w(jvm.options elasticsearch.yml).each do |f|
  describe file("/etc/elasticsearch/#{f}") do
    it { should be_file }
    it { should be_owned_by('root') }
    it { should be_grouped_into('elasticsearch') }
    its('mode') { should cmp '0660' }
  end
end

%w(x-pack ingest-geoip).each do |d|
  describe file("/usr/share/elasticsearch/plugins/#{d}") do
    it { should be_directory }
  end
end
