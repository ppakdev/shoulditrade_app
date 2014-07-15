Rails.application.routes.draw do

  root 'welcome#index'

    # Sessions
  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :users
  resources :trades do
    member do
      put "like", to: "trades#upvote"
      put "dislike", to: "trades#downvote"
    end
  end
end
