# frozen_string_literal: true

# This migration creates the Organization resource
class CreateOrganizations < ActiveRecord::Migration[7.0]
  def change
    create_table :organizations, id: :uuid do |t|
      t.belongs_to :user, null: false, foreign_key: true, type: :uuid

      t.text :name, null: false
      t.text :slug

      t.text :domain
      t.text :subdomain

      t.jsonb :social_media_urls, default: {
        facebook_url: ''
      }

      t.datetime :archived_at
      t.timestamps
    end

    add_index :organizations, :name, unique: true
    add_index :organizations, :slug, unique: true
    add_index :organizations, :domain, unique: true
    add_index :organizations, :subdomain, unique: true
  end
end
