Aws.config[:firehose] = {
  stub_responses: {
    describe_delivery_stream: {
      delivery_stream_description: {
        delivery_stream_name: 'my-firehose',
        delivery_stream_arn: 'arn:aws:firehose:partition-1:1234567890:deliverystream/my-firehose',
        delivery_stream_status: 'ACTIVE',
        delivery_stream_type: 'DirectPut',
        version_id: '1',
        destinations: [
          {
            destination_id: 'destination-001',
            splunk_destination_description: {
              hec_endpoint: 'https://my-splunk.heavy.forwarder',
              hec_endpoint_type: 'Raw',
              hec_token: 'ABC-123',
              hec_acknowledgment_timeout_in_seconds: 60,
              s3_backup_mode: 'FailedEventsOnly',
              retry_options: {
                duration_in_seconds: 60
              },
              cloud_watch_logging_options: {
                enabled: true,
                log_group_name: 'log-group',
                log_stream_name: 'log-stream'
              }
            }
          }
        ],
        has_more_destinations: false
      }
    }
  }
}
