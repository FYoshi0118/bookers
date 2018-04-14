Rails.application.routes.draw do
  get '/' => 'root#top'
  resources :books
end
