# frozen_string_literal: true

AuthTrail.geocode = true

# Store the user on failed attempts
AuthTrail.transform_method = lambda do |data, _request|
  data[:user] ||= User.find_by(email: data[:identity])
end
