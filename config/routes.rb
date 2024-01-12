Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/register', to: 'users#new'
  post '/register', to: 'users#create'
  get '/posts', to: 'posts#index'

  root 'sessions#new'

  namespace :api do
    resources :posts, only: [:index]
  end
end


