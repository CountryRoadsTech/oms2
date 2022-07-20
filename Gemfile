# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

# Use the latest, stable version of Rails
gem 'rails', '~> 7.0.3', '>= 7.0.3.1'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'importmap-rails'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# Use Redis adapter to run Action Cable in production and as the application's cache store
gem 'redis', '~> 4.0'

# Use Connection Pool to increase the number of connections to the Redis server per process
gem 'connection_pool'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Sass to process CSS
gem 'sassc-rails'

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem 'image_processing', '~> 1.2'

# Use Bootstrap as the main CSS framework
gem 'bootstrap', '~> 5.1.3'

# Use Good Job as the Active Job adapter for background job processing
gem 'good_job'

# Hiredis is a high-speed client library for connecting to Redis servers
gem 'hiredis'

# Simple Form is used to simplify creating forms
gem 'simple_form'

# Friendly ID allows setting a model attribute other than ID for its URL slug
gem 'friendly_id', '~> 5.4.2'

# Paper Trail tracks and stores changes to models
gem 'paper_trail'

# Pagy is used to paginate models in views
gem 'pagy', '~> 5.10'

# Local Time is used to display timestamps to users in their local timezone
gem 'local_time'

# Devise is used to add user authentication
gem 'devise'

# Authtrail is used to track and store login attempts
gem 'authtrail'

# Geocoder is used to get addresses from IP addresses
gem 'geocoder'

# Letter Avatar is used to generate default profile pictures for users who do not upload one
gem 'letter_avatar'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: [:mri, :mingw, :x64_mingw]

  # Rubocop is used to enforce coding style through static analysis
  gem 'rubocop', require: false
  # Rubocop Rails adds Rails specific checks to Rubocop
  gem 'rubocop-rails', require: false
  # Rubocop RSpec adds RSpec test specific checks to Rubocop
  gem 'rubocop-rspec', require: false
  # Rubocop Rake adds Rake task specific checks to Rubocop
  gem 'rubocop-rake', require: false
  # Rubocop Performance adds performance specific checks to Rubocop
  gem 'rubocop-performance', require: false

  # Brakeman is used for static security analysis
  gem 'brakeman'

  # RSpec is used to replace the default testing framework
  gem 'rspec-rails'
  # Capybara is used to write integration/feature tests
  gem 'capybara'
  # Selenium Webdriver is used to simulate how a real user interacts with the web browser during testing
  gem 'selenium-webdriver'
  # Factory Bot is used to replace the default tests fixtures
  gem 'factory_bot_rails'
  # Shoulda Matchers adds many, common one-line RSpec test matchers
  gem 'shoulda-matchers'
  # Faker is used to generate pseudorandom test data
  gem 'faker'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Use Annotate to automatically add a comment with the database table schema to the top of relevant Rails files
  gem 'annotate'

  # Rails Mini Profiler is used to profile requests in a performance dashboard
  gem 'rails_mini_profiler'

  # Stackprof is used by Rails Mini Profiler to record Flamegraphs
  gem 'stackprof'

  # Bullet is used to detect N+1 database queries that should be optimized
  gem 'bullet'

  # Overcommit is used to run checks before each 'git commit'
  gem 'overcommit'
end
