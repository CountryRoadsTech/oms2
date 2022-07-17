# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  namespace :admin do
    mount GoodJob::Engine => 'background_jobs'
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
