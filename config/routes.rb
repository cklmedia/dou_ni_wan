DouNiWan::Application.routes.draw do

  

  root 'sessions#new'
  resources :sessions, only: [:new, :create, :destroy]
  match '/signin',  to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  match '/users/key_email/:email', to: 'users#key_email',via:'get'
  match '/users/add_friend/:id', to: 'users#add_friend',via:'get'
  resources :users do
	post 'add_group', :on => :collection
  end

end
