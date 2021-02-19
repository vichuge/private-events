Rails.application.routes.draw do
  # get 'events/index'
  # get 'users/user'
  root 'events#index'
  resources :events, only: %i[index new create show], to: 'show'
  resources :users, only: %i[index new create show]
  resources :sessions, only: %i[new create destroy]
  resources :invitations, only: %i[create]

  scope :sessions do
    get 'sign_out' => 'sessions#destroy'
  end
end
