# frozen_string_literal: true

# This policy defines who is allowed to perform each action on Organizations
class OrganizationPolicy < ApplicationPolicy
  # Only admins can view the list of all organizations.
  def index?
    user&.admin?
  end

  # Everyone can view an organization.
  def show?
    true
  end

  # Only admins can create a new organization.
  def create?
    user&.admin?
  end

  # Only admins can update an organization.
  def update?
    user&.admin?
  end

  # Only admins can destroy an organziation.
  def destroy?
    user&.admin?
  end
end
