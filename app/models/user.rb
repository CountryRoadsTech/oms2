# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :uuid             not null, primary key
#  admin                  :boolean          default(FALSE), not null
#  approved               :boolean          default(FALSE), not null
#  archived_at            :datetime
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  failed_attempts        :integer          default(0), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  locked_at              :datetime
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  slug                   :text
#  unconfirmed_email      :string
#  unlock_token           :string
#  username               :text             not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_admin                 (admin)
#  index_users_on_approved              (approved)
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_slug                  (slug) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#
class User < ApplicationRecord
  # Include devise user authentication modules. Other one available is :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable,
         :lockable, :timeoutable, :trackable

  include Archivable

  # Track and store changes to this model
  has_paper_trail

  # Use the username attribute as the slug in URLs, store a history of old slugs to redirect to the latest
  extend FriendlyId
  friendly_id :username, use: :history
  # Regenerate the slug and store the old version when the underlying attribute is updated
  def should_generate_new_friendly_id?
    slug.blank? || username_changed?
  end

  validates :username, presence: true
  validates :username, uniqueness: true
  validate :profile_picture_is_correct_format

  has_one_attached :profile_picture

  has_rich_text :biography

  has_many :login_activities, as: :user, inverse_of: :user, dependent: :nullify

  # Override some Devise user authentication methods to supported approved/unapproved and soft deleting users:
  def active_for_authentication?
    super && (self.approved? && self.archived_at.nil?)
  end

  def inactive_message
    return :not_approved unless self.approved?
    return :archived if self.archived_at

    super
  end

  def self.send_reset_password_instructions(attributes = {})
    recoverable = find_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
    if recoverable.persisted?
      if recoverable.approved?
        recoverable.send_reset_password_instructions
      else
        recoverable.errors.add(:base, :not_approved)
      end
    end
    recoverable
  end

  private

  def profile_picture_is_correct_format
    return if !profile_picture.attached? && profile_picture.blob.content_type.starts_with?('image/')

    profile_picture.purge
    errors.add(:profile_picture, 'is not a valid image format.')
  end
end
