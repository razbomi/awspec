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
              },
              s3_destination_description: {
                role_arn: 'arn:aws:iam::123456789012:role/S3Access',
                bucket_arn: 'arn:aws:s3:::my_corporate_bucket',
                prefix: 'my-prefix',
                buffering_hints: {
                  size_in_m_bs: 500,
                  interval_in_seconds: 60
                },
                compression_format: 'Snappy',
                encryption_configuration: {
                  no_encryption_config: 'NoEncryption',
                  kms_encryption_config: {
                    awskms_key_arn: 'arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012'
                  }
                },
                cloud_watch_logging_options: {
                  enabled: true,
                  log_group_name: 'log-group',
                  log_stream_name: 'log-stream'
                },
              },
              processing_configuration: {
                enabled: true,
                processors: [{
                               type: 'Lambda',
                               parameters: [
                                 {
                                   parameter_name: 'LambdaArn',
                                   parameter_value: 'arn:aws:lambda:region:account-id:function:function-name:$LATEST'
                                 },
                                 {
                                   parameter_name: 'NumberOfRetries',
                                   parameter_value: '3'
                                 },
                                 {
                                   parameter_name: 'RoleArn',
                                   parameter_value: 'arn:aws:iam::123456789012:role/LambdaExecution'
                                 },
                                 {
                                   parameter_name: 'BufferSizeInMBs',
                                   parameter_value: '500'
                                 },
                                 {
                                   parameter_name: 'BufferIntervalInSeconds',
                                   parameter_value: '60'
                                 }
                               ]
                             }]
              }
            }
          }
        ],
        has_more_destinations: false,
      }
    }
  }
}
