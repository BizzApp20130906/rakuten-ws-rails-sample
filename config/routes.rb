RakutenSample::Application.routes.draw do
  get "search_support/index"
  root 'itemsearch#index'
  post '/search' => 'itemsearch#search'
end
