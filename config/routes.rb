Rails.application.routes.draw do

  get '/welcome/:user_entry', to: 'staticpage#welcome'
  get '/team', to: 'staticpage#team'
  get '/contact', to: 'staticpage#contact'

  get '/profile/:id', to: 'sessions#profile'
  
  root to: "gossips#index"
  resources :gossips
  resources :authors
  resources :sessions

  # resources :gossips do 
  #   resources :comments
  # end


end



