Rails.application.routes.draw do
  devise_for :users

  resources :colors, only: [:index, :new, :create]
  resources :users

  root "colors#index"
end
