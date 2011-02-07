DemoApp::Application.routes.draw do
  root :to => "pages#home"
  
  resources :microposts
  resources :users

  get "users/new"
  
  get "pages/home"
  get "pages/contact"
  get "pages/about"
  get "pages/help"
  
  match '/signup',  :to => 'users#new'
  match '/contact', :to => 'pages#contact'
  match '/about',   :to => 'pages#about'
  match '/help',    :to => 'pages#help'
  
  
end
