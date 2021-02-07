Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  resources :items do
    resources :orders, only: [:index, :create]
  end
  root to: 'items#index'
end
