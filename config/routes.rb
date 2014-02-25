Beers::Application.routes.draw do
  resources :beers
  resources :breweries
  get '/demo' => 'pages#demo'
  root 'pages#index'
end
