Rails.application.routes.draw do
  # root 'welcome#index'
  get '/', to: 'landing#index'
  get '/register', to: "users#new"
  post '/register', to: "users#create"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/users/:id/discover', to: "users#discover"
  resources :users, only: [:new, :create, :show] do 
    resources :movies, only: [:index, :show] do 
      resources :viewing_party, only: [:index, :show, :create, :new]
    end
  end
end

