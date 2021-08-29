Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :characters
  resources :movies
  resources :genders

  post 'signin', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
