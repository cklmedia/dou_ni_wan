DouNiWan::Application.routes.draw do
  resources :users
  root 'sessions#new'
  resources :sessions, only: [:new, :create, :destroy]
  match '/signin',  to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
end
