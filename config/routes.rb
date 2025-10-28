Rails.application.routes.draw do
  devise_for :users
  root "home#index"

  # 投稿は MVP で CRUD まで利用
  resources :posts, only: [ :index, :new, :create, :show, :edit, :update, :destroy ]

  get "up" => "rails/health#show", as: :rails_health_check
end
