Rails.application.routes.draw do
  root to: "short_links#new"

  namespace :admin do
    resources :short_links do
      member do
        patch :toggle_active_status
      end
    end
  end

  resources :short_links, only: [:index, :new, :create, :show, :update]

  get "s/:id", to: "short_links#go"
end
