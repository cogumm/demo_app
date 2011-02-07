DemoApp::Application.routes.draw do
  resources :microposts
  resources :users
  
  get "pages/home"
  get "pages/contact"

  #root :to => "user#index"
end
