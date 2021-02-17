Rails.application.routes.draw do
  #get 'users/user'
  resources :users, only: %i[new create show]
  resources :sessions, only: %i[new create destroy]
end
