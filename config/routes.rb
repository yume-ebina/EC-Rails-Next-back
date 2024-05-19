Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: proc { [200, {}, ['Welcome to my API!']] }
  namespace :api do
    namespace :v1 do
      resource :profiles, only: [:show, :update]
      resources :users, only: [:index]
      resources :products, only: [:index, :show]
      resources :cart_items, only: [:index, :create, :destroy] do
        collection do
          delete 'destroy_all'
        end
        # member do
        #   put 'increase'
        #   put 'decrease'
        # end
      end
      get 'users' => 'users#show'
      # namespace :checkout do
      #   resources :sessions, only: [:create]
      # end
      resources :orders, only: [:index, :create]
      post 'orders/confirm', to: 'orders#confirm'
      resources :order_products, only: [:index, :create]
    end
  end

  post 'auth/:provider/callback', to: 'api/v1/users#create'
end
