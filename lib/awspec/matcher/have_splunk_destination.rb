RSpec::Matchers.define :have_splunk_destination do
  match do |delivery_stream|
    match = delivery_stream.splunk_destination
    match = match && delivery_stream.splunk_destination.hec_endpoint == @hec_endpoint if @hec_endpoint
    match = match && delivery_stream.splunk_destination.hec_endpoint_type == @hec_endpoint_type if @hec_endpoint_type
    match = match && delivery_stream.splunk_destination.hec_token == @hec_token if @hec_token
    match = match && delivery_stream.splunk_destination.hec_acknowledgment_timeout_in_seconds == @hec_acknowledgment_timeout_in_seconds if @hec_acknowledgment_timeout_in_seconds
    match = match && delivery_stream.splunk_destination.s3_backup_mode == @s3_backup_mode if @s3_backup_mode
    match = match && delivery_stream.splunk_destination.retry_options.to_hash == @retry_options if @retry_options
    match = match && delivery_stream.splunk_destination.cloud_watch_logging_options.to_hash == @cloud_watch_logging_options if @cloud_watch_logging_options
    match
  end

  chain :hec_endpoint do |hec_endpoint|
    @hec_endpoint = hec_endpoint
  end

  chain :hec_endpoint_type do |hec_endpoint_type|
    @hec_endpoint_type = hec_endpoint_type
  end

  chain :hec_token do |hec_token|
    @hec_token = hec_token
  end

  chain :hec_acknowledgment_timeout_in_seconds do |hec_acknowledgment_timeout_in_seconds|
    @hec_acknowledgment_timeout_in_seconds = hec_acknowledgment_timeout_in_seconds
  end

  chain :hec_acknowledgment_timeout_in_seconds do |hec_acknowledgment_timeout_in_seconds|
    @hec_acknowledgment_timeout_in_seconds = hec_acknowledgment_timeout_in_seconds
  end

  chain :s3_backup_mode do |s3_backup_mode|
    @s3_backup_mode = s3_backup_mode
  end

  chain :retry_options do |retry_options|
    @retry_options = retry_options
  end

  chain :cloud_watch_logging_options do |cloud_watch_logging_options|
    @cloud_watch_logging_options = cloud_watch_logging_options
  end

  # diffable
  # TODO: Override error message, because this is not diffable
end

# s3_destination_description.role_arn #=> String
# s3_destination_description.bucket_arn #=> String
# s3_destination_description.prefix #=> String
# s3_destination_description.buffering_hints.size_in_m_bs #=> Integer
# s3_destination_description.buffering_hints.interval_in_seconds #=> Integer
# s3_destination_description.compression_format #=> String, one of "UNCOMPRESSED", "GZIP", "ZIP", "Snappy"

# s3_destination_description.encryption_configuration.no_encryption_config #=> String, one of "NoEncryption"
# s3_destination_description.encryption_configuration.kms_encryption_config.awskms_key_arn #=> String

