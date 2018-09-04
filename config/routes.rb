Rails.application.routes.draw do

	resources :posts do
		member do 
			post :like
		end
		# post 'posts/:id', to: 'posts#like', as: 'like'
		resources :comments do
			member do 
				post :report, to: 'comments#report', as: 'report'
			end
		end
	end

	devise_for :users
 
  devise_for :admins, controllers: {
		sessions: 'admins/sessions', registrations: 'admins/registrations'
	}

	authenticated :admin do
		root to: 'admins/dashboard#index'
	end

	authenticated :user do
		get 'view_profile' , to: 'viewprofile#view'		
	end

  root to: 'posts#index'
 
  # resources :posts do
  # 	member do
  # 		post :like
  # 	end

  # 	resources :comments do
  # 		member do
	 #  		post :report
  # 		end
  # 	end
  # end
end