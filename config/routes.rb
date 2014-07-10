Rails.application.routes.draw do

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/yahoo_info', to: 'sessions#yahoo_info'
  root 'welcome#index'

  resources :users, :proposals

end
