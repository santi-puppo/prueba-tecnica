Rails.application.routes.draw do
  resources :campsites
  resources :campgrounds
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
