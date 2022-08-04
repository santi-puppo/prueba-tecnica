Rails.application.routes.draw do
  put 'campsites/:id/book', to: 'campsites#book'
  resources :campsites
  get 'campgrounds/availables', to: 'campgrounds#availables'
  resources :campgrounds

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
