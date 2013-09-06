RakutenSample::Application.routes.draw do
  get "search_support/index"
  root 'itemsearch#index'
  post '/search' => 'itemsearch#search'
  post '/search_support' => 'search_support#support'
end
