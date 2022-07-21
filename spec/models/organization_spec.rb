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
require 'rails_helper'

RSpec.describe Organization, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
