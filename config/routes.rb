Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: [:index, :show, :new, :create]
  resources :attractions, only: [:index, :show, :new, :create, :edit, :update]

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  post '/rides/new', to: 'rides#new'

end
