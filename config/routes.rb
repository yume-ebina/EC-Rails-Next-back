Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  namespace :api do
    namespace :v1 do
      resources :products, only: [:index, :show]
    end
  end

  post 'auth/:provider/callback', to: 'api/v1/users#create'
end
