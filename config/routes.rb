Rails.application.routes.draw do
  root to: "short_links#new"

  namespace :admin do
    resources :short_links
  end

  resources :short_links, only: [:index, :new, :create, :show, :update]
  get "s/:short_url", to: "short_links#index"
end
