Rails.application.routes.draw do
  # get 'users/index'
  # get 'users/create'
  # get 'users/update'
  # get 'users/destroy'
  # get 'users/new'
  # get 'users/show'
  root 'users#index'
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
