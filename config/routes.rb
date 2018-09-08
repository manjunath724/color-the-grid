Rails.application.routes.draw do
  devise_for :users

  resources :colors, only: [:index, :create] do
    get :render_the_palette, on: :collection
    get :leaderboard, on: :collection
  end
  
  resources :squares, only: [:index, :update]

  root "colors#index"
end
