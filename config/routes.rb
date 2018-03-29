Rails.application.routes.draw do
  #resources :sessions
  # home/root can be set with events controller (index)
  resources :users
  resources :events
  root 'events#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
