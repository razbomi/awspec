require 'spec_helper'
Awspec::Stub.load 'firehose'

describe firehose('my-firehose') do
  it { should exist }
end

describe firehose('my-firehose') do
  it { should be_active }
end

describe firehose('my-firehose') do
  it { should have_source_type('DirectPut') }
end

describe firehose('my-firehose') do
  it { should have_splunk_destination }
  it {
    should have_splunk_destination
                .hec_endpoint('https://my-splunk.heavy.forwarder')
                .hec_endpoint_type('Raw')
                .hec_token('ABC-123')
                .hec_acknowledgment_timeout_in_seconds(60)
                .retry_options({:duration_in_seconds => 60})
                .cloud_watch_logging_options({
                                               :enabled => true,
                                               :log_group_name => 'log-group',
                                               :log_stream_name => 'log-stream'
                                             }) # TODO: test with different options (logging_options == nill, partial logging)
                .s3_backup_mode('FailedEventsOnly')
  }
end
