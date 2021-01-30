Rails.application.routes.draw do
  devise_for :users
  resources :items do
    resources :orders, only: :index
  end
  root to: 'items#index'
end
