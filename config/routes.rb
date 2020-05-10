Rails.application.routes.draw do

  root 'gossips#index'

  resources :gossips
  resources :sessions
  resources :comments
  resources :users, only: [:new, :create, :show]


  get 'home/', to: 'static_pages#home'
  get 'home/:first_name', to: 'static_pages#home'
  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'

end
