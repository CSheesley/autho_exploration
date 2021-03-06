Rails.application.routes.draw do

  root :to => 'welcome#index'

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/logout', to: "sessions#destroy"

  resources :users, only: [:index, :new, :create, :show]

end
