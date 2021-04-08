Rails.application.routes.draw do

  authenticated :user do
        root to: 'home#index', as: :authenticated_root
   end

    root to: redirect('/users/sign_in')

  
  resources :lectures do
      resources :comments, only: [:create]
  	member do
  		get "add_to_my_lectures"
  		    	delete '/lectures', to: 'lectures#remove'
    end
    collection do
    	get "my_lectures"
    end

    resources :comments, only: [:create]
  end

   resources :colleges, only: [:create, :destroy]
   
  
  resources :posts do
    resources :comments, only: [:create]
  end
  
	devise_for :users, controllers: {registrations: 'registrations'}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
