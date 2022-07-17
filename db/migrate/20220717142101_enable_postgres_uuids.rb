# frozen_string_literal: true

# Required to use UUID as a key type in the database
class EnablePostgresUuids < ActiveRecord::Migration[7.0]
  def change
    enable_extension('pgcrypto') unless extension_enabled?('pgcrypto')
  end
end
