Rails.application.routes.draw do
  resources :posts
  root "home#index"
  # 投稿機能（段階的リリース）
  resources :posts, only: [:index]
  
  # ヘルスチェック用（本番環境で有用）
  get "up" => "rails/health#show", as: :rails_health_check
  
  # 将来的なルーティング（コメントアウト）
  # resources :users, only: [:new, :create, :show]
  # resources :groups, only: [:index, :show, :new, :create]
end
