Rails.application.routes.draw do
  resources :artists, except: :create do
    resources :pieces, only: [:index, :show]
  end

  resources :pieces, except: [:index, :show]

  post '/register', to: 'artists#create'

  post '/login', to: 'authentication#login'
  get '/verify', to: 'authentication#verify'
end
