# frozen_string_literal: true

# Sets UUIDs as the default primary key type in generated database migrations
Rails.application.config.generators do |g|
  g.orm :active_record, primary_key_type: :uuid
end
