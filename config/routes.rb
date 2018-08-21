Rails.application.routes.draw do
  root 'pages#homepage'
  get 'about' => 'pages#about'  
end
