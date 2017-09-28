Rails.application.routes.draw do
  devise_for :users
  root to: 'channels#show'
  resources :channels, only: [ :show ]
end
