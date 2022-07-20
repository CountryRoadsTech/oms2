# frozen_string_literal: true

# Controls who can perform (non authentication)-user actions
class UserPolicy < ApplicationPolicy
  # Everyone can view a user's profile
  def show?
    true
  end
end
