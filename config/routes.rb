Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/logout', to: 'sessions#logout'
  get '/auth/deploy/callback', to: 'sessions#callback'
  get '/auth/failure', to: 'sessions#failure'
end
