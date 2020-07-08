Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do 
    member do
      get 'show_post'
    end
  end
  resources :users do 
  member do
    get 'show_user_image'
  end
end
  root 'homes#start'
  get '/home/about', to:'homes#about'
end
