Rails.application.routes.draw do
  root "home#index"

  resources :monsters, only: [:index, :show] do
    member do
      get "state/:state_id", to: "monsters#state", as: "state"  # state_monster_path が使用可能
    end
  end

  # 検索履歴削除用
  delete "search_histories/:id", to: "home#destroy_history", as: "destroy_history"

  # その他
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
