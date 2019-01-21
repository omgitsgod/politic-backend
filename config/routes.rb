Rails.application.routes.draw do
  resources :conversations, only: [:index, :create]
  resources :messages, only: [:create]
  resources :articles
  mount ActionCable.server => '/cable'
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end
end
