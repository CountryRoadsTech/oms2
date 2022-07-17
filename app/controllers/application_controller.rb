class ApplicationController < ActionController::Base
  # Enables protection from cross-site request forgery (CSRF) attacks
  protect_from_forgery with: :exception

  # Track which user made which change with Paper Trail
  # before_action :set_paper_trail_whodunnit
end
