Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: "studios#index"

  get '/', to: 'studios#index'
  get '/studios', to: 'studios#index'
  get '/studios/:id', to: 'studios#show'
  get '/movies', to: 'movies#index'
  get '/movies/:id', to: 'movies#show'

end
