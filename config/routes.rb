Rails.application.routes.draw do
  devise_for :users

  resources :colors, only: [:index, :new, :create]
  resources :users do
    post :visitor, on: :collection
  end

  root 'colors#index'
end
