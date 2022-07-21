# frozen_string_literal: true

json.extract! organization, :id, :admin_user_id, :name, :slug, :description, :domain, :subdomain, :social_media_urls,
              :archived_at, :created_at, :updated_at
json.url organization_url(organization, format: :json)
json.description organization.description.to_s
