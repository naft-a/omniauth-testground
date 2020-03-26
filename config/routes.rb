Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/logout', to: 'auth#logout'
  get '/auth/deploy/callback', to: 'auth#callback'
  get '/auth/failure', to: 'auth#failure'
end
