Rails.application.routes.draw do
  resources :comments
  resources :products

  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  #root 'home_page#index'

  root 'products#index'

  get 'posting', to: 'products#posting'
  get 'posting', to: :product, controller: 'products'
end
