# frozen_string_literal: true

# The base controller all other controllers within the application inherit from
# Anything defined here happens for all actions in all controllers, where applicable
class ApplicationController < ActionController::Base
  # Enables protection from cross-site request forgery (CSRF) attacks
  protect_from_forgery with: :exception

  # Enables user authorization
  include Pundit
  # Ensure user authorization is performed for every controller action (unless explicitly skipped)
  after_action :verify_authorized
  # Display an alert message or redirect to log in, instead of throwing an error, if the user is not authorized
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized_error

  # Track which user made which change with Paper Trail
  before_action :set_paper_trail_whodunnit

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

  private

  def user_not_authorized_error
    if current_user
      # Redirect to the previous page with an alert message
      flash[:alert] = 'You are not allowed to perform this action.'
      redirect_to(request.referer || root_path)
    else
      # Redirect to the sign in page
      authenticate_user!
    end
  end
end
