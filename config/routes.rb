Rails.application.routes.draw do
  root "home#index"

  # MVP: 一覧・作成・詳細のみ公開（編集/削除は後続Issue）
  resources :posts, only: [ :index, :new, :create, :show ]

  # ヘルスチェック
  get "up" => "rails/health#show", as: :rails_health_check
end
