Rails.application.routes.draw do

  devise_for :users
  root to: "pages#home"

  resources :profiles, except: [:destroy]
  resources :educations, except: [:index, :show]
  resources :works, except: [:index, :show]
  resources :skills

end
