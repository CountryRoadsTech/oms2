# frozen_string_literal: true

# Generate a user letter avatar for the User's profile picture
class GenerateDefaultUserProfilePictureJob < ApplicationJob
  include LetterAvatar::AvatarHelper

  queue_as :default

  # Generate a default, letter-based profile picture for the user based on their username
  def perform(user)
    profile_picture = letter_avatar_for(user.username, 500)
    user.profile_picture.attach(io: File.open(profile_picture),
                                filename: "#{user.username.parameterize}-profile-picture.png")
    user.save!
  end
end
