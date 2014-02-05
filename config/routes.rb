Beers::Application.routes.draw do
  resources :beers
  resources :breweries
  root 'pages#index'
end
