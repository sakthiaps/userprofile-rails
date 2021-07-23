Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope defaults: { format: 'json' } do
    scope module: :v1 do
      resources :users, only: [] do
        collection do
          post :update_profile
          post :signup
          post :login
          get :profile
        end
      end

      resources :manufacturings, only: [:create]
    end
    root to: "application#index"
  end

end
