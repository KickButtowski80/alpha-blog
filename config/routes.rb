Rails.application.routes.draw do
 
  get 'users/new'
  root 'pages#homepage'
  get 'about' => 'pages#about'
  
  resources :articles do 
    resources :comments
  end
  
  mount ActionCable.server => '/cable'
  
  get 'signup' , to: 'users#new'
  # post 'users', to: 'users#create'
  # or 
  resources :users, except: [:new]
  
  get 'login' , to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :categories, except: [:destroy]
end
