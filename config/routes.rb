Rails.application.routes.draw do
  root 'users#new'

  resources :users, except: %i[index show destroy]
end
