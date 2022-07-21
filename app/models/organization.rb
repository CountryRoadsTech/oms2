# frozen_string_literal: true

# == Schema Information
#
# Table name: organizations
#
#  id                :uuid             not null, primary key
#  archived_at       :datetime
#  domain            :text
#  name              :text             not null
#  slug              :text
#  social_media_urls :jsonb
#  subdomain         :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :uuid             not null
#
# Indexes
#
#  index_organizations_on_domain     (domain) UNIQUE
#  index_organizations_on_name       (name) UNIQUE
#  index_organizations_on_slug       (slug) UNIQUE
#  index_organizations_on_subdomain  (subdomain) UNIQUE
#  index_organizations_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_7b93e0061c  (user_id => users.id)
#
class Organization < ApplicationRecord
  include Archivable

  # Track and store changes to this model
  has_paper_trail

  # Use the name attribute as the slug in URLs, store a history of old slugs to redirect to the latest
  extend FriendlyId
  friendly_id :name, use: :history
  # Regenerate the slug and store the old version when the underlying attribute is updated
  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end

  validates :name, :subdomain, :domain, presence: true
  validates :name, :subdomain, :domain, uniqueness: true

  validate :logo_is_correct_format

  belongs_to :admin_user, class_name: 'User'
  has_many :users, inverse_of: :organization, dependent: :nullify

  has_rich_text :description

  has_one_attached :logo

  private

  def logo_is_correct_format
    return if !logo.attached? && logo.blob.content_type.starts_with?('image/')

    logo.purge
    errors.add(:logo, 'is not a valid image format.')
  end
end
