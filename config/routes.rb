Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: proc { [200, {}, ['Welcome to my API!']] }
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks],controllers: {
        registrations: 'api/v1/auth/registrations',
      }

      namespace :auth do
        resources :sessions, only: [:index]
      end
      resource :profiles, only: [:show, :update]
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
      # get 'users' => 'users#show'
      # namespace :checkout do
      #   resources :sessions, only: [:create]
      # end
      resources :orders, only: [:index, :create]
      post 'orders/confirm', to: 'orders#confirm'
      get 'orders/determine', to: 'orders#determine'
      resources :order_products, only: [:index, :create]
    end
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # post 'auth/:provider/callback', to: 'api/v1/users#create'
end
