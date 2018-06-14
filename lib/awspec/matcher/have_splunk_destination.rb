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
    match = match && delivery_stream.splunk_destination.s3_destination_description.to_hash == @s3_destination_description if @s3_destination_description
    match = match && delivery_stream.splunk_destination.processing_configuration.to_hash == @processing_configuration if @processing_configuration
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

  chain :s3_destination_description do |s3_destination_description|
    @s3_destination_description = s3_destination_description
  end

  chain :processing_configuration do |processing_configuration|
    @processing_configuration = processing_configuration
  end

  # diffable
  # TODO: Override error message, because this is not diffable
end