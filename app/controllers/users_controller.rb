# frozen_string_literal: true

# Adds non-user authentication actions to User
class UsersController < ApplicationController
  def show
    # Authorization must be performed outside the error catch block
    authorize :user, :show?
    begin
      @user = User.friendly.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      # Render the 404 page if the record cannot be found with the given slug
      render file: Rails.public_path.join('404.html'), status: :not_found and return
    end
  end
end
