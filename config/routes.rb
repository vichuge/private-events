Rails.application.routes.draw do
  # get 'events/index'
  # get 'users/user'
  root 'events#index'
  resources :events, only: %i[index new create show]
  resources :users, only: %i[new create show]
  resources :sessions, only: %i[new create destroy]
end
