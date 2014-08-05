IntroToRails::Application.routes.draw do

  root :to => 'categories#index'
  get '/about' => 'pages#about', as: 'about'
  get '/contact' => 'pages#contact', :as => 'contact'

  resources :categories do
    resources :posts
  end

end
