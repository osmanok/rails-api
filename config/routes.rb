Rails.application.routes.draw do
  authenticated :user do
    devise_scope :user do 
      root "devise/registrations#edit", as: :authenticated_root
    end
  end

  devise_scope :user do 
    root "devise/sessions#new"
  end

  devise_for :users

  namespace :user do
    resource :private_api_keys, only: :update
  end

  namespace :api do
    namespace :v1 do
      defaults format: :json do
        resources :posts, only: [:index, :create, :show, :update, :destroy] do
          resources :comments, only: [:index, :create, :show, :update, :destroy] do
            patch :approve, on: :member
            patch :deny, on: :member
          end
        end
        resources :relationships, only: %i[create destroy]
        get "dashboard", to: "dashboard#index", as: "dashboard"
        get "feed", to: "feed#index", as: "feed"
      end
    end
  end
  
end
