StadinJutut::Application.routes.draw do
  root 'subscriptions#new'
  
  resources :subscriptions, only: [:new, :create, :show], path: 's'
end
