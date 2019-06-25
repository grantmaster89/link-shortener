Rails.application.routes.draw do
  root to: "short_links#new"

  namespace :admin do
    resources :short_links, path: "s" do
      member do
        patch :toggle_active_status
      end
    end
  end

  resources :short_links, path: "s", only: [:index, :new, :create, :show, :update]
end
