Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :teas
      resources :customers
      resources :subscriptions
    end
  end
end
