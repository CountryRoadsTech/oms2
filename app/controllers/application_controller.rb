# frozen_string_literal: true

# The base controller all other controllers within the application inherit from
# Anything defined here happens for all actions in all controllers, where applicable
class ApplicationController < ActionController::Base
  # Enables protection from cross-site request forgery (CSRF) attacks
  protect_from_forgery with: :exception

  # Track which user made which change with Paper Trail
  # before_action :set_paper_trail_whodunnit

  # Include Pagination's backend methods
  include Pagy::Backend

  # Store Breadcrumbs for which pages the user is currently on
  helper_method :breadcrumbs

  def breadcrumbs
    @breadcrumbs ||= []
  end

  def add_breadcrumb(name, url = nil)
    breadcrumbs << Breadcrumb.new(name, url)
  end
end
