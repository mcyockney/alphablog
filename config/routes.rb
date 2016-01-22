Rails.application.routes.draw do
  root 'pages#home'
  get '/home', to: 'pages#home'
  get '/about', to: 'pages#about'
  
  resources 'articles'

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

end
