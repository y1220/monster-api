Rails.application.routes.draw do
  resources :players

  get '/login', to: 'players#login'
  put '/role', to: 'players#update_role'
  post '/questions', to: 'questions#create'
  get '/questions/pending', to: 'questions#pending'


  # root to: "admin#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
