Rails.application.routes.draw do
  get '/top' => 'root#top'
  resources :books
end
