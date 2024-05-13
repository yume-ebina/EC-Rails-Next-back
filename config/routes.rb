Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  namespace :api do
    namespace :v1 do
      resources :products, only: [:index, :show]
      resources :cart_items, only: %i[index create destroy] do
        member do
          put 'increase'
          put 'decrease'
        end
      end
      get 'users' => 'users#show'
    end
  end

  post 'auth/:provider/callback', to: 'api/v1/users#create'
end
