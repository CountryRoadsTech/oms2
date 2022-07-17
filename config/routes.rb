# frozen_string_literal: true

# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    sessions: 'users/sessions',
    unlocks: 'users/unlocks'
  }

  namespace :admin do
    mount GoodJob::Engine => 'background_jobs'
    mount RailsMiniProfiler::Engine => 'requests' if Rails.env.development?
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
