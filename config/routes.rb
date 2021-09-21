Rails.application.routes.draw do
  get '/congress', to: 'congress#get_congress'
  get '/votes/recent', to: 'congress#get_votes'
  get '/votes/:pol', to: 'congress#get_pol_votes'
  get '/reps/:zip', to: 'congress#get_my_pols'
  get '/bills', to: 'congress#get_bills'
  get '/bills/:id', to: 'congress#get_bill'
  get '/finance/:id/:method', to: 'congress#get_finances'
  get '/zip/:lat/:long', to: 'zips#get_zip', constraints: { lat: /\d+\.\d+/, long: /\d+\.\d+/ }
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
