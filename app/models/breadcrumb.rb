# frozen_string_literal: true

# Breadcrumb is a non-datbase backed model used to track the user's current location in the website
class Breadcrumb
  attr_reader :name, :url

  def initialize(name, url)
    @name = name
    @url = url
  end

  def link?
    @url.present?
  end
end
